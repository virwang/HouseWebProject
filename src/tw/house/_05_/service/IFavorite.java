package tw.house._05_.service;

import java.util.List;

import tw.house._05_.model.FavoriteBean;
import tw.house._07_.model.HouseBean;
import tw.house._08_.register.model.MemberBean;
import tw.house._13_.model.bean.TwoTaipei;

public interface IFavorite {

	List<FavoriteBean> memberFavorite();

	List<FavoriteBean> mfhosue(Integer mid);

	int saveFavorite(HouseBean houseBean, MemberBean memberBean);

	boolean deleteFavorite(Integer fid);
	
	boolean deleteFavoriteByHid(Integer hid);

}