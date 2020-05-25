package tw.house._13_.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.house._13_.model.SearchTwoTaipeiService;
import tw.house._13_.model.Taipei;

@Controller
public class SearchTwoTaipeiController {

	SearchTwoTaipeiService sttservice;

	@Autowired
	public void setSttservice(SearchTwoTaipeiService sttservice) {
		this.sttservice = sttservice;
	}

	@RequestMapping(path = "/SearchTaipeiAction.do", method = RequestMethod.GET)
	public String showSearchPage() {
		return "view-list-searchTaipei";
	}

	@RequestMapping(path = "/ShowSearchTaipeiPage.do", method = RequestMethod.POST)
	public String ShowSearchTwoTaipeiPage(Model m, @RequestParam("selectcity") String district) {
		System.out.println(district);
		List<Taipei> tlist = sttservice.selectTaipeiDistrict(district);
		m.addAttribute("TwoTaipeiList", tlist);
		return "view-list-searchTaipei";
	}
//	@RequestMapping(path = "/ShowSearchTwoTaipeiPage.do", method = RequestMethod.POST)
//	public String ShowSearchTwoTaipeiPage(Model m ,@RequestParam("select_city") String area,
//			@RequestParam("selectcity") String district) {
//		
//		if ("Taipei".equals(area)) {
//			List<Taipei> tlist = sttservice.selectTaipeiDistrict(district);
//			m.addAttribute("TwoTaipeiList", tlist);
//		} else {
//			List<NewTaipei> ntlist = sttservice.selectNewTaipeiDistrict(district);
//			m.addAttribute("TwoTaipeiList", ntlist);
//		}
//		return"view-list-searchTwoTaipei";
//	}

}
