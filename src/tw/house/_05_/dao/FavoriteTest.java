package tw.house._05_.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.house._07_.model.HouseBean;


@Repository
public class FavoriteTest {
	SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		System.out.println("session begin Dao");
		this.factory = factory;
	}
	
	public FavoriteTest() {
		
	}
	public List<HouseBean> getId(Integer houseid){
		Session session = factory.getCurrentSession();
		Query<HouseBean> hid = session.createQuery("from HouseBean hb where id = :1",HouseBean.class);
		List<HouseBean> resultid = hid.getResultList();
		System.out.println(resultid);
		return resultid;
	}
	
	public static void main(String[] args) {
		
		List<HouseBean> resultid =  new ArrayList<HouseBean>();
		
		System.out.println(resultid);
		
	}

}
