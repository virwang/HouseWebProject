package tw.house._05_.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class PathDao {
	@Autowired
	private SessionFactory factory;

	@Autowired
	public Session getSession() {
//		System.out.println("===========path dao ===========");
		return factory.getCurrentSession();
	}

	// 計算總收藏排名
	@SuppressWarnings("unchecked")
	public List<Object> top3FaHouse() {
//		System.out.println("=========into path dao sql ========== ");
		String sql = "select top 3 f.houseid, count(f.houseid) as sort, h.title, h.totalprice, h.city, h.dist from Favorite f left join Houselist h on f.houseid = h.id\r\n" + 
				"group by houseid,f.houseid , h.title, h.totalprice, h.city, h.dist order by count(f.houseid) desc";
		
		Query<Object> query = getSession().createSQLQuery(sql);
		System.out.println("query sql path");
		List<Object> list= query.getResultList();
		System.out.println("return list of query sql at path");
		return list;
	}
}
