package tw.house.config;

import java.util.Properties;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

//import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@EnableTransactionManagement
public class RootAppConfig {
	Environment env;
	
	@Autowired
	public void setEnv(Environment env) {
		this.env = env;
	}
	
	@Bean
	public DataSource dataSource() throws IllegalArgumentException, NamingException {
		//jndi
//		JndiObjectFactoryBean jndiBean = new JndiObjectFactoryBean();
//		jndiBean.setJndiName("java:comp/env/jndiJdbcConnSQLServer/HouseProject");		
//		jndiBean.setProxyInterface(DataSource.class);
//		jndiBean.setLookupOnStartup(false);
//		jndiBean.afterPropertiesSet();
//		DataSource ds = (DataSource)jndiBean.getObject();
//		System.out.println("ds: " + ds);
		
		//c3p0
//		ComboPooledDataSource ds = new ComboPooledDataSource();
//		ds.setUser("blueteam");
//		ds.setPassword("houseproject");
//		try {
//			ds.setDriverClass("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//		} catch (PropertyVetoException e) {
//			e.printStackTrace();
//		}
//		ds.setJdbcUrl("jdbc:sqlserver://localhost:1433;databaseName=HOUSEDB");
//		ds.setInitialPoolSize(6);
//		ds.setMaxPoolSize(12);
		
		//druid
//		DruidDataSource ds = new DruidDataSource();
//		ds.setUsername("blueteam");
//		ds.setPassword("houseproject");
//		ds.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//		ds.setUrl("jdbc:sqlserver://localhost:1433;databaseName=HOUSEDB");
//		ds.setInitialSize(6);
//		ds.setMaxActive(12);
		
		//Hikari
		final HikariDataSource ds = new HikariDataSource();
		ds.setUsername("blueteam");
		ds.setPassword("houseproject");
		ds.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		ds.setJdbcUrl("jdbc:sqlserver://localhost:1433;databaseName=HOUSEDB");
		ds.setConnectionTimeout(10000);
		ds.setMaxLifetime(1000*60*5);
		return ds;
	}
	
	@Bean(name = "sessionFactory",destroyMethod = "destroy")
	public LocalSessionFactoryBean sessionFactory() throws IllegalArgumentException, NamingException {
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		factory.setDataSource(dataSource());
		factory.setPackagesToScan(new String[] { "tw.house" });
		factory.setHibernateProperties(additionalProperties());
		System.out.println("LocalSessionFactoryBean: " + factory);
		return factory;
	}
	
	private Properties additionalProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.dialect", org.hibernate.dialect.SQLServerDialect.class);
		properties.put("hibernate.show_sql", Boolean.TRUE);
		properties.put("hibernate.format_sql", Boolean.TRUE);
		properties.put("hibernate.current_session_context_class", "thread");
		properties.put("default_batch_fetch_size", 10);
		properties.put("hibernate.hbm2ddl.auto", "update");
		return properties;
	}
	
	@Bean(name = "transactionManager")
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager txManager = new HibernateTransactionManager();
		txManager.setSessionFactory(sessionFactory);
		return txManager;
	}
	
	
	
}
