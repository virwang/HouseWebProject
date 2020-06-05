package tw.house._19_.Admin.model.Member;

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
public class AdminMemberDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public List<MemberBean> getMembers() {
		String hql  = "from MemberBean";
		List<MemberBean> list = new ArrayList<>();
		try{
			Query<MemberBean> query = getSession().createQuery(hql, MemberBean.class);			
			list = query.list();
		}catch(NoResultException e) {
			;  // 表示查無紀錄			
		}		
			return list;
	}
	public MemberBean getById(Integer id) {
		String hql  = "from MemberBean where pk = :id";
		MemberBean bean = null;
		try {
			bean = (MemberBean)getSession().createQuery(hql)
									.setParameter("id",id)
									.getSingleResult();
		} catch(NoResultException e) {
			;  // 表示查無紀錄
		}
		
		return bean;
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
	public boolean delete(MemberBean memberBean) {
		if(memberBean !=null) {
			getSession().delete(memberBean);
			return true;
		}
			return false;
	}
		
}
