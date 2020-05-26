package tw.house._05_.dao;

import java.util.List;

import tw.house._05_.model.FavoriteBean;



public interface IFravoriteDao {
	Object save(FavoriteBean fBean);
	List<FavoriteBean> query();
	List<FavoriteBean> getHouseid(Integer hosueid);
	List<FavoriteBean> getMemberid(int accountid);
	void deleteFavorite(int fid);
	
	
	
}
