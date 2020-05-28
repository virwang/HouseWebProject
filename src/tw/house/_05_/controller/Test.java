package tw.house._05_.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import tw.house._05_.model.FavoriteBean;
import tw.house._05_.service.FavoriteListService;
import tw.house._07_.model.HouseBean;
import tw.house._07_.model.HouseService;
import tw.house._07_.model.MrtBean;
import tw.house._07_.model.MrtService;
import tw.house._08_.register.model.MemberBean;

public class Test {
	@Autowired
	SessionFactory session;
	@Autowired
	FavoriteListService fs;
	@Autowired
	HouseService hs;
	@Autowired
	MrtService ms;
	
	public String addToF(Model m,
			HttpServletRequest res,
			@RequestParam("houseId") Integer houseId
			)
	{
		HttpSession session = res.getSession();
		
		 MemberBean member=(MemberBean) session.getAttribute("LoginOK");
//		if(member==null) {
//			return "_08_login";
//		}
		 
		FavoriteBean fBean=new FavoriteBean();
//		FavoriteBean fb= (FavoriteBean)session.getAttribute("favorite");
//		if(fb==null) {
//			session.setAttribute("favorite", fBean);
//			
//			
//		}
		
//		MrtBean mrt = (MrtBean)session.
		
		List<HouseBean> houseBean = hs.selectedHouse(houseId);
//		MrtBean mrtBean = ms.selectedStaion(mrtpk);

		
		
//		fBean.sethBean(houseBean);
//		fBean.setMemberBean(member);
		
		fs.save(fBean);
		
//		session.setAttribute("favorite", fBean);
//		fb.setMrtBean(station);
		
		
		return "favoriteList";
	}
}
