package tw.house._19_.Admin.model.House;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tw.house._07_.model.HouseBean;

@Service
@Transactional
public class AdminHouseService {

	@Autowired
	AdminHouseDao AHDao;
	
	public List<HouseBean> getHouses() {
		return AHDao.getHouses();
	}
	
	public HouseBean getById(Integer id) {
		return AHDao.getById(id);
	}
	public boolean update(HouseBean bean) {
		return AHDao.update(bean);
}
	public boolean deleteHouse(HouseBean bean) {
		 return AHDao.deleteHouse(bean);
}
	
}
	
	
