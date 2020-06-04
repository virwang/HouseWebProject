package tw.house._05_.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import tw.house._05_.model.FavoriteBean;
import tw.house._07_.model.HouseBean;
import tw.house._08_.register.model.MemberBean;

@Repository
public class FavoriteDao implements IFavoritedao {
	@Autowired
	private SessionFactory factory;

	@Override
	public Session getSession() {
		System.out.println("--------------session begin in dao --------------------------");
		return factory.getCurrentSession();
	}

	@Override
	public List<FavoriteBean> favoriteList() {
		String queryAll = "from FavoriteBean";
		Query<FavoriteBean> query = getSession().createQuery(queryAll, FavoriteBean.class);
		List<FavoriteBean> falist = new ArrayList<>();
		falist = query.list();
		for (FavoriteBean fb : falist) {
			System.out.println(fb.toString());
			System.out.println(fb.getHouseBean().getId());
			System.out.println(fb.getMemberBean().getPk());
		}
		return falist;

	}

	@Override
	public List<FavoriteBean> mfhouse(Integer mid) {
		String queryByMid = "from FavoriteBean where memberBean.pk = :pk";
		Query<FavoriteBean> mfhouselist = getSession().createQuery(queryByMid, FavoriteBean.class);
		mfhouselist.setParameter("pk", mid);
		List<FavoriteBean> mfhList = new ArrayList<FavoriteBean>();
		mfhList = mfhouselist.list();
//		System.out.println("fdao by mid, mid= " + mid);
		return mfhList;
	}

	@Override
	public List<FavoriteBean> favoriteHouse(String title, String totalprice) {

		Query<FavoriteBean> query = getSession().createQuery(
				"from FavoriteBean where houseBean.gettitle = :title and gettotalprice = :totalprice",
				FavoriteBean.class);
		query.setParameter("title", title).setParameter("totalprice", totalprice);
		List<FavoriteBean> fList = new ArrayList<>();
		fList = query.getResultList();
		for (FavoriteBean fBean : fList) {
			System.out.println(fBean.toString());
		}
//		System.out.println("fdao getHouseBean data" + fList.size());
		return fList;
	}

	@Override
	public int saveFavorite(HouseBean houseBean, MemberBean memberBean) {
		int n = 0;
		System.out.println("intodao");
		FavoriteBean exist = favoriteExist(houseBean, memberBean);
		System.out.println(exist);
		if (exist != null) {
			System.out.println("favorite hosue already exit");
			return -1;
		}
		try {
			System.out.println("favorite house exit");
			FavoriteBean fBean = new FavoriteBean();
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

	private FavoriteBean favoriteExist(HouseBean houseBean, MemberBean memberBean) {
		System.out.println("intofavexit");

		String hql = "FROM FavoriteBean WHERE memberBean.pk =:pk and houseBean.id =:id";
		
			Query<FavoriteBean> query = getSession().createQuery(hql,FavoriteBean.class);
			query.setParameter("id", houseBean.getId());
			query.setParameter("pk", memberBean.getPk());
			FavoriteBean fb = new FavoriteBean();
			fb = query.uniqueResult();
			return fb;
			
		
//		System.out.println("favorite not exit");

	}

	@Override
	public void deleteFavoriteById(Integer fid) {
		Session session = factory.getCurrentSession();
		FavoriteBean favoriteBean = new FavoriteBean();
		favoriteBean.setFid(fid);
		session.delete(favoriteBean);
	}

}
