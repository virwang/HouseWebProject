package tw.house._05_.service;

import java.util.List;

import tw.house._05_.model.FavoriteBean;

public interface IFavoriteList {

	
	List<FavoriteBean> getAccountId(Integer accountid);

	List<FavoriteBean> getHouseId(Integer houseid);

}
