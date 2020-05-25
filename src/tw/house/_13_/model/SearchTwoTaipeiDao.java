package tw.house._13_.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchTwoTaipeiDao implements ISearchTwoTaipei {
	
	SessionFactory factory;
	@Autowired 
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	public SearchTwoTaipeiDao() { 	}
	
	@Override
	public List<Taipei> selectTaipeiDistrict(String district) {
		Session session = factory.getCurrentSession();
		Query<Taipei> query = session.createQuery("from Taipei where district=:selectcity", Taipei.class);
		List<Taipei> tlist = query.setParameter("selectcity", district).list();
		return tlist;
	}

//	@Override
//	public List<NewTaipei> selectNewTaipeiDistrict(String district) {
//		Session session = factory.getCurrentSession();
//		Query<NewTaipei> query = session.createQuery("from NewTaipei where district=:selectcity", NewTaipei.class);
//		List<NewTaipei>ntlist = query.setParameter("selectcity", district).list();
//		return ntlist;
//	}

}
