package tw.house._05_.dao;

import java.util.List;

import tw.house._05_.model.NewTaipeiBean;

public interface NewTaipeiDAOInter {	
	public List<NewTaipeiBean> getDistrict(String district);
}
