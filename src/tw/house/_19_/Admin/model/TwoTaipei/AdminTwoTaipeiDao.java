package tw.house._19_.Admin.model.TwoTaipei;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.NoResultException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import tw.house._13_.model.bean.TwoTaipei;



@Repository
public class AdminTwoTaipeiDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public List<TwoTaipei> getTwoTaipeis() {
		String hql  = "FROM TwoTaipei";
		List<TwoTaipei> list = new ArrayList<>();
		try{
			Query<TwoTaipei> query = getSession().createQuery(hql, TwoTaipei.class);			
			list = query.list();
		}catch(NoResultException e) {
			;  // 表示查無紀錄			
		}		
			return list;
	}
	public TwoTaipei getById(Integer id) {
		String hql  = "FROM TwoTaipei WHERE id = :id";
		TwoTaipei bean = null;
		try {
			bean = (TwoTaipei)getSession().createQuery(hql)
									.setParameter("id",id)
									.getSingleResult();
		} catch(NoResultException e) {
			;  // 表示查無紀錄
		}
		
		return bean;
}
	public boolean update(TwoTaipei bean) {
		Session session = getSession();
		try{
			session.update(bean);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	
}

	public boolean save(TwoTaipei bean) {
		try {
			getSession().save(bean);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
}	
	public boolean delete(TwoTaipei bean) {
		if(bean!=null) {
			getSession().delete(bean);
			return true;
		}
		return false;
	}
}
