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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.house._05_.model.FavoriteBean;
import tw.house._05_.service.FavoriteListService;
import tw.house._05_.service.IFavoriteList;
import tw.house._07_.model.HouseBean;
import tw.house._07_.model.HouseService;
import tw.house._07_.model.MrtService;
import tw.house._08_.register.model.MemberBean;
import tw.house._08_.register.model.MemberService;

@Controller
public class FavoriteController {
	@Autowired
	SessionFactory session;
	@Autowired
	private IFavoriteList fs;
	@Autowired
	private HouseService hs;
	@Autowired
	private MrtService mrts;
	@Autowired
	private MemberService mbs;

//	@GetMapping(value = "/navibar")
//	public String insertFavorite(Model m, HttpServletRequest res, @RequestParam("houseId") Integer houseId) {
//		HttpSession session = res.getSession();
//		FavoriteBean fb = new FavoriteBean();
//		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
//		List<HouseBean> hb = hs.selectedHouse(houseId);
//
//		fb.sethBean(hb);
//		fb.setMemberBean(mb);
//
////		fs.save(fb);
//		return null;
//	}
//	
//	@PostMapping(value = "/favorite")
//	public String showfavorite(Model m) {
//		
//		return null;
//	}
	@RequestMapping(path = "/favorite", method = RequestMethod.GET)
	public String selectFavorite() {
		System.out.println("controller select Favorite");
		return "favorite";
	}
	@PostMapping("/favorite")
	public String showFavorite(Model m,HttpServletRequest res, @RequestParam("favorite") String district) {
		System.out.println("show favorite list");
		HttpSession session2 = res.getSession();
		MemberBean mem=  (MemberBean) session2.getAttribute("LoginOk");	
		List<FavoriteBean> list = fs.getMemberid(mem.getPk());
		//以下測試
		List<FavoriteBean> list2 = fs.getMemberid(6);
		m.addAttribute("favorite2",list2);
		m.addAttribute("favorite",list);
		
		System.out.println("get favoritelist"+list.size());
		return "favorite";
	}
}
