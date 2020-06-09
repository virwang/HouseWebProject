package tw.house._05_.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import tw.house._05_.model.CompareBean;
import tw.house._05_.service.ISCompare;
import tw.house._05_.service.SCompare;
import tw.house._07_.model.HouseBean;
import tw.house._07_.model.HouseService;
import tw.house._08_.register.model.MemberBean;

@Controller
public class Comparecontroller {
	@Autowired
	SessionFactory session;
	@Autowired
	SCompare scompare;
	@Autowired
	HouseService houseService;

	@GetMapping(path = "/relate")
	public String compareHouse(@SessionAttribute("houseBean") HouseBean houseBean, Model model) {
		System.out.println("controller select Favorite by member id =" + houseBean.getDist());
		Integer id = houseBean.getId();
		List<HouseBean> hBeanList = houseService.houseList();
		model.addAttribute("com", hBeanList);
		System.out.println("housecompare" + hBeanList);
		return "compare";

	}
	
	@GetMapping(value = "/houselist.do" ,produces = "application/json")
	public ResponseEntity<Map<String, String>> save(@RequestParam("houseId") Integer houseId) {
		System.out.println("進入con");
		System.out.println("houseId="+houseId);
		Map<String, String> map = new HashMap<>();
		ResponseEntity<Map<String, String>> re = null;
		int n = 0;
		HouseBean houseBean = houseService.selectedHouse(houseId);
		System.out.println("houseBean 抓取成功"+houseBean.getId());
	
			n = houseService.saveCompare(CompareBean);
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
	@ResponseBody
	@PostMapping(path = "/deletefavorite",produces = "application/json")
	public String deleteFavorite(@RequestParam("deletefid") Integer id) {
		boolean delete = ifs.deleteFavorite(id);
		System.out.println(delete+"dao before delete fid = "+id);	
		if (delete) {
			System.out.println("delete success fid ="+id);
			return "deOK";
		}else{
			System.out.println("delete error fid ="+id);
			return "deNO";
		}
	}
}
