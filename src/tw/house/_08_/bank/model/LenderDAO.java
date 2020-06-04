package tw.house._08_.bank.model;


import java.util.ArrayList;
import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LenderDAO {
	@Autowired
	SessionFactory factory;
	public Session getSession() {
		return factory.getCurrentSession();
	}
	public List<Lender> lenderList(){
		String hquery="from Lender";
		Query<Lender> query= getSession().createQuery(hquery,Lender.class);
		List<Lender> list = new ArrayList<>();
		list=query.list();
		for (Lender lender : list) {
			System.out.println(lender.toString());
			System.out.println(lender.getMemberBean().getName());
			System.out.println(lender.getBankTest().getBankName());
		}
		return list;
	}
	public List<Lender> lenderCity(String city,String starLevel){

		Query<Lender> query=getSession().createQuery("from Lender where bankTest.bankCity =:bcity and star=:starLevel",Lender.class);
		query.setParameter("bcity", city).setParameter("starLevel", starLevel);
		List<Lender> list=new ArrayList<>();
		list=query.getResultList();
		for (Lender lender : list) {
			System.out.println(lender.toString());
		}	
		return list;
	}
	public List<Lender> lenderCityDist(String city,String dist,String starLevel){

		Query<Lender> query=getSession().createQuery("from Lender where bankTest.bankCity =:bcity and bankTest.bankDist=:bdist and star=:starLevel",Lender.class);
		query.setParameter("bcity", city).setParameter("bdist", dist).setParameter("starLevel", starLevel);
		List<Lender> list=new ArrayList<>();
		list=query.getResultList();
		for (Lender lender : list) {
			System.out.println(lender.toString());
		}	
		return list;
	}
	public Object save(Lender bean) {
		Session session = factory.getCurrentSession();
		return session.save(bean);
	}

}
