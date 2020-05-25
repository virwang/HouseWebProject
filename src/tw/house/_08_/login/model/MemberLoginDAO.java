package tw.house._08_.login.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import tw.house._08_.register.model.MemberBean;


@Repository
public class MemberLoginDAO {
	@Autowired @Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	public MemberLoginDAO(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
	}

	public  MemberBean checkAccPwd(String account, String psw) {
		MemberBean mb = null;
		try {
			Session session = sessionFactory.getCurrentSession();
			Query<MemberBean> query = session.createQuery("from MemberBean where account=:acc and psw=:psw",
					MemberBean.class);
			mb = query.setParameter("acc", account).setParameter("psw", psw).uniqueResult();

		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mb;		
	}

}
