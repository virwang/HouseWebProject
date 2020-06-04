package tw.house._13_.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AjaxSearchTwoTaipeiService implements AjaxISearchTwoTaipeiService {

	AjaxSearchTwoTaipeiService aSTTDao;
	
	@Autowired
	public void setASTTDao(AjaxSearchTwoTaipeiService aSTTDao) {
		this.aSTTDao = aSTTDao;
	}

	@Override
	public long SearchTwoTaipeiYear(String district, String sdate, String location) {
		return aSTTDao.SearchTwoTaipeiYear(district,sdate,location);
	}

	@Override
	public long selectTwoTaipeiDistrict(String district, String sdate, String location) {
		return aSTTDao.selectTwoTaipeiDistrict(district,sdate,location);
	}


}

 