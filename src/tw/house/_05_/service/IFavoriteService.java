package tw.house._05_.service;

import java.util.List;

import jnr.ffi.Struct.int16_t;
import tw.house._05_.model.FavoriteBean;
import tw.house._07_.model.HouseBean;
import tw.house._08_.register.model.MemberBean;

public interface IFavoriteService {
	List<FavoriteBean> memberFavorite();
	List<FavoriteBean> mfhosue(Integer mid);
	public int saveFavorite(HouseBean houseBean,MemberBean memberBean);
	void deleteFavoriteById(Integer fid);

//	void update(FavoriteBean fBean);


	

}
