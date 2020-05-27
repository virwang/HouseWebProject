package tw.house._05_.dao;

import java.util.List;

import tw.house._05_.model.FavoriteBean;

public interface IFravoriteDao {
	// save added favorite
	// delete favorite
	// update favorite
	// query all data
	// query by houseid
	// query by accountid
	Object save(FavoriteBean fBean);

	void deleteFavorite(int fid);

	void updateFavorite(FavoriteBean fBean);

	List<FavoriteBean> query();

	List<FavoriteBean> getHouseid(int hosueid);

	List<FavoriteBean> getMemberid(int accountid);

}
