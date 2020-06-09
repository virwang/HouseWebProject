package tw.house._08_.register.model;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
@Service
public class MemberService {
	@Autowired @Qualifier("memberDao")
	private MemberDao mDao;


	public MemberService(MemberDao mDao) {
		this.mDao=mDao;
	}

	public boolean AccountExist(String account) {
		return mDao.AccountExist(account);
	}
	public void insertMember(MemberBean bean) {
		mDao.insertMember(bean);

	}
	public MemberBean checkGoogleId(MemberBean memberBean) {
		return mDao.checkGoogleId(memberBean);
	}
	
}
