package tw.house._08_.mail.model;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	@Autowired
    private JavaMailSender emailSender;
	
	
 
    
	public void sendSimpleMessage(String to, String subject, String text) {
        SimpleMailMessage message = new SimpleMailMessage();
//        message.setFrom(from);              
        message.setTo(to); 
        message.setSubject(subject); 
        message.setText(text);
        emailSender.send(message);
    }
	public void sendFindPswMessage(String to,String subject,String text) {
		MimeMessage message=emailSender.createMimeMessage();
		MimeMessageHelper helper=new MimeMessageHelper(message,"UTF-8");
		
		try {
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(text, true);
			
			emailSender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
