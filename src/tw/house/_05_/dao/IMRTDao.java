package tw.house._05_.dao;

import java.util.List;

import tw.house._05_.model.MRTBean;

public interface IMRTDao {
	public List<MRTBean> getStation(String station);
	
	
}
