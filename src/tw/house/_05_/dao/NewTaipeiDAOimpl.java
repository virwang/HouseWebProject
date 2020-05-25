package tw.house._05_.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.house._05_.model.NewTaipeiBean;

@Repository
public class NewTaipeiDAOimpl implements NewTaipeiDAOInter  {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		System.out.println("session begin Dao");
		this.factory = factory;
	}

	public NewTaipeiDAOimpl() {
	}

	@Override
	public List<NewTaipeiBean> getDistrict(String district) {

		Session session = factory.getCurrentSession();
		Query<NewTaipeiBean> query = session.createQuery("from NewTaipeiBean where district = :selectcity",
				NewTaipeiBean.class);
		List<NewTaipeiBean> resultList = query.setParameter("selectcity", district).getResultList();
//		System.out.println("newtaipeiDao"+resultList);
		System.out.println("resultList.size()="+resultList.size());
		
		return resultList;
	}

}
