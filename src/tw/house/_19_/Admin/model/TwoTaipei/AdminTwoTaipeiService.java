package tw.house._19_.Admin.model.TwoTaipei;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tw.house._13_.model.bean.TwoTaipei;



@Service
@Transactional
public class AdminTwoTaipeiService {

	@Autowired
	AdminTwoTaipeiDao ATTDao;
	
	public List<TwoTaipei> getTwoTaipeis() {
		return ATTDao.getTwoTaipeis();
	}
	
	public TwoTaipei getById(Integer id) {
		return ATTDao.getById(id);
	}
	public boolean update(TwoTaipei bean) {
		return ATTDao.update(bean);
}
	public boolean save(TwoTaipei bean) {
		return ATTDao.save(bean);
	}
	public boolean delete(TwoTaipei bean) {
		 return ATTDao.delete(bean);
}
}
	
	
