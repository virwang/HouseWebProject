package tw.house._08_.login.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;

import tw.house._08_.register.model.MemberBean;
import tw.house._08_.register.model.MemberService;
@Controller
@SessionAttributes(names = {"memberBean"})
public class LoginGoogle {
	@Autowired
	private MemberService memberService;

//	@RequestMapping(path = "/GoogleLogin", method = RequestMethod.GET)
//	public String showMemberCentreEdit(Model model) {
//		return "GoogleLogin";
//	}

	@RequestMapping(path = "/gv", method = RequestMethod.POST)
	public ResponseEntity<String> verifyToken(@RequestParam("idtoken") String idtokenstr, HttpSession session, Model m)
			throws Exception {
		String a = "/house/login";

		System.out.println(idtokenstr);
		String client_id = "535880499912-miafr5t9hp5h7tu4630rspss8q0huacc.apps.googleusercontent.com";
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(),
				JacksonFactory.getDefaultInstance()).setAudience(Collections.singletonList(client_id)).build();
		GoogleIdToken idToken = null;
		try {
			idToken = verifier.verify(idtokenstr);
		} catch (GeneralSecurityException e) {
			System.out.println("驗證時出現GeneralSecurityException異常");
		} catch (IOException e) {
			System.out.println("驗證時出現IOException異常");
		}
		Payload payload = idToken.getPayload();
		boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
		if (emailVerified) {
			System.out.println("驗證成功.");
			MemberBean memberBean = new MemberBean();
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			String img=(String)payload.get("picture");
			String googleId = payload.getSubject();
			String email = payload.getEmail();
			
			String name = (String) payload.get("name");
			String password = "google";
			memberBean.setGoogleId(googleId);
			memberBean.setEmail(email);
			memberBean.setName(name);
			memberBean.setPsw(password);
			memberBean.setUsertype("General");
			memberBean.setRegisterDate(ts);
			memberBean.setBase64image1(img);
			String locale = (String) payload.get("locale");
			System.out.println("google ID: " + googleId);
			System.out.println("email: " + email + "\nname:" + name + "\nemailVerified :" + emailVerified + "\nlocale :" + locale);

			MemberBean member = memberService.checkGoogleId(memberBean);
			System.out.println("memberController=" + member);
			m.addAttribute("memberBean", member);
			if (session.getAttribute("servletPath") != null) {
				a = "/house" + (String) session.getAttribute("servletPath");
			} else {
				a = "/house";
			}
		} else {
			System.out.println("驗證錯誤");
		}

		return new ResponseEntity<String>(a, HttpStatus.OK);
	}
}
