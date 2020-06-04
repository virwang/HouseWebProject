package tw.house._13_.model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AjaxSearchTwoTaipeiDao implements AjaxISearchTwoTaipei {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public AjaxSearchTwoTaipeiDao() {
	}

	// 用年份抓表格長度
	@Override
	public long SearchTwoTaipeiYear(String district, String sdate, String location) {
		Session session = factory.getCurrentSession();
		Long tlen= session.createQuery(
				"select count(*) from TwoTaipei where sdate like=:'select_year%' and district=:districtavg and location like=:'%searchword%'",Long.class)
				.setParameter("select_year", sdate).setParameter("districtavg", district)
				.setParameter("searchword", location).getSingleResult();
		System.out.println("DAOtlen="+tlen);
		return tlen;
	}

	// 用模糊字串抓再算平均單價
	@Override
	public long selectTwoTaipeiDistrict(String district, String location, String sdate) {
		Session session = factory.getCurrentSession();
		Float tpirce= session.createQuery(
				"select avg(uprice_p) from TwoTaipei where sdate like=:'select_year%' and district=:districtavg and location like=:'%searchword%'",Float.class)
				.setParameter("select_year", sdate).setParameter("districtavg", district)
				.setParameter("searchword", location).getSingleResult();
		System.out.println("DAOtpirce="+tpirce);
		return tpirce;
	}


}
