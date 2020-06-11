package tw.house._05_.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.house._05_.dao.PathDao;
import tw.house._05_.model.FavoriteBean;

@Service
@Transactional
public class PathService {
	
	@Autowired
	private PathDao pDao;
	
	public List<Object> top3FaHouse() {
//		System.out.println("into path service");
		List<Object> list = pDao.top3FaHouse();
//		System.out.println("return path service list");
		return list;
	}
}
