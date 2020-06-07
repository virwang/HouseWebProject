package tw.house._13_.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.house._13_.model.bean.TwoTaipei;

@Repository
public class SearchTwoTaipeiDao implements ISearchTwoTaipei {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public SearchTwoTaipeiDao() {
	}

	@Override
	public List<TwoTaipei> selectTaipeiDistrict(String district) {
		Session session = factory.getCurrentSession();
		Query<TwoTaipei> query = session.createQuery("from TwoTaipei where district= :selectcity", TwoTaipei.class);
		List<TwoTaipei> tlist = query.setParameter("selectcity", district).list();
		return tlist;
	}

}
