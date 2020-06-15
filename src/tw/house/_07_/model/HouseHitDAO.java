package tw.house._07_.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class HouseHitDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public HouseHitBean getHtBean(Integer id) {
		HouseHitBean hitBean = getSession().createQuery("from HouseHitBean where hid=:hid",HouseHitBean.class).setParameter("hid", id).uniqueResult();
		return hitBean;
	}
	
	public boolean updateHit(HouseHitBean htBean) {
//		System.out.println(htBean.toString());

		System.out.println(getSession().getTransaction().getStatus());
		try{
			getSession().update(htBean);
			
			System.out.println("success update househit");
			return true;
		}catch (Exception e) {
			System.out.println("falied to update househit");
		}
		return false;
	}
	public boolean insertHit(Integer hid) {
		HouseHitBean htBean = new HouseHitBean();
		htBean.setHid(hid);
		htBean.setHit(1);
		try{
			getSession().persist(htBean);
			System.out.println("success insert househit");
			return true;
		}catch (Exception e) {
			System.out.println("falied to insert househit");
		}
		return false;
	}
	public boolean deleteHit(Integer hid) {
		System.out.println("hid="+hid);
		HouseHitBean hitBean = getSession().createQuery("from HouseHitBean where hid=:hid",HouseHitBean.class).setParameter("hid", hid).uniqueResult();
		if(hitBean!=null) {
			getSession().delete(hitBean);
			return true;
		}
		return false;
	}
	
}
