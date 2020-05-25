package tw.house._07_.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class NewsBeanDAO {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	//單筆新聞(代入新聞ID回傳指定新聞(NewsBean))
	public NewsBean getSelectNews(Integer newsId) {
		return getSession().get(NewsBean.class, newsId);
	};
	

	//全部新聞
	public List<NewsBean> getPageNews(){
		Query<NewsBean> query = getSession().createQuery("from NewsBean", NewsBean.class);
		List<NewsBean> list = new ArrayList<>();
			list = query.list();
		return list;
	}
	

	//區域新聞
	public List<NewsBean> getSearchNews(String newsareaname){
		Query<NewsBean> query = getSession().createQuery("from NewsBean where newsareaname= :area", NewsBean.class);
		query.setParameter("area",newsareaname);
		List<NewsBean> list = query.list();
		return list;
	}
	
}
