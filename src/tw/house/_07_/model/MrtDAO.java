package tw.house._07_.model;

import java.util.ArrayList;
import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("mrtDao")
public class MrtDAO {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public List<MrtBean> mrtlist() {
		Query<MrtBean> query = getSession().createQuery("from MrtBean",MrtBean.class);
		List<MrtBean> list = new ArrayList<>();
		for (MrtBean mrtBean : list) {
			System.out.println(mrtBean.getStationname());
		}
		list=query.list();
		return list;
	}
	
	public List<MrtBean> mrtlinepoint(String line){
		Query<MrtBean> query = getSession().createQuery("from MrtBean where linecode =:lcode",MrtBean.class);
		query.setParameter("lcode", line);
		List<MrtBean> list = new ArrayList<>();
		list = query.list();
		return list;
		
	}
	
	public MrtBean selectedStaion(Integer station) {
		return getSession().get(MrtBean.class, station);
	}
	
	
}
