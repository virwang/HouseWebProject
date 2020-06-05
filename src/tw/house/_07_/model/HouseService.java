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

	public List<HouseBean> memberHouseList(Integer macct) {
		return houseDAO.memberHouseList(macct);
	}
	public HouseBean selectedHouse(Integer hid) {
		return houseDAO.selectedHouse(hid);
	}
	
	public boolean updateHouse(HouseBean hBean) {
		return houseDAO.updateHouse(hBean);
	}

	public boolean insertHouse(HouseBean hBean) {
		return houseDAO.insertHouse(hBean);
	}

	public boolean deleteHouse(Integer hid) {
		return houseDAO.deleteHouse(hid);
	}
	
	public List<HouseBean> mrthouse(Integer station){
		return houseDAO.mrthouse(station);
	}
	public List<HouseBean> searchHouse(String city,String dist,String addr){
		return houseDAO.searchHouse(city, dist, addr);
	}
}
