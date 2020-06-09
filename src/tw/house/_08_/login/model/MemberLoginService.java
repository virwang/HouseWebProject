package tw.house._08_.login.model;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import tw.house._08_.register.model.MemberBean;


@Service
public class MemberLoginService {
	@Autowired 
	private MemberLoginDAO mLDao;
	
	public MemberLoginService(MemberLoginDAO mLDao) {
		this.mLDao=mLDao;				
	}

	public MemberBean checkAccPwd(String account, String psw) {	
			MemberBean memberBean=	mLDao.checkAccPwd(account, psw);
				return memberBean;
		
	}
	public  MemberBean checkAccEmail(String account, String email) {
		return mLDao.checkAccEmail(account, email);
	}
	public boolean  updatePsw(MemberBean mBean) {
		return mLDao.updatePsw(mBean);
	}
}
