package tw.house._05_.dao;

import java.util.List;

import tw.house._05_.model.FavoriteBean;



public interface IFravoriteDao {
	List<FavoriteBean> query();
	List<FavoriteBean> getHouseid(Integer hosueid);
	void deleteFavorite(int fid);
	
	
}
