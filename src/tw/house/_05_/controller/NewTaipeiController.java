package tw.house._05_.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.house._05_.model.NewTaipeiBean;
import tw.house._05_.service.NewTaipeiServiceInter;

@Controller
public class NewTaipeiController {

	@Autowired
	NewTaipeiServiceInter NtpService;
	
	@RequestMapping(path = "/newtaipeipage.do", method = RequestMethod.GET)
	public String showSearchPage() {
		System.out.println("show Newtaipei Page controller");
		return "newtaipei";
	}

//	@RequestMapping(path = "/ntpSearch.do", method = RequestMethod.POST)
	@PostMapping(value = "/ntpSerach.do")
	public String showSelect(Model model, @RequestParam("selectcity") String district) {
//		System.out.println("district of new taipei");
		
		System.out.println("district:"+district);
		List<NewTaipeiBean> ntplist = NtpService.getDistrict(district);
		model.addAttribute("ntp", ntplist);
		
		System.out.println("return from controller of newtaipei table");
		return "newtaipei";
	}


}
