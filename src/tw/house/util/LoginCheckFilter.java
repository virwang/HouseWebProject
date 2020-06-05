package tw.house.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tw.house._08_.register.model.MemberBean;

@WebFilter(urlPatterns = { "/lend", "/memberhouse", "/newhouse", "/showMemberData",
							"/newapplication","/reservation","/applicanttable","/recipienttable",
							"/favorite","/modhouse"}, 
		   initParams = @WebInitParam(value = "/login", name = "loginPage"))
public class LoginCheckFilter implements Filter {
	private FilterConfig fConfig;
	private String loginPage;
	String requestURI;

	public void init(FilterConfig fConfig) throws ServletException {
		this.fConfig = fConfig;
		loginPage = fConfig.getInitParameter("loginPage");
		if (loginPage == null) {
			throw new ServletException("登陸畫面參數不存在");
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if (request instanceof ServletRequest && response instanceof ServletResponse) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			HttpSession session = req.getSession();
			requestURI = req.getRequestURI();

			MemberBean mb = (MemberBean) session.getAttribute("memberBean");
			if (mb == null) {
				requireLogin(req, resp, session);
			} else {
				chain.doFilter(request, response);
			}
		}

	}

	private void requireLogin(HttpServletRequest req, HttpServletResponse resp, HttpSession session)
			throws IOException {
		StringBuffer buffer = req.getRequestURL();
		String query = req.getQueryString();
		if (query != null) {
			buffer.append("?");
			buffer.append(query);
		}
		session.setAttribute("LoginPage", buffer.toString());
		String redirect = resp.encodeRedirectURL(req.getContextPath() + loginPage);
		resp.sendRedirect(redirect);
	}

	public void destroy() {
	}
}
