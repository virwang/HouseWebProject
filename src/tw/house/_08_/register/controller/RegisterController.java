package tw.house._08_.register.controller;

import java.sql.Timestamp;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tw.house._08_.register.model.MemberBean;
import tw.house._08_.register.model.MemberService;
import tw.house.config.CipherUtils;



@Controller
public class RegisterController {
	@Autowired
	private MemberService mService;
	
	
	@GetMapping(path = "/register")
	public String turntoregist() {
		return "_08_registerMember";
	}
	@RequestMapping(path = "/accountCheck",method = RequestMethod.POST,produces = {"application/json"})
	public ResponseEntity<Map<String, String>> accountCheck(@RequestParam("account")String account) {
		String msg="";
		boolean accountExist = mService.AccountExist(account);
		System.out.println(accountExist);
		Map<String, String> map=new HashMap<String, String>();
		if(accountExist) {
			msg="帳號重複已被使用";
			map.put("error",msg);
			System.out.println("123"+msg);
			ResponseEntity<Map<String, String>> re = new ResponseEntity<>(map, HttpStatus.OK);
			return re;
		}
		msg="帳號可以使用";
		System.out.println("456"+msg);
		map.put("ok",msg);
		ResponseEntity<Map<String, String>> re = new ResponseEntity<>(map, HttpStatus.OK);
		return re;
	}
	
	
	@RequestMapping(path = {"springRegisterMember.do"},method = RequestMethod.POST)
	public String registercheckAction(@RequestParam("account")String account,
			@RequestParam("psw")String psw,@RequestParam("name")String name,
			@RequestParam("gender")String gender,
			@RequestParam("idCard")String idCard,@RequestParam("tel")String tel,
			@RequestParam("email")String email,@RequestParam(value = "picture1", required = false) MultipartFile picture1,Model m){
		HashMap<String, String> errorMsg = new HashMap<>();
		m.addAttribute("errorMsg", errorMsg);
		
		String regxa="^(?=.*[a-zA-Z])(?=.*\\d).{6,16}$";		
		Pattern p= Pattern.compile(regxa);
		Matcher r =p.matcher(account);
		
		if(account==null||account.trim().length()==0) {
			errorMsg.put("account", "帳號必須輸入");
		}else if(account.length()<6){
			errorMsg.put("account","帳號至少6個字");
		}else if(r.matches()) {
			System.out.println("帳號正確");
		}else {
			errorMsg.put("account", "格式錯誤必須是英文加數字");
		}
		
		Matcher rpsw = p.matcher(psw);
		if(psw==null||psw.trim().length()==0) {
			errorMsg.put("psw", "密碼必須輸入");
		}else if(psw.length()<6){
			errorMsg.put("psw","密碼至少6個字");
		}else if(rpsw.find()) {
			System.out.println("密碼正確");
		}else {
			errorMsg.put("psw", "格式錯誤必須是英文加數字");
		}
		
		String regxn="^[\\u4E00-\\u9FA5]+$";
		Pattern pn= Pattern.compile(regxn);
		Matcher rn =pn.matcher(name);
		if(name==null||name.trim().length()==0) {
			errorMsg.put("name", "姓名必須輸入");
		}else if(name.length()<2) {
			errorMsg.put("name", "姓名至少兩個字");
		}else if(rn.find()) {
			System.out.println("姓名正確");
		}else{
			errorMsg.put("name", "必須是中文");
		}
		
		String regxid="^[A-Z]{1}\\d{9}$";
		Pattern pid= Pattern.compile(regxid);
		Matcher rid =pid.matcher(idCard);
		if(idCard==null||idCard.trim().length()==0) {
			errorMsg.put("idCard", "身分證號碼必須輸入");
		}else if(rid.find()) {
			System.out.println("身分證號碼正確");
		}else {
			errorMsg.put("idCard", "身分證號碼格式錯誤");
		}
		
		String regxph ="^[09]{2}[0-9]{8}$";
		Pattern pph =Pattern.compile(regxph);
		Matcher rph = pph.matcher(tel);
		if(tel==null||tel.trim().length()==0) {
			errorMsg.put("tel", "手機號碼必須輸入");
		}else if(rph.find()) {
			System.out.println("手機號碼正確");
		}else {
			System.out.println(rph);
			errorMsg.put("tel", "手機號碼格式錯誤");
		}
		
		String regxem = "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z]+$";
		Pattern pem = Pattern.compile(regxem);
		Matcher rem = pem.matcher(email);
		if(email==null||email.trim().length()==0) {
			errorMsg.put("email", "信箱必須輸入");
		}else if(rem.find()) {
			System.out.println("信箱正確");
		}else {
			errorMsg.put("email", "信箱格式錯誤");
		}
		String userType="General";
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		
		String base64Encoded1="";
		if (picture1 != null && !picture1.isEmpty()) {
			try {
				byte[] b1 = picture1.getBytes();
				byte[] encodeBase641 = Base64.getEncoder().encode(b1);
//				hBean.setImage1(b1);
				base64Encoded1 = new String(encodeBase641,"UTF-8");
				
//				mb.setBase64image1(base64Encoded1);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		if(!errorMsg.isEmpty()) {
			return "_08_registerMember";
		}
		String key="scotttigerdogcat";
		String plainText=psw;
		String ccpsw=CipherUtils.encryptString(key,plainText);
		MemberBean mb= new MemberBean(null,account,ccpsw,name,idCard,gender,userType,tel,email,ts,base64Encoded1,null);
		
		boolean accountExist = mService.AccountExist(account);
		
		if(accountExist) {
			errorMsg.put("account", "帳號已存在請重新輸入");
			return "_08_registerMember";
		}else {
			mService.insertMember(mb);
			m.addAttribute("mBean", mb);
			return "_08_registerSucess";
		}
		
	}
	
	
}
