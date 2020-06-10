package tw.house._05_.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.house._05_.model.FavoriteBean;

@Repository
public class PathDao {
	@Autowired
	private SessionFactory factory;

	@Autowired
	public Session getSession() {
		System.out.println("==================path dao ===========");
		return factory.getCurrentSession();
	}

	// 計算總收藏排名
	public List<Object> top3FaHouse() {
		String sql = "select top 3 f.houseid, count(f.houseid) as sort, h.title, h.totalprice, h.city, h.dist from Favorite f left join Houselist h on f.houseid = h.id\r\n" + 
				"group by houseid,f.houseid , h.title, h.totalprice, h.city, h.dist order by count(houseid) desc";
		Query<Object> query = getSession().createSQLQuery(sql);
		List<Object> list= query.getResultList();
		return list;
	}
}
