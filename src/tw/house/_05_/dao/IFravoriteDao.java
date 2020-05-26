package tw.house._05_.dao;

import java.util.List;

import tw.house._07_.model.HouseBean;


public interface IFravoriteDao {

	List<HouseBean> getHouseid(Integer accountid);
//	List<HouseBean> getHouseId(Integer houseid);
}
