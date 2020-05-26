package tw.house._05_.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.house._05_.model.FavoriteBean;
import tw.house._07_.model.HouseBean;
import tw.house._07_.model.MrtBean;

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
	public List<HouseBean> getHouseid(Integer accountid) {
		Session session = factory.getCurrentSession();
		Query<HouseBean> memberId = session.createQuery("from HouseBean where id= : id", HouseBean.class);
		
		return memberId;
	}


}
