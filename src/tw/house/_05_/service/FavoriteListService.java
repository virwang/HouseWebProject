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
	public List<FavoriteBean> getAllData() {
		System.out.println("server query all data ="+getAllData().size());
		return fdao.query();
	}

//	@Override
//	public List<FavoriteBean> getMemberid(int accountid) {
//		System.out.println("server query by mid ="+ accountid);
//		return fdao.getMemberid(accountid);
//	}
//
//	@Override
//	public Object save(FavoriteBean fBean) {
//		System.out.println("server save by fid"+fBean.getFid());
//		return fdao.save(fBean);
//	}
//
//	@Override
//	public void update(FavoriteBean fBean) {
//		System.out.println("server update by fid ="+fBean.getFid());
//		fdao.updateFavorite(fBean);;
//		
//	}
//
//	@Override
//	public void delete(int fid) {
//		System.out.println("delete by fid ="+fid);
//		fdao.deleteFavorite(fid);;
//		
//	}




}
