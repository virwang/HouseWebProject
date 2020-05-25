package tw.house._13_.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchTwoTaipeiService implements ISearchTwoTaipeiService {

	SearchTwoTaipeiDao sTTDao;
	
	@Autowired
	public void setSTTDao(SearchTwoTaipeiDao sTTDao) {
		this.sTTDao = sTTDao;
	}
	
	@Override
	public List<Taipei> selectTaipeiDistrict(String district) {
		return sTTDao.selectTaipeiDistrict(district);
	}

//	@Override
//	public List<NewTaipei> selectNewTaipeiDistrict(String district) {
//		return sTTDao.selectNewTaipeiDistrict(district);
//	}


}

 