package tw.house._13_.model.dao;

import java.util.List;

import tw.house._13_.model.bean.TwoTaipei;

public interface AjaxISearchTwoTaipei {

	public List<TwoTaipei> SearchTwoTaipeiYear (String district, String sdate,String location);
	public List<TwoTaipei> selectTwoTaipeiID(Integer id);
	public List<TwoTaipei> ShowSearchTwoTaipeiPageYear(String district, String sdate);
	
}
