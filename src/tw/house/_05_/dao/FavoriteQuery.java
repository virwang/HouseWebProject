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
import tw.house._05_.model.NewTaipeiBean;
import tw.house._07_.model.HouseBean;

@Repository
public class FavoriteQuery  {
	@Autowired
	SessionFactory factory;
	
	public FavoriteQuery() {
	}

	public List<HouseBean> getHouseBeans(Integer accountId) {

		Session session = factory.getCurrentSession();
		Query<FavoriteBean> query = session.createQuery("from FavoriteBean where fid = ?1",FavoriteBean.class);
		List<FavoriteBean> resultList = query.setParameter(1, accountId).list();
		
		List<Integer> hidList = null;
		for (FavoriteBean f : resultList) {
			hidList.add(f.getHouseid());
		}
		
		Query<HouseBean> query2 = session.createQuery("from HouseBean hb where hb.id in (?1)",HouseBean.class);
		
		List<HouseBean> resultList2 = query2.setParameterList(1, hidList).getResultList();
		
		
		System.out.println("resultList2.size()="+resultList2.size());
		
		return resultList2;
	}

	public static void main(String[] args) {
	

		FavoriteQuery fQuery=new FavoriteQuery();
//		fQuery.getHouseBeans(1);
		System.out.println(fQuery.getHouseBeans(6).get(0));
		
		
		
	}
	


}
