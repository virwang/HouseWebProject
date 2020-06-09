package tw.house._07_.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HouseHitService {

	@Autowired
	private HouseHitDAO hitDAO;
	
	public HouseHitBean getHtBean(Integer id) {
		return hitDAO.getHtBean(id);
	}
	public boolean updateHit(HouseHitBean htBean) {
		return hitDAO.updateHit(htBean);
	}
	public boolean insertHit(Integer hid) {
		return hitDAO.insertHit(hid);
	}
	public boolean deleteHit(Integer hid) {
		return hitDAO.deleteHit(hid);
	}
}
