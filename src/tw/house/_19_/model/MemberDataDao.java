package tw.house._19_.model;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import tw.house._08_.register.model.MemberBean;

@Repository
public class MemberDataDao {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
//	public List<MemberBean> memberList() {
//
//		String hql = "from MemberBean";
//		
//		Query<MemberBean> query = getSession().createQuery(hql, MemberBean.class);
//		List<MemberBean> list = new ArrayList<>();
//		list = query.list();
//
//
//		return list;
//	}
	

	public List<MemberBean> memberList(String account) {
		String hql  = "FROM MemberBean where account=:acct";
		Query<MemberBean> query = getSession().createQuery(hql, MemberBean.class);
		query.setParameter("acct", account);
		List<MemberBean> list = new ArrayList<>();
		list = query.list();

		return list;
	}

}


