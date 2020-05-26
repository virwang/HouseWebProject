package tw.house._05_.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import tw.house._05_.model.FavoriteBean;
import tw.house._07_.model.HouseBean;
import tw.house._07_.model.MrtBean;

@Repository
public class FavoriteDao implements IFravoriteDao {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory factory;
	
	public Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public Object save(FavoriteBean fBean) {
		Session session = factory.getCurrentSession();
		System.out.println("favorite dao save Bean"+fBean);
		return session.save(fBean);
	}

	@Override
	public List<FavoriteBean> query() {
		String queryAll = "from FavoriteBean";
		Query<FavoriteBean>	query = getSession().createQuery(queryAll, FavoriteBean.class);
		List<FavoriteBean> falist = new ArrayList<>();
		falist = query.list();
		System.out.println("FavoriteDao queryAll data"+falist.size());
		return falist;
	
	}
 
	@Override
	public List<FavoriteBean> getHouseid(Integer hosueid) {
		String query = "from FavoriteBean houseid =: houseid ";
		Query<FavoriteBean> queryHouseId = getSession().createQuery(query, FavoriteBean.class);
		List<FavoriteBean> listhouseid = new ArrayList<>();
		listhouseid = queryHouseId.list();
		System.out.println("FavoriteDao query by Houseid"+listhouseid.size());
		return listhouseid;
	}


	@Override
	public void deleteFavorite(int fid) {
		Session session = factory.getCurrentSession();
		FavoriteBean fBean = new FavoriteBean();
		fBean.setFid(fid);
		System.out.println("FavoriteDao delete favorite "+fBean);
		session.delete(fBean);
	}


	@Override
	public List<FavoriteBean> getMemberid(int accountid) {
		String querymemberid = "from FavoriteBean accountid = : accountid";
		Query<FavoriteBean> queryMemberid = getSession().createQuery(querymemberid, FavoriteBean.class);
		List<FavoriteBean> listmid = new ArrayList<>();
		listmid = queryMemberid.list();
		System.out.println("fdao querymemberid"+listmid.size());
		return listmid;
	}




}
