package tw.house._08_.login.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.text.RandomStringGenerator;
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
import tw.house.config.CipherUtils;



@Controller
@SessionAttributes(names = {"memberBean"})
public class LoginController {
	@Autowired
	private MemberLoginService loginService;
	@Autowired
	private MailService mailService;
	@GetMapping(path = "/login")
	public String turntologin(HttpServletRequest request,Model m) {
		String referer = request.getHeader("Referer");
		System.out.println("tologinurl:"+referer);
		m.addAttribute("reurl",referer);
		return "_08_login";
	}
	@GetMapping(path = "index")
	public String toIndex() {
		return "index";
	}
	
	@RequestMapping(path = {"logins"},method = {RequestMethod.POST})
	public  String loginCheckAction(@RequestParam("account")String account,
			@RequestParam("psw") String psw,Model m,@RequestParam(value = "reurl",required = false)String rurl) {
//		String referer = request.getHeader("Referer");
		System.out.println("inloginurl:"+rurl);
//		String reflast = rurl.substring(rurl.length()-5);
//		System.out.println(referer);
	    
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
		String key = "scotttigerdogcat";
		String plainText = psw;
		String ccpsw = CipherUtils.encryptString(key, plainText);
		MemberBean checkBean = loginService.checkAccPwd(account, ccpsw);
		if(checkBean !=null) {
			m.addAttribute("memberBean", checkBean);
		}else {
			errorMsg.put("LoginError", "帳號不存在或密碼錯誤");
		}
		if(errorMsg.isEmpty()) {
			if (rurl.equals("")||rurl==null
					||rurl.equals("http://localhost:8080/house/login")
					||rurl.equals("http://localhost:8080/house/logout")
					||rurl.equals("http://localhost:8080/house/resetPsw")
					||rurl.equals("http://localhost:8080/house/mail")
					||rurl.equals("http://localhost:8080/house/ShowSearchTwoTaipeiPage.do")) {
				return "redirect:/index";
			}
			else {
				return "redirect:"+ rurl;
			}
		}else {
			return "_08_login";
		}
	}

	@RequestMapping(path = "checkAcctEmail", produces = { "application/json" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, String>> checkAcctEmail(@RequestParam("account") String account,
			@RequestParam("email") String email, Model m) {
		Map<String, String> map = new LinkedHashMap<String, String>();
		// 檢查帳號 email
		MemberBean check = loginService.checkAccEmail(account, email);
		// 產生一組亂數
		char[][] pairs = { { 'a', 'z' }, { 'A', 'Z' }, { '0', '9' } };
		int length = 10;
		RandomStringGenerator generator = new RandomStringGenerator.Builder().withinRange(pairs).build();
		String randomPassword = generator.generate(length);
		System.out.println("randomPassword"+randomPassword);
		String key = "scotttigerdogcat";
		String bcact = check.getAccount();
		System.out.println("加密前連結:" + bcact);
		String acact = CipherUtils.encryptString(key, bcact);
		System.out.println("加密後連結:" + acact);
		String message = "http://localhost:8080/house/reset" + "?x=" + acact;
		String message1 = "http://localhost:8080/house/login";
		StringBuilder emailContent = new StringBuilder()
				.append("<span style=\"color: #f60000;font-weight: bold;font-size: larger;font-family: cursive;\">")
				.append("此為系統寄出的新密碼:").append(randomPassword).append("，請去修改密碼:").append("<a href=\"").append(message)
				.append("\">").append("點選此連結跳轉").append("</a>").append("</span><br/>")
				.append("此連結只能使用一次，驗證成功自動失效；<br/>").append("<div style=\"font-size: small;color: gray;\">")
				.append("(請在10分鐘內完成驗證，10分鐘後驗證碼失效，您需要重新進行驗證。感謝您的支援。)<br/>").append("如果您錯誤的收到了本電子郵件，請您忽略上述內容<br/>")
				.append("</div>");
		String text = emailContent.toString();
		if (check != null) {
			mailService.sendFindPswMessage(email, "重設密碼", text);
			map.put("status", "已寄出驗證信");
			ResponseEntity<Map<String, String>> re = new ResponseEntity<Map<String, String>>(map, HttpStatus.OK);
			String plainText = randomPassword;
			String ccpsw = CipherUtils.encryptString(key, plainText);
			check.setPsw(ccpsw);
			loginService.updatePsw(check);
//			m.addAttribute(check);
			return re;
		}
		map.put("status", "帳號或信箱錯誤");
		ResponseEntity<Map<String, String>> re = new ResponseEntity<Map<String, String>>(map, HttpStatus.OK);
		return re;
	}

	@RequestMapping(path = "/resetPsw",method = RequestMethod.POST)
	public String resetPsw(@RequestParam("psw1")String psw1,@RequestParam("psw2")String psw2,@RequestParam("psw3")String psw3,Model m,
			@RequestParam("x")String x) {	
		HashMap<String, String> errorMsg = new HashMap<String, String>();
		//網址帳號亂數解密
		String key="scotttigerdogcat";
		String y =x.replace(" ", "+");
		String aact=CipherUtils.decryptString(key, y);
		//原密碼加密
		String cccpsw=CipherUtils.encryptString(key,psw3);
		//檢查帳號密碼取出bean
		MemberBean mBean=loginService.checkAccPwd(aact, cccpsw);
		if(mBean!=null) {
			//檢查密碼格式
			System.out.println("mBean");
			String regxa="^(?=.*[a-zA-Z])(?=.*\\d).{6,16}$";		
			Pattern p= Pattern.compile(regxa);
			Matcher rpsw = p.matcher(psw1);
			if(psw1==null||psw1.trim().length()==0) {
				System.out.println("123");
				errorMsg.put("psw", "密碼必須輸入");
				m.addAttribute("errorMsg",errorMsg);
				return "_08_resetPsw";	
			}else if(psw1.length()<6){
				System.out.println("456");
				errorMsg.put("psw","密碼至少6個字");
				m.addAttribute("errorMsg",errorMsg);
				return "_08_resetPsw";	
			}else if(rpsw.find()) {
				System.out.println("789");
				System.out.println("密碼正確");
				if(psw1.equals(psw2)) {		
					System.out.println("1011");
					//新密碼與重複密碼相同就加密 存進sql
					System.out.println("psw1:"+psw1+"psw2:"+psw2);		
					System.out.println("psw1=psw2");
					String ccpsw=CipherUtils.encryptString(key,psw2);				
					mBean.setPsw(ccpsw);
					loginService.updatePsw(mBean);	
//					m.addAttribute("memberBean",mBean);
					return "_08_resetPswSuccess";				
			}	
						
		}
			errorMsg.put("psw", "格式錯誤必須是英文加數字");
			m.addAttribute("errorMsg",errorMsg);
			return "_08_resetPsw";	
	}	
		errorMsg.put("pswkey1","舊密碼錯誤");
		m.addAttribute("errorMsg",errorMsg);
		return "_08_resetPsw";	
	}
}
