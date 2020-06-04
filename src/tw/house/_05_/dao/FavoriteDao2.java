package tw.house._05_.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Repository;

import tw.house._05_.model.FavoriteBean2;
import tw.house._07_.model.HouseBean;
import tw.house._08_.register.model.MemberBean;

@Repository
public class FavoriteDao2 {
	@Autowired
	private SessionFactory factory;

	public Session getSession() {
		System.out.println("-----------session begin in dao---------");
		return factory.getCurrentSession();
	}

	public List<FavoriteBean2> favoriteList() {
		String queryAll = "from FavoriteBean";
		Query<FavoriteBean2> query = getSession().createQuery(queryAll, FavoriteBean2.class);
		List<FavoriteBean2> falist = new ArrayList<>();
		falist = query.list();
		for (FavoriteBean2 fb : falist) {
			System.out.println(fb.toString());
			System.out.println(fb.getHouseBean().getId());
			System.out.println(fb.getMemberBean().getPk());
		}
		return falist;

	}

	public List<FavoriteBean2> mfhouse(Integer mid) {
		String queryByMid = "from FavoriteBean2 where memberBean.pk = :pk";
		Query<FavoriteBean2> mfhouselist = getSession().createQuery(queryByMid, FavoriteBean2.class);
		mfhouselist.setParameter("pk", mid);
		List<FavoriteBean2> mfhList = new ArrayList<FavoriteBean2>();
		mfhList = mfhouselist.list();
//		System.out.println("fdao by mid, mid= " + mid);
		return mfhList;
	}

	
	public List<FavoriteBean2> favoriteHouse(String title, String totalprice) {

		Query<FavoriteBean2> query = getSession().createQuery(
				"from FavoriteBean2 where houseBean.gettitle = :title and gettotalprice = :totalprice",
				FavoriteBean2.class);
		query.setParameter("title", title).setParameter("totalprice", totalprice);
		List<FavoriteBean2> fList = new ArrayList<>();
		fList = query.getResultList();
		for (FavoriteBean2 fBean : fList) {
			System.out.println(fBean.toString());
		}
//		System.out.println("fdao getHouseBean data" + fList.size());
		return fList;
	}

	public int saveFavorite(HouseBean houseBean, MemberBean memberBean) {
		int n = 0;
		System.out.println("intodao");
		FavoriteBean2 exist = favoriteExist(houseBean, memberBean);
		System.out.println(exist);
		if (exist != null) {
			System.out.println("favorite hosue already exit");
			return -1;
		}
		try {
			System.out.println("favorite house exit");
			FavoriteBean2 fBean = new FavoriteBean2();
			fBean.setHouseBean(houseBean);
			fBean.setMemberBean(memberBean);
			getSession().save(fBean);
			n = 1;
		} catch (Exception e) {
			System.out.println("favorite house dao saving session error");
			n = -2;
		}
		System.out.println("save dao favorite ");
		return n;
	}

	private FavoriteBean2 favoriteExist(HouseBean houseBean, MemberBean memberBean) {
		System.out.println("intofavexit");

		String hql = "FROM FavoriteBean2 WHERE memberBean.pk =:pk and houseBean.id =:id";
		
			Query<FavoriteBean2> query = getSession().createQuery(hql,FavoriteBean2.class);
			query.setParameter("id", houseBean.getId());
			query.setParameter("pk", memberBean.getPk());
			FavoriteBean2 fb = new FavoriteBean2();
			fb = query.uniqueResult();
			return fb;
			
		
//		System.out.println("favorite not exit");

	}


	public boolean deleteFavorite(Integer fid) {
		String defavorite = "DELETE FROM Favorite where fid =: fid";
		Query<FavoriteBean2> query = getSession().createQuery(defavorite,FavoriteBean2.class);
		query.setParameter("fid", fid);
		query.executeUpdate();
		return true;
//		System.out.println("delete favorite dao fid ="+fid);
//		System.out.println("fid="+fid);
//		FavoriteBean favoriteBean= getSession().get(FavoriteBean.class, fid);
//		Integer id = favoriteBean.getFid();
//		System.out.println("id="+id);
//		getSession().delete(favoriteBean);
//		if (favoriteBean !=null) {
//			System.out.println("dao delete favorite "+favoriteBean);
//			System.out.println("check if fBean != null, fid = ?"+fid);
//			System.out.println("delete sucess ");
//			 return true;
//		}
////			System.out.println("if favoriteBean = null, fid = ?"+fid);
//			return false;
		
				
	}

}
