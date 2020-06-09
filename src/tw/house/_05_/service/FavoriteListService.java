package tw.house._05_.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import tw.house._05_.dao.IFavoritedao;
import tw.house._05_.model.FavoriteBean;
import tw.house._07_.model.HouseBean;
import tw.house._08_.register.model.MemberBean;
import tw.house._13_.model.bean.TwoTaipei;

//@Transactional
@Service
@EnableTransactionManagement
public class FavoriteListService implements IFavorite  {

	@Autowired
	private IFavoritedao favoriteDao;


	@Override
	public List<FavoriteBean> memberFavorite() {
		System.out.println("service list all favorite");
		return favoriteDao.favoriteList();
	}


	@Override
	public List<FavoriteBean> mfhosue(Integer mid) {
		System.out.println("favorite service by mid, where mid =" + mid);
		return favoriteDao.mfhouse(mid);
	}
	
	@Override
	public boolean deleteFavoriteByHid(Integer hid) {
		return favoriteDao.deleteFavoriteByHid(hid);
	}


	@Override
	public int saveFavorite(HouseBean houseBean, MemberBean memberBean) {
		int n = favoriteDao.saveFavorite(houseBean, memberBean);
		return n;
	}

	@Override
	public boolean deleteFavorite(Integer fid) {
		System.out.println("delete favorite service, id = "+ fid);
		
		return favoriteDao.deleteFavorite(fid);
	}
}
