package tw.house._07_.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import tw.house._07_.model.HouseBean;
import tw.house._07_.model.HouseService;
import tw.house._08_.register.model.MemberBean;

@Controller
public class HouseController {
	
	@Autowired
	private HouseService hService;
	
	@RequestMapping(path = "/houselist",method = RequestMethod.GET)
	public String showHouseListTurn(Model m) {
		
		List<HouseBean> list = hService.houseList();
		m.addAttribute("houselist", list);
		
		return "buy";
	}
	
	@RequestMapping(path = "/housedetail",method = RequestMethod.GET)
	public String showHouseList(@RequestParam("HOUSEID") Integer hid, Model m) {
		
		HouseBean hBean = hService.selectedHouse(hid);
		m.addAttribute("housedt", hBean);
		
		return "property-details";
	}
	
	@RequestMapping(path = "/memberhouse",method = RequestMethod.GET)
	public String memberHouseList(@SessionAttribute("memberBean") MemberBean mBean, Model m) {
		String macct = mBean.getAccount();
		List<HouseBean> list = hService.memberHouseList(macct);
		m.addAttribute("houselist", list);
		
		return "memberhouselist";
	}
	
	@RequestMapping(path="/newhouse",method = RequestMethod.GET)
	public String pageToInsertHouse() {
		return "newHouse";
	}
	
	@RequestMapping(path = "/inserthouse", method = RequestMethod.POST)
	public String insertHouse(@RequestParam("title") String title,@RequestParam("tprice") String tprice,@RequestParam("ping") String ping,
							  @RequestParam("city") String city,@RequestParam("dist") String dist,@RequestParam("addr") String addr,
							  @RequestParam("apart") String apart, @SessionAttribute("memberBean")MemberBean mBean, Model m) {
		
		System.out.println(mBean.getAccount()+"!!!");
		System.out.println("memberpk: "+mBean.getPk());
		HouseBean hBean = new HouseBean();
		hBean.setTitle(title);
		hBean.setTotalprice(tprice);
		hBean.setPing(ping);
		Float unitprice = Float.valueOf(tprice)/Float.valueOf(ping);
		String uprice = String.valueOf(unitprice);
		System.out.println(uprice);
		hBean.setUnitprice(uprice);
		hBean.setAddress(city+dist+addr);
		hBean.setPhone(mBean.getTel());
		hBean.setApartment(apart);
		hBean.setAccountid(mBean.getPk());
		
		boolean insert = hService.insertHouse(hBean);
		System.out.println(insert);
		if (insert==true) {
			List<HouseBean> list = hService.memberHouseList(mBean.getAccount());
			m.addAttribute("houselist", list);
			
			return "redirect:/memberhouse";
		}
		return "redirect:/memberhouse";
		
		
	}
	
	@RequestMapping(path = "/deletehouse",method = RequestMethod.POST)
	public String deleteHouse(@RequestParam("") String houseid) {
		Integer hid = Integer.valueOf(houseid);
		boolean delete = hService.deleteHouse(hid);
		if (delete==true) {
			System.out.println("DELETE success");
			return "redirect:/memberhouse";
		} else {
			System.out.println("DELETE failed");
		}
		return "redirect:/memberhouse";
	}
}
