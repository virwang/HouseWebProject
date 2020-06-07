package tw.house._13_.model.dao;

import java.util.List;

import tw.house._13_.model.bean.TwoTaipei;



public interface ISearchTwoTaipei {

	public List<TwoTaipei> selectTaipeiDistrict (String district);
	
}
