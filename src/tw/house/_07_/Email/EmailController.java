package tw.house._07_.Email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//@Controller
public class EmailController {
//	@Autowired
	private EmailService emailService;
	
//	@RequestMapping(path = "/sendEmail",method = RequestMethod.GET)
	 public void sendemail() {
		 emailService.sendSimpleMessage("chris20516@gmail.com", "驗證碼", "驗證碼是:1234");
	 }
	
}
