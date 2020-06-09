package tw.house._05_.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import tw.house._05_.dao.CompareDao;
import tw.house._07_.model.HouseBean;

@Service
@EnableTransactionManagement
public class SCompare  {

	@Autowired
	private CompareDao cDao;

	public List<HouseBean> compareList
	(HouseBean houseBean) {			
		System.out.println("print all houseBean for compare in dao");
		return cDao.comparelist(houseBean);
	}

}
