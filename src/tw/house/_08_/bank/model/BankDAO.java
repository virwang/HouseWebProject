package tw.house._08_.bank.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BankDAO {
	@Autowired
	SessionFactory factory;
	public Session getSession() {
		return factory.getCurrentSession();
	}
	public List<BankCodeBean> AllbankCode(){
		Query<BankCodeBean> query=getSession().createQuery("from BankCodeBean",BankCodeBean.class);
		List<BankCodeBean> list = new ArrayList<BankCodeBean>();
		list=query.list();
		 return list;
	}
	public List<BankBean>SelectBranch(String bankCode) {
		Query<BankBean> query=getSession().createQuery("from BankBean where bankCode=:bCode",BankBean.class);
		query.setParameter("bCode", bankCode);
		List<BankBean> list= new ArrayList<BankBean>();
		list=query.getResultList();
		return list;
	}
	public BankBean searchBank(String branchCode) {
		Query<BankBean> query=getSession().createQuery("from BankBean where branchCode=:bbCode",BankBean.class);
		query.setParameter("bbCode", branchCode);
		BankBean bTest=query.uniqueResult();
		return bTest;
	}
	
}
