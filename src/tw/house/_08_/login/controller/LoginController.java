package tw.house._08_.login.controller;

import java.util.HashMap;

import javax.servlet.RequestDispatcher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.house._08_.login.model.MemberLoginService;
import tw.house._08_.register.model.MemberBean;



@Controller
@SessionAttributes(names = { "memberBean", "LoginOK","LoginOK2","LoginOK3"})
public class LoginController {
	@Autowired
	private MemberLoginService loginService;
	
	public LoginController(MemberLoginService loginService) {
		this.loginService=loginService;
	}
	@RequestMapping(path = {"springlogin.do"},method = {RequestMethod.POST})
	public  String loginCheckAction(@RequestParam("account")String account, @RequestParam("psw") String psw,Model m) {
		HashMap<String, String> errorMsg = new HashMap<String, String>();
		m.addAttribute("ErrorMsgKey", errorMsg);
		
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
			String name = checkBean.getName();
			String acct =checkBean.getAccount();
//			Integer acct = checkBean.getPk();
			m.addAttribute("LoginOK", checkBean);
			m.addAttribute("LoginOK2", name);
			m.addAttribute("LoginOK3", acct);
			return "index";
		}else {
			return "_08_login";
		}
	}
	
}
