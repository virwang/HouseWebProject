package tw.house._08_.mail.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.house._08_.mail.model.MailService;

@Controller
public class MailController {
	@Autowired
	private MailService mailService;
	
	@GetMapping(path = "/mail")
	public String mail() {
		return "_08_emailFindPsw";
	}
	@GetMapping(path = "/reset")
	public String reset() {
		return "_08_resetPsw";
	}
	@RequestMapping(path = "/sendEmail",method = RequestMethod.GET)
	 public void sendemail() {
			
		 mailService.sendSimpleMessage("5413gary@gmail.com", "驗證碼", "驗證碼是:1234");
		 
	 }
}
