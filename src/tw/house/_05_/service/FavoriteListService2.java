package tw.house._05_.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import tw.house._05_.dao.FavoriteDao2;
import tw.house._05_.model.FavoriteBean2;
import tw.house._07_.model.HouseBean;
import tw.house._08_.register.model.MemberBean;

//@Transactional
@Service
@EnableTransactionManagement
public class FavoriteListService2  {

	@Autowired
	private FavoriteDao2 favoriteDao;


	public List<FavoriteBean2> memberFavorite() {
		System.out.println("service list all favorite");
		return favoriteDao.favoriteList();
	}


	public List<FavoriteBean2> mfhosue(Integer mid) {
		System.out.println("favorite service by mid, where mid =" + mid);
		return favoriteDao.mfhouse(mid);
	}


	
	public int saveFavorite(HouseBean houseBean, MemberBean memberBean) {
		int n = favoriteDao.saveFavorite(houseBean, memberBean);
		return n;
	}


	public boolean deleteFavorite(Integer fid) {
		System.out.println("delete favorite service, id = "+ fid);
		favoriteDao.deleteFavorite(fid); 
		return favoriteDao.deleteFavorite(fid);
	}

//
//	@Override
//	public void update(FavoriteBean fBean) {
//		System.out.println("server update by fid ="+fBean.getFid());
//		fdao.updateFavorite(fBean);;
//		
//	}

}
