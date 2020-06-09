package tw.house._13_.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.house._13_.model.bean.HouseLoanList;




@Repository
public class HouseLoanListDAO implements HouseLoanListIpl {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public HouseLoanListDAO() {
	}


	@Override
	public List<HouseLoanList> ShowHouseLoanList() {
		Session session = factory.getCurrentSession();
		Query<HouseLoanList> query = session.createQuery("from HouseLoanList", HouseLoanList.class);
		List<HouseLoanList> tlist = query.list();
		return tlist;
	}

	
}
