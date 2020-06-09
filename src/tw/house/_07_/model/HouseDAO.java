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
	public List<HouseBean> searchHouse(String city,String dist,String addr){
		String hquery0 = "from HouseBean where city=:city";
		String hquery1 = "from HouseBean where city=:city and dist=:dist";
		String hquery2 = "from HouseBean where city=:city and dist=:dist and addr like :addr";
		Query<HouseBean> query = null;
		System.out.println("daoaddr="+addr);
		System.out.println("daodist="+dist);
		if(dist.equals("全區")&&addr=="") {
			query = getSession().createQuery(hquery0,HouseBean.class);
			query.setParameter("city", city);
		}else if(addr=="") {
			query = getSession().createQuery(hquery1,HouseBean.class);
			query.setParameter("city", city);
			query.setParameter("dist", dist);
			
		}else {
			query = getSession().createQuery(hquery2,HouseBean.class);
			query.setParameter("city", city);
			query.setParameter("dist", dist);
			query.setParameter("addr", "%"+addr+"%");
		}
		List<HouseBean> list = new ArrayList<>();
		list = query.list();
		return list;
		
	}

	public List<HouseBean> memberHouseList(Integer macct) {
		String hquery = "from HouseBean where accountid = :acct";
		System.out.println("member="+macct);
		Query<HouseBean> query = getSession().createQuery(hquery, HouseBean.class);
		query.setParameter("acct", macct);
		List<HouseBean> mlist = new ArrayList<>();
		mlist = query.list();

		return mlist;

	}
	public HouseBean selectedHouse(Integer hid) {
//		System.out.println(session.get(HouseBean.class,hid).getMemberBean().getAccount());
		return getSession().get(HouseBean.class,hid);
	}
	
	public boolean updateHouse(HouseBean hBean) {
		try{
			getSession().update(hBean);
			System.out.println("success update house");
			return true;
		}catch (Exception e) {
			System.out.println("falied to update house");
		}
		return false;
	}

	public boolean insertHouse(HouseBean hBean) {
		
		try{
			getSession().persist(hBean);
			System.out.println("success insert house");
			return true;
		}catch (Exception e) {
			System.out.println("falied to insert house");
		}
		return false;
		
	}

	public boolean deleteHouse(Integer hid) {
		System.out.println("hid="+hid);
		HouseBean houseBean = getSession().get(HouseBean.class, hid);
		if(houseBean!=null) {
			getSession().delete(houseBean);
			return true;
		}
		return false;
	}
	
	public List<HouseBean> mrthouse(Integer station){
		String hquery = "from HouseBean where mrtpk = :stcode";

		Query<HouseBean> query = getSession().createQuery(hquery, HouseBean.class);
		query.setParameter("stcode", station);
		List<HouseBean> mhlist = new ArrayList<>();
		mhlist = query.list();

		return mhlist;
	}
}
