package tw.house._13_.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.house._13_.model.bean.TwoTaipei;
import tw.house._13_.model.service.SearchTwoTaipeiService;

@Controller
public class SearchTwoTaipeiController {

	SearchTwoTaipeiService sttservice;

	@Autowired
	public void setSttservice(SearchTwoTaipeiService sttservice) {
		this.sttservice = sttservice;
	}

	@RequestMapping(path = "/SearchTaipeiAction.do", method = RequestMethod.GET)
	public String showSearchPage() {
		return "view-list-searchTwoTaipei";
	}
	
	@RequestMapping(path = "/ShowSearchTwoTaipeiPage.do", method = RequestMethod.POST)
	public String ShowSearchTwoTaipeiPage(Model m ,@RequestParam("select_city") String area,
			@RequestParam("selectcity") String district) {
		
			List<TwoTaipei> tlist = sttservice.selectTaipeiDistrict(district);
			m.addAttribute("TwoTaipeiList", tlist);
			
		return"view-list-searchTwoTaipeiTest";
	}
	
}
