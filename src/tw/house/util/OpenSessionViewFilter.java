package tw.house.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

@WebFilter("/*")
public class OpenSessionViewFilter implements Filter {

	private SessionFactory sessionFactory;
	private WebApplicationContext context;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
//		String sessionFactoryBeanName = filterConfig.getInitParameter("sessionFactoryBeanName");
//		System.out.println(sessionFactoryBeanName);
//		String sessionFactoryBeanName = "sessionFactory";
		ServletContext application = filterConfig.getServletContext();
		context = WebApplicationContextUtils.getWebApplicationContext(application);
//		System.out.println(context);
		sessionFactory = (SessionFactory)context.getBean(SessionFactory.class);
		System.out.println("sessionFactory: "+sessionFactory);
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		Transaction transaction = sessionFactory.getCurrentSession().getTransaction();
		
		try {
			transaction.begin();
			System.out.println("Transaction Begin.");
			chain.doFilter(request, response);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			System.out.println("Transaction RollBack.");
			e.printStackTrace();
		} finally {
			System.out.println("Session Closed.");
//			((ConfigurableApplicationContext)context).close();
		}
	}

	@Override
	public void destroy() {
	}

}