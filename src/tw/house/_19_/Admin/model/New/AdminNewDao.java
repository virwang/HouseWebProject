package tw.house._19_.Admin.model.New;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.NoResultException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import tw.house._07_.model.NewsBean;

@Repository("adminNewDao")
public class AdminNewDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public List<NewsBean> getNews() {
		String hql  = "from NewsBean";
		List<NewsBean> list = new ArrayList<>();
		try{
			Query<NewsBean> query = getSession().createQuery(hql, NewsBean.class);		
			list = query.list();
		}catch(NoResultException e) {
			;  // 表示查無紀錄			
		}		
			return list;
	}
	public NewsBean getById(Integer id) {
		String hql  = "from NewsBean where newsnum =:id";
		NewsBean bean = null;
		try {
			bean = (NewsBean)getSession().createQuery(hql)
									.setParameter("id",id)
									.getSingleResult();
		} catch(NoResultException e) {
			;  // 表示查無紀錄
		}
		
		return bean;
}
	public boolean update(NewsBean bean) {
		Session session = getSession();
		try{
			session.update(bean);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	
}
	public boolean delete(NewsBean bean) {
		try {
			getSession().delete(bean);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean save(NewsBean bean) {
		try {
			getSession().save(bean);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
}
	
}
