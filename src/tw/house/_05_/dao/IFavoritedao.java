package tw.house._05_.dao;

import java.util.List;

import org.hibernate.Session;

import tw.house._05_.model.FavoriteBean;
import tw.house._07_.model.HouseBean;
import tw.house._08_.register.model.MemberBean;
import tw.house._13_.model.bean.TwoTaipei;

public interface IFavoritedao {

	Session getSession();

	List<FavoriteBean> favoriteList();

	List<FavoriteBean> mfhouse(Integer mid);

	List<FavoriteBean> favoriteHouse(String title, String totalprice);

	int saveFavorite(HouseBean houseBean, MemberBean memberBean);

	boolean deleteFavorite(Integer fid);
	
	boolean deleteFavoriteByHid(Integer hid);
	
	

}