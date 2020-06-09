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
	@Autowired
	SessionFactory factory;
	public Session getSession() {
		return factory.getCurrentSession();
	}

	public  MemberBean checkAccPwd(String account, String psw) {	
		
			Query<MemberBean> query = getSession().createQuery("from MemberBean where account=:acc and psw=:psw",
					MemberBean.class);
			MemberBean mb = query.setParameter("acc", account).setParameter("psw", psw).uniqueResult();
		if(mb!=null) {
			return mb;					
		}
		return mb;
	}
	public  MemberBean checkAccEmail(String account, String email) {		
		Query<MemberBean> query = getSession().createQuery("from MemberBean where account=:acc and email=:email",
				MemberBean.class);
		MemberBean mb = query.setParameter("acc", account).setParameter("email", email).uniqueResult();
	if(mb!=null) {
		return mb;					
	}
	return mb;
}
	public boolean  updatePsw(MemberBean mBean) {
		try {
			getSession().update(mBean);
			System.out.println("update success");
			return true;
		} catch (Exception e) {
			System.out.println("update fail");
			// TODO: handle exception
		}
		return false;
	}
}
