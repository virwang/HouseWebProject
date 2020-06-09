package tw.house._05_.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import jnr.ffi.Struct.int16_t;
import tw.house._05_.dao.CompareDao;
import tw.house._07_.model.HouseBean;

@Service
@EnableTransactionManagement
public class SCompare  {

	
	@Autowired
	private CompareDao cDao;
	public Object saveCompare;

	public List<HouseBean> compareList
	(HouseBean houseBean) {			
		System.out.println("print all houseBean for compare in dao");
		return cDao.comparelist(houseBean);
	}

	
	public boolean deleteCompare(Integer cpk) {
		System.out.println("delete compare by integer cpk"+cpk);
		return cDao.deleteCompare(cpk);
	}

	public int saveCompare(HouseBean houseBean) {
		
		System.out.println("save compare house by integer id"+houseBean.getTitle());
		return cDao.saveCompare(houseBean);
	} 
}
