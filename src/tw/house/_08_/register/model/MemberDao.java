package tw.house._08_.register.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import java.util.Iterator;
import java.util.List;

@Repository
public class MemberDao {
	@Autowired
	SessionFactory factory;
	public Session getSession() {
		return factory.getCurrentSession();
	}
	
//	@Autowired @Qualifier("sessionFactory")
//	private SessionFactory sessionFactory;
	
	public MemberDao() {

	}	
//	private Session session;
//	
//	public MemberDao(Session session) {
//		this.session=session;
//	}
//	public Session getSession() {
//		return session;
//	}

	
	public boolean AccountExist(String account) {
		boolean exist=false;
		try 
		{	
//			Session session = sessionFactory.getCurrentSession();
			Query<MemberBean> query = getSession().createQuery("from MemberBean where account=:acc",MemberBean.class);
			MemberBean mb = query.setParameter("acc",account).uniqueResult();
			if (mb!=null) {
					MemberBean mybean = mb;
					System.out.println(mybean.getAccount());	
					exist=true;
					return exist;
			}
			
		} catch (Exception e) {	
			e.printStackTrace();			
		}
		return exist;
	}
	public void insertMember(MemberBean bean) {				
		try 	
		{	
			getSession().save(bean);
			System.out.println("success insert Member");
//			Session session = sessionFactory.getCurrentSession();
//			bean.setAccount(bean.getAccount());
//			bean.setPsw(bean.getPsw());
//			bean.setName(bean.getName());
//			bean.setIdCard(bean.getIdCard());
//			bean.setGender(bean.getGender());
//			bean.setUsertype(bean.getUsertype());
//			bean.setTel(bean.getTel());
//			bean.setEmail(bean.getEmail());
//			bean.setRegisterDate(bean.getRegisterDate());		
//			session.save(bean);					
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("falied to insert Member");
		}
	}
	public MemberBean checkGoogleId(MemberBean memberBean) {
		MemberBean mybean=memberBean;
		String googleId=memberBean.getGoogleId();
		Query<MemberBean> query = getSession().createQuery("from MemberBean where googleId=:googleId",MemberBean.class);
		MemberBean mb = query.setParameter("googleId",googleId).uniqueResult();
		if (mb!=null) {
				 mybean = mb;
				System.out.println(mybean.getAccount());	
				return mybean;
		}
		getSession().save(mybean);
		return mybean;
	}
	

}
