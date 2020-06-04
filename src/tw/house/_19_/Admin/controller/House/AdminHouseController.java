package tw.house._19_.Admin.controller.House;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import tw.house._07_.model.HouseBean;
import tw.house._19_.Admin.model.House.AdminHouseService;

//@Controller
public class AdminHouseController {
	@Autowired
	private AdminHouseService service;
	
//	@RequestMapping(path = "/#", method = RequestMethod.GET)
	public String HouseList(Model model) {
		List<HouseBean> list = service.getHouses();
		model.addAttribute("houseList", list);
		return "#";
	}
			
//	@GetMapping("#")
	public String getHouse(Model model,@RequestParam("HOUSEID") Integer id) {
		HouseBean bean = service.getById(id);
		model.addAttribute("houses", bean);
		return "#";
	}
	
//	@PostMapping("/#")
	public String updateHouse(@RequestParam("id")Integer id,
			@RequestParam("title")String title,
			@RequestParam("totalprice")String totalprice,
			@RequestParam("unitprice")String unitprice,
			@RequestParam("ping")String ping,
			@RequestParam("address")String address,
			@RequestParam("phone")String phone,
			@RequestParam("apartment")String apartment,
			Model model) {	
			
			HouseBean bean = service.getById(id);
					
		boolean update = service.update(bean);
		if(update) {
			bean.setTitle(title);
			bean.setTotalprice(totalprice);
			bean.setUnitprice(unitprice);
			bean.setPing(ping);
			bean.setAddress(address);
			bean.setPhone(phone);
			bean.setApartment(apartment);
			return "#";
		}else {
			return "#";
		}					
	}


}
