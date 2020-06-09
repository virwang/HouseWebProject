package tw.house._05_.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.house._05_.model.CompareBean;
import tw.house._05_.model.FavoriteBean;
import tw.house._07_.model.HouseBean;
import tw.house._08_.register.model.MemberBean;

@Repository
public class CompareDao {
	@Autowired
	private SessionFactory factory;

	public Session getSession() {
		System.out.println("--- session begin in comparedao ---");
		return factory.getCurrentSession();
	}
	//列出資料
	public List<HouseBean> comparelist(HouseBean houseBean) {
		String queryAll = "select * from HouseBean";
		Query<HouseBean> query = getSession().createQuery(queryAll, HouseBean.class);
		List<HouseBean> hBeanlist = new ArrayList<HouseBean>();
		hBeanlist = query.list();
		for (HouseBean hBean : hBeanlist) {
			System.out.println(hBeanlist.toString());
		}
		return hBeanlist;
	};

	//save compare
	public int saveCompare(HouseBean houseBean) {
		int n = 0;
		System.out.println("into dao");
		CompareBean exist = (CompareBean) comparelist(houseBean);
		System.out.println(exist);
		if (exist != null) {
			System.out.println("house already compare");
			return -1;
		}
		try {
			System.out.println("house exit");
			CompareBean compareBean = new CompareBean();
			compareBean.setHouseBean(houseBean);

			getSession().save(compareBean);
			n = 1;
		} catch (Exception e) {
			System.out.println("compare house dao saving session error");
			n = -2;
		}
		System.out.println("save dao compare ");
		return n;
	}

	//delete compare
	public boolean deleteCompare(Integer cpk) {
		System.out.println("delete comparedao fid =" + cpk);
		CompareBean compareBean = getSession().get(CompareBean.class, cpk);
		CompareBean cBean = compareBean;
		if (compareBean != null) {
			System.out.println("check if compareBean != null, dao cpk = ?" + cpk);
			getSession().evict(compareBean);
			getSession().delete(cBean);
			return true;
		} else {
			System.out.println("if compareBean = null, cpk = ?" + cpk);
			return false;
		}

	}
}
