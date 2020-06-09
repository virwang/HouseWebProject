package tw.house._19_.Admin.model.House;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.NoResultException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import tw.house._07_.model.HouseBean;

@Repository
public class AdminHouseDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public List<HouseBean> getHouses() {
		String hql  = "select new HouseBean(id,title,city,dist) from HouseBean";
		List<HouseBean> list = new ArrayList<>();
		try{
			Query<HouseBean> query = getSession().createQuery(hql, HouseBean.class);			
			list = query.list();
		}catch(NoResultException e) {
			;  // 表示查無紀錄			
		}		
			return list;
	}
	public HouseBean getById(Integer id) {
		String hql  = "from HouseBean where id = :id";
		HouseBean bean = null;
		try {
			bean = (HouseBean)getSession().createQuery(hql)
									.setParameter("id",id)
									.getSingleResult();
		} catch(NoResultException e) {
			;  // 表示查無紀錄
		}
		
		return bean;
}
	public boolean update(HouseBean bean) {
		Session session = getSession();
		try{
			session.update(bean);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	
}
	public boolean deleteHouse(HouseBean bean) {
		if(bean!=null) {
			getSession().delete(bean);
			return true;
		}
		return false;
	}
		
}
