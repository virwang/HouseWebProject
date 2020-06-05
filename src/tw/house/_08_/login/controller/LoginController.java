package tw.house._08_.login.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.house._08_.login.model.MemberLoginService;
import tw.house._08_.mail.model.MailService;
import tw.house._08_.register.model.MemberBean;



@Controller
@SessionAttributes(names = {"memberBean"})
public class LoginController {
	@Autowired
	private MemberLoginService loginService;
	@Autowired
	private MailService mailService;
	@GetMapping(path = "/login")
	public String turntologin() {
		return "_08_login";
	}	
	@RequestMapping(path = {"springlogin.do"},method = {RequestMethod.POST})
	public  String loginCheckAction(@RequestParam("account")String account,
			@RequestParam("psw") String psw,Model m) {
		HashMap<String, String> errorMsg = new HashMap<String, String>();
//		m.addAttribute("ErrorMsgKey", errorMsg);		
		if(account==null||account.trim().length()==0) {
			errorMsg.put("AccountError", "帳號必須輸入");
			}
		if(psw==null||psw.trim().length()==0) {
			errorMsg.put("PswError", "密碼必須輸入");
		}
		m.addAttribute("ErrorMsgKey", errorMsg);		
		if(!errorMsg.isEmpty()) {
			return "_08_login";
		}		
		MemberBean checkBean = loginService.checkAccPwd(account, psw);
		if(checkBean !=null) {
			m.addAttribute("memberBean", checkBean);
		}else {
			errorMsg.put("LoginError", "帳號不存在或密碼錯誤");
		}
		if(errorMsg.isEmpty()) {
			return "index";
		}else {
			return "_08_login";
		}
	}
//	private StringBuilder emailcontent() {
//		List<Integer> set = new ArrayList<Integer>();
//		int num = (int)(Math.random()* (0-9+1)+1);
//    	set.add(num);
//		String message="http://localhost:8080/house/_08_resetPsw.jsp";
//		StringBuilder emailContent = new StringBuilder()  				
//		        .append("修改密碼：<span style=\"color: #F3750F;font-weight: bold;font-size: larger;font-family: cursive;\">") 
//		        .append("<a href=\"")
//		        .append(message)
//		        .append("\">") 
//		        .append("點選此連結跳轉")
//		        .append("</a>")
//		        .append("</span><br/>")  
//		        .append("此連結只能使用一次，驗證成功自動失效；<br/>")  
//		        .append("<div style=\"font-size: small;color: gray;\">")  
//		        .append("(請在10分鐘內完成驗證，10分鐘後驗證碼失效，您需要重新進行驗證。感謝您的支援。)<br/>")  
//		        .append("如果您錯誤的收到了本電子郵件，請您忽略上述內容<br/>").append("</div>");  
//		return emailContent;
//	}
	@RequestMapping(path = "checkAcctEmail",produces =  {"application/json"},method = RequestMethod.POST)
	public ResponseEntity<Map<String, String>>checkAcctEmail(@RequestParam("account")String account,@RequestParam("email")String email) {
		Map<String, String>map=new LinkedHashMap<String, String>();
		MemberBean check=loginService.checkAccEmail(account, email);		
		if(check!=null) {
			mailService.sendSimpleMessage(email, "重設密碼","你以為會給你改密碼嗎");
			map.put("status", "已寄出驗證信");
			ResponseEntity<Map<String, String>> re=new ResponseEntity<Map<String,String>>(map,HttpStatus.OK);
			return re;
		}
		map.put("status", "帳號或信箱錯誤");
		ResponseEntity<Map<String, String>> re=new ResponseEntity<Map<String,String>>(map,HttpStatus.OK);
		return re;		
	}	
}
