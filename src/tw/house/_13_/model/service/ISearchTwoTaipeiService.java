package tw.house._13_.model.service;

import java.util.List;

import tw.house._13_.model.bean.TwoTaipei;


public interface ISearchTwoTaipeiService {

	public List<TwoTaipei> selectTaipeiDistrict (String district);

}
