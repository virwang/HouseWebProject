package tw.house._19_.MemberData.model;


import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tw.house._08_.register.model.MemberBean;

@Service
@Transactional
public class MemberDataService {
	
	@Autowired
	MemberDataDao memberDao;
	
	public MemberBean memberBean(String account) {
		return memberDao.memberBean(account);
	}
	
	public boolean update(MemberBean memberBean) {
		return memberDao.update(memberBean);
	}
	public MemberBean getByPk(Integer id) {
		return memberDao.getByPk(id);
	}

}
