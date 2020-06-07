package tw.house._13_.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.house._13_.model.bean.TwoTaipei;
import tw.house._13_.model.dao.SearchTwoTaipeiDao;

@Service
public class SearchTwoTaipeiService implements ISearchTwoTaipeiService {

	SearchTwoTaipeiDao sTTDao;
	
	@Autowired
	public void setSTTDao(SearchTwoTaipeiDao sTTDao) {
		this.sTTDao = sTTDao;
	}
	
	@Override
	public List<TwoTaipei> selectTaipeiDistrict(String district) {
		return sTTDao.selectTaipeiDistrict(district);
	}

}

 