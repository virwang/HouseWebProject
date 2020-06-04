package tw.house._05_.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import tw.house._05_.model.FavoriteBean;
import tw.house._05_.service.IFavorite;
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
	private IFavorite ifs;
	@Autowired
	private HouseService houseSerice;
	@Autowired
	private MemberService memberService;

	@GetMapping(path = "/favorite")
	public String selectFavorite(@SessionAttribute("memberBean") MemberBean memberBean, Model model) {
		System.out.println("controller select Favorite by member id =" + memberBean.getName());
		Integer memberfavorite = memberBean.getPk();
		List<FavoriteBean> fBeans = ifs.mfhosue(memberfavorite);
		model.addAttribute("fh", fBeans);
		System.out.println("controller memberfavorite =" + memberfavorite + "fBeans toString = " + fBeans.toString());
		if (fBeans.size() == 0) {
			return "addFavorite";
		} else {
			return "favorite";
		}
	}

	// 新增房屋至我的最愛
	@GetMapping(value = "/houselist.do" ,produces = "application/json")
	public ResponseEntity<Map<String, String>> save(@RequestParam("houseId") Integer houseId,
			@SessionAttribute("memberBean") MemberBean memberBean) {
		System.out.println("進入con");
		System.out.println("houseId="+houseId);
		Map<String, String> map = new HashMap<>();
		ResponseEntity<Map<String, String>> re = null;
		int n = 0;
		HouseBean houseBean = houseSerice.selectedHouse(houseId);
		System.out.println("houseBean 抓取成功"+houseBean.getId());
		System.out.println("memberBean "+memberBean.getAccount());		
//			System.out.println("before="+n);
			n = ifs.saveFavorite(houseBean, memberBean);
			System.out.println("after="+n);
			if (n == 1) {
				map.put("success", "成功");
				re = new ResponseEntity<>(map, HttpStatus.OK);
			} else if (n == -1) {
				map.put("error", "已收藏");
				re = new ResponseEntity<>(map, HttpStatus.OK);
			}		
		return re;
	}

	// 刪除單筆我的最愛資料
	@DeleteMapping(path = "/deletefavorite")
	public String deleteFavorite(@RequestParam("deletefid") Integer fid) {
		boolean delete = ifs.deleteFavorite(fid);
		if (delete == true) {
			System.out.println("delete success fid ="+fid);
			return "redirect:/favorite";
		}else{
			System.out.println("delete error fid ="+fid);
		}
		System.out.println("delete favorite");
		return "redirect:/favorite";
	}

//	@PostMapping("/favorite")
//	public String showFavorite(Model model,HttpServletRequest res, @RequestParam("favorite")Integer mid,String title) {
//		System.out.println("show favorite list");
//		HttpSession session2 = res.getSession();
//		MemberBean mBean=  (MemberBean) session2.getAttribute("memberBean");	
////		List<FavoriteBean> list = fs.getfHouseByMemberid(mem.getPk());
//		List<FavoriteBean> fblist = fs.fHouseByMemberid(mid, title);
//		//以下測試
////		List<FavoriteBean> list2 = fs.fHouseByMemberid(mid, title);
////		m.addAttribute("favorite2",list2);
//		model.addAttribute("favoraite",fblist);
//		
//		System.out.println("get favoritelist"+fblist.size());
//		return "favorite";
//	}	

}
