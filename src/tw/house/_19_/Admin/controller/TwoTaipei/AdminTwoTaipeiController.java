package tw.house._19_.Admin.controller.TwoTaipei;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import tw.house._13_.model.bean.TwoTaipei;
import tw.house._19_.Admin.model.TwoTaipei.AdminTwoTaipeiService;

@Controller
public class AdminTwoTaipeiController {

	@Autowired
	private AdminTwoTaipeiService service;
	
	@RequestMapping(path = "/getTTlist", method = RequestMethod.GET)
	public String TTList(Model model) {
		List<TwoTaipei> list = service.getTwoTaipeis();
		model.addAttribute("TTList", list);
		return "admin_twoTaipeiList";
	}
	@GetMapping("/showTT")
	public String getTT(Model model,@RequestParam("id") Integer id) {
		TwoTaipei bean = service.getById(id);
		model.addAttribute("TTbean", bean);
		return "admin_twoTaipeiDelete";
	}
	@PostMapping("/updateTT")
	public String updateTT(@RequestParam("id")Integer id,
			@RequestParam("district")String district,
			@RequestParam("location")String location,
			@RequestParam("landa_m")Float landa_m,
			@RequestParam("landa_p")Float landa_p,
			@RequestParam("sdate")String sdate,
			@RequestParam("sbuild")String sbuild,
			@RequestParam("tbuild")String tbuild,
			@RequestParam("buildtype")String buildtype,
			@RequestParam("fdate")String fdate,
			@RequestParam("farea_m")String farea_m,
			@RequestParam("farea_p")Float farea_p,
			@RequestParam("tprice")Float tprice,
			@RequestParam("tprice_s")Float tprice_s,
			@RequestParam("uprice_m")String uprice_m,
			@RequestParam("uprice_p")Float uprice_p,
			@RequestParam("rmnote")String rmnote,
			Model model) {	
		
		TwoTaipei bean = service.getById(id);
			
		boolean update = service.update(bean);
		System.out.println(update);
		if(update) {
			bean.setDistrict(district);
			bean.setLocation(location);
			bean.setLanda_m(landa_m);
			bean.setLanda_p(landa_p);
			bean.setSdate(sdate);
			bean.setSbuild(sbuild);
			bean.setTbuild(tbuild);
			bean.setBuildtype(buildtype);
			bean.setFdate(fdate);
			bean.setFarea_m(farea_m);
			bean.setFarea_p(farea_p);
			bean.setTprice(tprice);
			bean.setTprice_s(tprice_s);
			bean.setUprice_m(uprice_m);
			bean.setUprice_p(uprice_p);
			bean.setRmnote(rmnote);
			return "redirect:/getTTlist";
		}else {
			return "redirect:/showTT";
		}
	}
	@GetMapping("/createTT")
	public String showInsertForm(Model model) {
		TwoTaipei bean = new TwoTaipei();
		model.addAttribute("TTInsert", bean);
		return "admin_twoTaipeicreate";
	}
	@PostMapping("/insertTT")
	public String insertTT(TwoTaipei bean,
			@RequestParam("district")String district,
			@RequestParam("location")String location,
			@RequestParam("landa_m")Float landa_m,
			@RequestParam("landa_p")Float landa_p,
			@RequestParam("sdate")String sdate,
			@RequestParam("sbuild")String sbuild,
			@RequestParam("tbuild")String tbuild,
			@RequestParam("buildtype")String buildtype,
			@RequestParam("fdate")String fdate,
			@RequestParam("farea_m")String farea_m,
			@RequestParam("farea_p")Float farea_p,
			@RequestParam("tprice")Float tprice,
			@RequestParam("tprice_s")Float tprice_s,
			@RequestParam("uprice_m")String uprice_m,
			@RequestParam("uprice_p")Float uprice_p,
			@RequestParam("rmnote")String rmnote,
			Model model
			) {
		
		boolean save=service.save(bean);
		if(save) {
			bean.setDistrict(district);
			bean.setLocation(location);
			bean.setLanda_m(landa_m);
			bean.setLanda_p(landa_p);
			bean.setSdate(sdate);
			bean.setSbuild(sbuild);
			bean.setTbuild(tbuild);
			bean.setBuildtype(buildtype);
			bean.setFdate(fdate);
			bean.setFarea_m(farea_m);
			bean.setFarea_p(farea_p);
			bean.setTprice(tprice);
			bean.setTprice_s(tprice_s);
			bean.setUprice_m(uprice_m);
			bean.setUprice_p(uprice_p);
			bean.setRmnote(rmnote);	
			return "redirect:createTT";
		}else {
			return "redirect:createTT";
		}	
}
	@DeleteMapping("/deleteTT")
	public String delete(@RequestParam("tid") Integer id) {
		TwoTaipei bean = service.getById(id);
		boolean delete = service.delete(bean);
		if(delete==true) {
			System.out.println("delete Success");
			return "redirect:/getTTlist";
		}else {
			System.out.println("delete failed");
			return "redirect:/getTTlist";
		}
	}
}
