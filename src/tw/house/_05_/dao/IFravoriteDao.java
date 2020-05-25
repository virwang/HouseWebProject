package tw.house._05_.dao;

import java.util.List;

import tw.house._05_.model.FavoriteBean;

public interface IFravoriteDao {
	List<FavoriteBean> getAccountId(Integer accountid);
	List<FavoriteBean> getHouseId(Integer houseid);
}
