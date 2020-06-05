package tw.house._19_.Admin.model.New;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tw.house._07_.model.NewsBean;

@Service("adminNewService")
@Transactional
public class AdminNewService {

	@Autowired
	AdminNewDao ANDao;
	
	public List<NewsBean> getNews() {
		return ANDao.getNews();
	}
	
	public NewsBean getById(Integer id) {
		return ANDao.getById(id);
	}
	public boolean update(NewsBean bean) {
		return ANDao.update(bean);
}
	public boolean delete(NewsBean bean) {
		return ANDao.delete(bean);
}
	public boolean save(NewsBean bean) {
		return ANDao.save(bean);
	}
}
	
	
