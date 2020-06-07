package tw.house._13_.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.house._13_.model.bean.TwoTaipei;


@Repository
public class AjaxSearchTwoTaipeiDao implements AjaxISearchTwoTaipei {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public AjaxSearchTwoTaipeiDao() {
	}

	// 用年份跟字串抓資料
	@SuppressWarnings("unchecked")
	@Override
	public List<TwoTaipei> SearchTwoTaipeiYear(String district, String sdate, String location) {
		Session session = factory.getCurrentSession();
		List<TwoTaipei> tlen = new ArrayList<>();
		String sql ="select * from TwoTaipei where sdate like :select_year and district= :districtavg and location like :searchword ";
		tlen= (List<TwoTaipei>) session.createNativeQuery(sql).addEntity(TwoTaipei.class).setParameter("select_year",sdate+"%").setParameter("districtavg",district)
				.setParameter("searchword","%"+location+"%").list();
		return tlen;
	}

	@Override
	public List<TwoTaipei> selectTwoTaipeiID(Integer id) {
		Session session = factory.getCurrentSession();
		Query<TwoTaipei> query = session.createQuery("from TwoTaipei where id= :id", TwoTaipei.class);
		List<TwoTaipei> tlist = query.setParameter("id", id).list();
		return tlist;
	}

	@Override
	public List<TwoTaipei> ShowSearchTwoTaipeiPageYear(String district, String sdate) {
		Session session = factory.getCurrentSession();
		Query<TwoTaipei> query = session.createQuery("from TwoTaipei where sdate like :select_year and district= :districtavg", TwoTaipei.class);
		List<TwoTaipei> tlist = query.setParameter("select_year", sdate+"%").setParameter("districtavg",district).list();
		return tlist;
	}
	
	
}
