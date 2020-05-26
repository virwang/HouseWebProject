package tw.house._05_.service;

import java.util.List;

import tw.house._05_.model.FavoriteBean;

public interface IFavoriteList {
	FavoriteBean getAllData();

	List<FavoriteBean> getMemberid(int accountid);
	void delete(int fid);

	

}
