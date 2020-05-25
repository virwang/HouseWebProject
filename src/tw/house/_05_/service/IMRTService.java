package tw.house._05_.service;

import java.util.List;

import tw.house._05_.model.MRTBean;

public interface IMRTService {
	
	public List<MRTBean> getStation(String station);
}
