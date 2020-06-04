import requests
import time
from selenium import webdriver
from selenium.webdriver.support.ui import Select
from bs4 import BeautifulSoup
options = webdriver.ChromeOptions()
options.add_argument("headless")
driverPath = r"D:\\0519\\VueWorkSpace\\Vue\\chromedriver.exe"

def get_coordinate(addr):
    browser = webdriver.Chrome(driverPath)
    browser.get("http://www.map.com.tw/")
    search = browser.find_element_by_id("searchWord")
    search.clear()
    search.send_keys(addr)
    browser.find_element_by_xpath("/html/body/form/div[10]/div[2]/img[2]").click() 
    time.sleep(2)
    iframe = browser.find_elements_by_tag_name("iframe")[1]
    browser.switch_to.frame(iframe)
    coor_btn = browser.find_element_by_xpath("/html/body/form/div[4]/table/tbody/tr[3]/td/table/tbody/tr/td[2]")
    coor_btn.click()
    coor = browser.find_element_by_xpath("/html/body/form/div[5]/table/tbody/tr[2]/td")
    print(coor.text)
    coor = coor.text.strip().split(" ")
    lat = coor[-1].split("：")[-1]
    print(lat)
    log = coor[0].split("：")[-1]
    print(log)
    browser.quit()
    return (lat, log)

get_coordinate("台北市中山區樂群二路30巷")