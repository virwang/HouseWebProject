package tw.house._07_.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("houseService")
public class HouseService {
	@Autowired
	private HouseDAO houseDAO;
	
	public List<HouseBean> houseList() {
		return houseDAO.houseList();
	}

	public List<HouseBean> memberHouseList(String macct) {
		return houseDAO.memberHouseList(macct);
	}
	public HouseBean selectedHouse(Integer hid) {
		return houseDAO.selectedHouse(hid);
	}
	
	public HouseBean updateHouse(HouseBean hBean) {
		return houseDAO.updateHouse(hBean);
	}

	public boolean insertHouse(HouseBean hBean) {
		return houseDAO.insertHouse(hBean);
	}

	public boolean deleteHouse(Integer hid) {
		return houseDAO.deleteHouse(hid);
	}
}
