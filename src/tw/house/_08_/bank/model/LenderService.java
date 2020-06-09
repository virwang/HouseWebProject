package tw.house._08_.bank.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//@Transactional
@Service
public class LenderService {
	@Autowired
	private LenderDAO lenderDao;
	public List<Lender> lenderList(){
		return lenderDao.lenderList();
	}
	public List<Lender> lenderCity(String city,String starLevel){
		return lenderDao.lenderCity(city,starLevel);
	}
	public List<Lender> lenderCityDist(String city,String dist,String starLevel){
		return lenderDao.lenderCityDist(city,dist,starLevel);
	}
	public boolean insertLender(Lender bean) {
		return lenderDao.insertLender(bean);
	}
	public Lender selectLender(Integer pkNo) {
		 return lenderDao.selectLender(pkNo);
	}
	public boolean checkLender(Integer pkNo) {
		return lenderDao.checkLender(pkNo);
	}
	public void delete(Lender lender) {
		lenderDao.delete(lender);
	}
	
}
