package tw.house._13_.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.house._13_.model.bean.TwoTaipei;
import tw.house._13_.model.dao.AjaxSearchTwoTaipeiDao;


@Service
public class AjaxSearchTwoTaipeiService implements AjaxISearchTwoTaipeiService {

	AjaxSearchTwoTaipeiDao aSTTDao;
	
	@Autowired
	public void setASTTDao(AjaxSearchTwoTaipeiDao aSTTDao) {
		this.aSTTDao = aSTTDao;
	}

	@Override
	public List<TwoTaipei> SearchTwoTaipeiYear(String district, String sdate, String location) {
		return aSTTDao.SearchTwoTaipeiYear(district,sdate,location);
	}

	@Override
	public List<TwoTaipei> selectTwoTaipeiID(Integer id) {
		return aSTTDao.selectTwoTaipeiID(id);
	}

	@Override
	public List<TwoTaipei> ShowSearchTwoTaipeiPageYear(String district, String sdate) {
		return aSTTDao.ShowSearchTwoTaipeiPageYear(sdate,district);
	}

}

 