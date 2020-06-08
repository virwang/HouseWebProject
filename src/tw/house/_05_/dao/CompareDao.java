package tw.house._05_.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.house._07_.model.HouseBean;

public class CompareDao {
	@Autowired
	private SessionFactory factory;

	public Session getSession() {
		System.out.println("--------------session begin in comparedao --------------------------");
		return factory.getCurrentSession();
	}
	
	public List<HouseBean> houseBean = new ArrayList<HouseBean>() {
		
		String listHouse = "from*Housebean";
	
	};
	
}
