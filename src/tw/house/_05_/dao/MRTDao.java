package tw.house._05_.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.house._05_.model.MRTBean;

@Repository
public class MRTDao implements IMRTDao {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	public MRTDao() { }

	@Override
	public List<MRTBean> getStation(String station) {
		
		Session session = factory.getCurrentSession();
		Query<MRTBean> query = session.createQuery("FROM MRTBean WHERE station =:selectcity ", MRTBean.class);
		List<MRTBean> mrt = query.setParameter("selectmrt", station).getResultList();
		
		System.out.println(mrt+"dao");
		return mrt;
	}

}
