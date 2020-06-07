# -*- coding: utf-8 -*-
"""
Created on Wed Jun  3 10:17:46 2020

@author: lin ma wei
"""

# import flask related
from flask import Flask, request, abort
# import linebot related
from linebot import (
    LineBotApi, WebhookHandler
)
from linebot.exceptions import (
    InvalidSignatureError
)
from datetime import datetime

import json
import requests

from linebot.models import (
    MessageEvent, TextMessage, TextSendMessage,
    LocationSendMessage, ImageSendMessage, StickerSendMessage
)

# create flask server
app = Flask(__name__)
# your linebot message API - Channel access token (from LINE Developer)
line_bot_api = LineBotApi('t2mhwLg4qSS9ZaC+fYGYmQOYIwtTNnfhkdQDoNZ74C8PWe4glYgRZNs7Uxl/a0nQZsyh8l97sCDzQ02Ue3b7bEsY0QB/gTZghEdzzxobQFFKZrxkiwfkUxYQqP1sv5UwRk0QZpSTxY8rYpuHcVcW0QdB04t89/1O/w1cDnyilFU=')
# your linebot message API - Channel secret
handler = WebhookHandler('f7d83a543f5007b1c33d07559157fbce')

@app.route("/callback", methods=['POST'])
def callback():
    # get X-Line-Signature header value
    signature = request.headers['X-Line-Signature']

    # get request body as text
    body = request.get_data(as_text=True)
    app.logger.info("Request body: " + body)

    # handle webhook body
    try:
        print('receive msg')
        handler.handle(body, signature)
    except InvalidSignatureError:
        print("Invalid signature. Please check your channel access token/channel secret.")
        abort(400)
    return 'OK'

# handle msg
@handler.add(MessageEvent, message=TextMessage)
def handle_message(event):
    # get user info & message
    user_id = event.source.user_id
    msg = event.message.text 
    user_name = line_bot_api.get_profile(user_id).display_name
    time = datetime.now()
    
    # get msg details
    print('msg from [', user_name, '](', user_id, ') : ', msg,time)

    
 # import for database
    import pyodbc
    
    # connect to database
    connect = pyodbc.connect('DRIVER={SQL Server};SERVER=localhost;PORT=12345;DATABASE=HOUSEDB;UID=blueteam;PWD=houseproject')
    cursor = connect.cursor()
    
    #store text_msg
    cursor.execute('insert into LineBotHistoryMessage(user_name , user_id , msg , time)values (? , ? , ?, ?)', (user_name, user_id,msg,time))
    connect.commit()
    
    # implement reservation
    if msg == '銀行方案':
        bank = cursor.execute("SELECT * FROM BankRate order by firstrate")
        bank_text = '以下為所有銀行方案利率（低到高）\n（編號／銀行／方案／利率）：\n'
        for bank in bank:
            bank_text =bank_text + str(bank[0])+'／' + str(bank[1]) +'／'+bank[2] +'／'+str(round(bank[4]*100,2))+'%'+ '\n'
            
        line_bot_api.reply_message(event.reply_token, 
                                   TextSendMessage(text = bank_text))
    elif msg[0:3] == '想知道':
        id_bank = msg[3:]
        bankdetail = cursor.execute("SELECT * FROM BankRate where id_bank = ?", (id_bank))
        found = False
        for bankdetail in bankdetail:
            id1 = str(bankdetail[0])
            urlx = int(bankdetail[4])
            url1 = str(urlx)
            url = url1.replace(url1[-1], "")
            if id1 == id_bank:
                found = True
                bankdetail_text= bankdetail[1] +'／'+bankdetail[2] +'／'+str(bankdetail[3])+url
                line_bot_api.reply_message(event.reply_token, 
                                   TextSendMessage(text = bankdetail_text))
            
        if found == False:
                line_bot_api.reply_message(event.reply_token, 
                                   TextSendMessage(text ='沒有此方案'))
    elif msg[0:2] == '最近':
        bank_name = msg[2:]
        loc = "https://www.google.com/maps/search/"+ bank_name
        line_bot_api.reply_message(event.reply_token, 
                                   TextSendMessage(text = loc ))

    else:
       line_bot_api.reply_message(event.reply_token,[ 
                                   TextSendMessage(text = '親愛的' + user_name + '您好！\n請問需要什麼樣的服務？ '),
                                   TextSendMessage(text = '輸入：銀行方案 \n 可看所有銀行方案利率。'),
                                   TextSendMessage(text = '輸入：想知道xx \n（xx=編號，編號可從所有銀行方案中看到） \n可收到銀行方案連結。'),
                                   TextSendMessage(text = '輸入：最近xxxx \n （xxxx=銀行名稱）可顯示您附近的銀行。'),
                                   ])

# run app
if __name__ == "__main__":
    app.run(host='127.0.0.1', port=12345)
    
