package tw.house._19_.MemberData.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

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

	public MemberBean memberBean(String account) {
		String hql  = "FROM MemberBean where account=:acct";
		Query<MemberBean> query = getSession().createQuery(hql, MemberBean.class);
		query.setParameter("acct", account);
		List<MemberBean> list = new ArrayList<>();
		list = query.list();
		MemberBean memberBean = null;		
		memberBean=list.get(0);
		System.out.println(memberBean);
		return memberBean;
	}

	public boolean update(MemberBean memberBean) {
			Session session = getSession();
			try{
				session.update(memberBean);
				System.out.println(memberBean);
				return true;
			}catch(Exception e) {
				e.printStackTrace();
			}
			return false;
		
	}
	public MemberBean getByPk(Integer id) {
		String hql  = "FROM MemberBean WHERE pk = :id";
		MemberBean bean = null;
		Session session = getSession();
		try {
			bean = (MemberBean)session.createQuery(hql)
									.setParameter("id",id)
									.getSingleResult();
		} catch(NoResultException e) {
			;  // 表示查無紀錄
		}
		
		return bean;
}

}
