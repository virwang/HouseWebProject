package tw.house._13_.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.house._13_.model.bean.TwoTaipei;
import tw.house._13_.model.service.AjaxISearchTwoTaipeiService;

@Controller
public class AjaxController {
	
	@Autowired
	AjaxISearchTwoTaipeiService asttservice;

	//送出長度跟平均價格
	@RequestMapping(path = "/TotalBought.do", method = RequestMethod.POST )
	public @ResponseBody long TotalBought(Model m ,
			@RequestParam("districtavg") String district,
			@RequestParam(value="select_year", defaultValue = "0") Integer year,
			@RequestParam(value="searchword", defaultValue = "0") String searchword) {
		
		System.out.println(district);
		System.out.println(year);
		System.out.println(searchword);
		
		List<TwoTaipei> tlist = asttservice.selectTaipeiDistrict(district);
		m.addAttribute("TwoTaipeiList", tlist);
		
		
		return ;
	}

}
