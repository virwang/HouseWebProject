package tw.house._07_.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewsBeanService {
	@Autowired
	private NewsBeanDAO nDao;
	
	public NewsBean getSelectNews(Integer newsId) {
		return nDao.getSelectNews(newsId);
	}

	public List<NewsBean> getPageNews() {
		return nDao.getPageNews();
	}

	public List<NewsBean> getSearchNews(String newsareaname) {
		return nDao.getSearchNews(newsareaname);
	}

}
