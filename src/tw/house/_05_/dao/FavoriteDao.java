package tw.house._05_.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.house._05_.model.FavoriteBean;
import tw.house._07_.model.HouseBean;

@Repository
public class FavoriteDao implements IFravoriteDao {
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		System.out.println("session begin Dao");
		this.factory = factory;
	}

	public FavoriteDao() {
		
	}	
	
	@Override
	public List<FavoriteBean> getAccountId(Integer accountId) {

		Session session = factory.getCurrentSession();
		Query<FavoriteBean> queryAccountId = session.createQuery("from FavoriteBean where accountId = : accountid ",
				FavoriteBean.class);
//		Query createQuery2 = session.createQuery("from Favorite where accountId = : accountId ");
		List<FavoriteBean> getAccountId = queryAccountId.setParameter("accountId", accountId).getResultList();
		System.out.println("FavoriteDao size of getHouseid = " + getAccountId.size());
		return getAccountId;
	}
	
	@Override
	public List<FavoriteBean> getHouseId(Integer houseid) {

		Session session = factory.getCurrentSession();
		Query<FavoriteBean> queryHouseId = session.createQuery("from FavoriteBean where houseId = : hosueId ", FavoriteBean.class);
		List<FavoriteBean> getHouseId = queryHouseId.setParameter("houseId", houseid).getResultList();
		System.out.println("FavoriteDao size of getHouseid = " + getHouseId.size());
	
		return getHouseId;
	}

	@Override
	public List<HouseBean> getHouseid(Integer accountid) {
		// TODO Auto-generated method stub
		return null;
	}

}
