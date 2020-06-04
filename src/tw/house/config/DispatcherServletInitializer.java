package tw.house.config;

import javax.servlet.Filter;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class DispatcherServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {RootAppConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {SpringMVCJavaConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}
	
	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		characterEncodingFilter.setForceEncoding(true);
		HiddenHttpMethodFilter hiddenHttpMethodFilter = new HiddenHttpMethodFilter();
		return new Filter[] {characterEncodingFilter, hiddenHttpMethodFilter};
	}
	
	
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
		rootContext.register(RootAppConfig.class,SpringMVCJavaConfig.class);
		
		rootContext.setServletContext(servletContext);
		
		ServletRegistration.Dynamic mvc = servletContext.addServlet("mvc", new DispatcherServlet(rootContext));
		mvc.setLoadOnStartup(1);
		mvc.addMapping("/");
		FilterRegistration.Dynamic filterRegistration = servletContext.addFilter("endcodingFilter", new CharacterEncodingFilter());
		filterRegistration.setInitParameter("encoding", "UTF-8");
		filterRegistration.setInitParameter("forceEncoding", "true");
		filterRegistration.addMappingForUrlPatterns(null, false, "/*");
//		filterRegistration = servletContext.addFilter("OpenSessionViewFilter", OpenSessionViewFilter.class);
//		filterRegistration.setInitParameter("sessionFactoryBeanName", "sessionFactory");
//		filterRegistration.addMappingForUrlPatterns(null, true, "/*");
		filterRegistration = servletContext.addFilter("hiddenHttpMethodFilter",new HiddenHttpMethodFilter());
		filterRegistration.addMappingForUrlPatterns(null, true, "/*");
		filterRegistration.addMappingForServletNames(null, true, "mvc");
		

		servletContext.addListener(new ContextLoaderListener(rootContext));
	}

}
