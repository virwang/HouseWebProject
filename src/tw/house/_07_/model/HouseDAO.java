package tw.house._07_.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("houseDao")
public class HouseDAO {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public List<HouseBean> houseList() {

		String hquery = "from HouseBean";
		
		Query<HouseBean> query = getSession().createQuery(hquery, HouseBean.class);
		List<HouseBean> list = new ArrayList<>();
		list = query.list();


		return list;

	}

	public List<HouseBean> memberHouseList(String macct) {
		String hquery = "from HouseBean where memberBean.account = :acct";

		Query<HouseBean> query = getSession().createQuery(hquery, HouseBean.class);
		query.setParameter("acct", macct);
		List<HouseBean> mlist = new ArrayList<>();
		mlist = query.list();

		return mlist;

	}
	public List<HouseBean> selectedHouse(Integer hid) {
		Session session = sessionFactory.getCurrentSession();
//		System.out.println(session.get(HouseBean.class,hid).getMemberBean().getAccount());
		return (List<HouseBean>) session.get(HouseBean.class,hid);
	}
	
	public HouseBean updateHouse(HouseBean hBean) {
		HouseBean houseBean = getSession().get(HouseBean.class, hBean.getId());
		if(houseBean!=null) {
			houseBean=hBean;
		}
		return houseBean;
	}

	public boolean insertHouse(HouseBean hBean) {
		
		try{
			getSession().save(hBean);
			System.out.println("success insert house");
			return true;
		}catch (Exception e) {
			System.out.println("falied to insert house");
		}
		return false;
		
	}

	public boolean deleteHouse(Integer hid) {
		HouseBean houseBean = getSession().get(HouseBean.class, hid);
		if(houseBean!=null) {
			getSession().delete(houseBean);
			return true;
		}
		return false;
	}
	
	public List<HouseBean> mrthouse(Integer station){
		String hquery = "from HouseBean where mrtBean.pk = :stcode";

		Query<HouseBean> query = getSession().createQuery(hquery, HouseBean.class);
		query.setParameter("stcode", station);
		List<HouseBean> mhlist = new ArrayList<>();
		mhlist = query.list();

		return mhlist;
	}
}
