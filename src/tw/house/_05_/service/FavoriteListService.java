package tw.house._05_.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import tw.house._05_.dao.FavoriteDao;
import tw.house._05_.model.FavoriteBean;

@Transactional
@Service
@EnableTransactionManagement
public class FavoriteListService implements IFavoriteList {
	
	FavoriteDao fdao;
	
	@Autowired
	public void setFDao(FavoriteDao fdao) {
		this.fdao = fdao;
	}
	

	@Override
	public List<FavoriteBean> getAccountId(Integer accountid) {
		System.out.println("Favorite Service here get accountid ");
		return fdao.getAccountId(accountid);
	}

	@Override
	public List<FavoriteBean> getHouseId(Integer houseid) {
		System.out.println("Favorite Service here get houseid ");
		return fdao.getHouseId(houseid);
	}

}
