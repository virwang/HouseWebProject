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
	public FavoriteBean getid(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FavoriteBean> queryMemberid(int accountid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int fid) {
		// TODO Auto-generated method stub
		
	}




}
