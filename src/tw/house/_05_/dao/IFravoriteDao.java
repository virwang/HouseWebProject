package tw.house._05_.dao;

import java.util.List;

import tw.house._07_.model.HouseBean;
import tw.house._07_.model.MrtBean;


public interface IFravoriteDao {

	List<HouseBean> getHouseid(Integer id);
//	List<HouseBean> getMrt(String mrt);
//	List<HouseBean> getCity(String city);
//	List<MrtBean> getstation(String station);
//	List<HouseBean> showAll();
	
}
