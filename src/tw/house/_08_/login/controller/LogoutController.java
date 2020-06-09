package tw.house._08_.login.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.house._08_.register.model.MemberBean;

@Controller
@SessionAttributes
public class LogoutController {
	@RequestMapping(path = "/logout")
	public String logoutAction(HttpServletRequest requset, Model m) {
		HttpSession session = requset.getSession(false);
		MemberBean bean = (MemberBean) session.getAttribute("memberBean");
		System.out.println("Session: " + session);
		System.out.println("MemberBean: " + bean);
		if (session != null && bean != null) {
			String name = bean.getName();
			m.addAttribute("logoutMsg", name);
			session.invalidate();
			return "_08_logout";
		}
		return "_08_logout";

	}

}
