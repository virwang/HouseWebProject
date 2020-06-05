package tw.house._19_.Admin.controller.House;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import tw.house._07_.model.HouseBean;
import tw.house._19_.Admin.model.House.AdminHouseService;

@Controller
public class AdminHouseController {
	@Autowired
	private AdminHouseService service;
	
	@RequestMapping(path = "/gethouselist", method = RequestMethod.GET)
	public String HouseList(Model model) {
		List<HouseBean> list = service.getHouses();
		model.addAttribute("houseList", list);
		return "admin_houseList";
	}
	@RequestMapping(path = "/ajaxhouseList", method = RequestMethod.GET,produces = {"application/json"} )
	public ResponseEntity<List<HouseBean>> ajaxhouseList(){
		List<HouseBean> list = service.getHouses();
		ResponseEntity<List<HouseBean>> re= new ResponseEntity<>(list,HttpStatus.OK);
		return re;
		}
			
	@GetMapping("/showHouse")
	public String getHouse(Model model,@RequestParam("id") Integer id) {
		HouseBean bean = service.getById(id);
		model.addAttribute("house", bean);
		return "admin_houseDelete";
	}
	
	@DeleteMapping("/deleteHouse")
	public String delete(@RequestParam("hid") Integer id) {
		HouseBean bean = service.getById(id);
		boolean delete = service.deleteHouse(bean);
		if(delete==true) {
			System.out.println("delete Success");
			return "redirect:/admin_index";
		}else {
			System.out.println("delete failed");
			return "redirect:/admin_index";
		}
	}
}
