package tw.house._07_.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAO {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public List<ReservationBean> applicantlist(Integer aplm) {
		String hql = "from ReservationBean where applicant = :mem";
		Query<ReservationBean> query = getSession().createQuery(hql,ReservationBean.class);
		query.setParameter("mem", aplm);
		List<ReservationBean> list = new ArrayList<>();
		list = query.list();
		return  list;
	}
	
	public List<ReservationBean> recipientlist(Integer rcpm) {
		String hql = "from ReservationBean where recipient = :hon";
		Query<ReservationBean> query = getSession().createQuery(hql,ReservationBean.class);
		query.setParameter("hon", rcpm);
		List<ReservationBean> list = new ArrayList<>();
		list = query.list();
		return  list;
	}
	
	public boolean insertapplication(ReservationBean rBean) {
		try{
			getSession().save(rBean);
			System.out.println("success new reservation");
			return true;
		}catch (Exception e) {
			System.out.println("falied to reservate");
		}
		return false;
	}
	
	
}
