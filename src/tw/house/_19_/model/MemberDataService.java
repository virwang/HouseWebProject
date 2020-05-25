package tw.house._19_.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tw.house._08_.register.model.MemberBean;

@Service
@Transactional
public class MemberDataService {
	
	@Autowired
	MemberDataDao memberDao;
	
	public List<MemberBean> memberList(String account) {
		return memberDao.memberList(account);
	}
	
//	public List<MemberBean> memberList() {
//		return memberDao.memberList();
//	}
	

}
