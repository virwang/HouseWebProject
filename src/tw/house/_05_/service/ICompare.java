package tw.house._05_.service;

import java.util.List;

import tw.house._05_.model.Compare;

public interface ICompare {
	public List<Compare> getUserId(Integer userid);
	public List<Compare> getHouseId(Integer houseid);
}
