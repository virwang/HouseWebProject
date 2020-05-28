package tw.house._05_.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.house._05_.model.FavoriteBean;
import tw.house._05_.service.FavoriteListService;
import tw.house._05_.service.IFavoriteList;
import tw.house._07_.model.HouseBean;
import tw.house._07_.model.HouseService;
import tw.house._07_.model.MrtService;
import tw.house._08_.register.model.MemberBean;

@Controller
public class FavoriteController {
	@Autowired
	SessionFactory session;
	@Autowired
	private IFavoriteList fs;
	@Autowired
	private HouseService hs;
	@Autowired
	private MrtService ms;

	@GetMapping(value = "/navibar")
	public String insertFavorite(Model m, HttpServletRequest res, @RequestParam("houseId") Integer houseId) {
		HttpSession session = res.getSession();
		FavoriteBean fb = new FavoriteBean();
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		List<HouseBean> hb = hs.selectedHouse(houseId);

		fb.sethBean(hb);
//		fb.setMemberBean(mb);

		fs.save(fb);
		return null;
	}
	
	@PostMapping(value = "/favoriteList")
	public String showfavorite(Model m) {
		
		return null;
	}
}
