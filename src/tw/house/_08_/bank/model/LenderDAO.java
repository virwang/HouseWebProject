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
	public boolean insertLender(Lender bean) {
		try{
			getSession().save(bean);
			System.out.println("success insert Lender");
			return true;
		}catch (Exception e) {
			System.out.println("falied to insert Lender");
		}
		return false;
	}
	public Lender selectLender(Integer pkNo) {
		Query<Lender> query=getSession().createQuery("from Lender where pkNo=:pkno",Lender.class);
		query.setParameter("pkno", pkNo);
		Lender lbean=query.uniqueResult();
		return lbean;
	}
	public boolean checkLender(Integer pkNo) {
		Query<Lender> query=getSession().createQuery("from Lender where pkNo=:pkno",Lender.class);
		query.setParameter("pkno", pkNo);
		
		Lender lbean=query.uniqueResult();
		if(lbean!=null) {
			return false;
		}
		return true;
	}
	public void delete(Lender lender) {
		getSession().delete(lender);
		
	}
	

}
