package tw.house._05_.service;

import java.util.List;

import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import tw.house._05_.dao.NewTaipeiDAOimpl;
import tw.house._05_.model.NewTaipeiBean;
import tw.house._05_.service.NewTaipeiServiceInter;

@Transactional
@Service
@EnableTransactionManagement
public class NewTaipeiServiceimpl implements NewTaipeiServiceInter {

	NewTaipeiDAOimpl ntpDao;

	@Autowired
	public void setSTTDao(NewTaipeiDAOimpl ntpDao) {
		this.ntpDao = ntpDao;
	}

	@Override
	public List<NewTaipeiBean> getDistrict(String district) {

		System.out.println("service query newtaipei district");
		
		return ntpDao.getDistrict(district);
	}

}
