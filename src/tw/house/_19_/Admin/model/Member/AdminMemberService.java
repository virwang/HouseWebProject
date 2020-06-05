package tw.house._19_.Admin.model.Member;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tw.house._08_.register.model.MemberBean;


@Service
@Transactional
public class AdminMemberService {
	@Autowired
	AdminMemberDao AMDao;
	
	public List<MemberBean> getMembers() {
		return AMDao.getMembers();
	}
	
	public MemberBean getById(Integer id) {
		return AMDao.getById(id);
	}
	public boolean update(MemberBean memberBean) {
		return AMDao.update(memberBean);
}
	public boolean delete(MemberBean memberBean) {
		return AMDao.delete(memberBean);
}
	
}
