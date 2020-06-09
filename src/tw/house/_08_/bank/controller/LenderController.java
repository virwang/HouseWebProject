package tw.house._08_.bank.controller;


import java.sql.Timestamp;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import tw.house._07_.model.HouseBean;
import tw.house._08_.bank.model.BankService;
import tw.house._08_.bank.model.BankBean;
import tw.house._08_.bank.model.Lender;
import tw.house._08_.bank.model.LenderService;
import tw.house._08_.register.model.MemberBean;

@Controller
public class LenderController {
	@Autowired
	LenderService lenderService;
	@Autowired
	BankService bankService;	
	@GetMapping(path = "/lend")
	public String turntolend() {
		return "lender";
	}	
	@RequestMapping(path = "/allLender",method = RequestMethod.GET)
	public String showAllLender(Model m) {
		List<Lender> list = lenderService.lenderList();
		m.addAttribute("lenderlist",list);
		return "showLender";
	}	
	@RequestMapping(path = "/allAjaxLender",method = RequestMethod.GET,produces ={"application/json"} )
	public ResponseEntity<Map<String, Object>> showAllAjaxLender() {
		List<Lender> list = lenderService.lenderList();
		Map<String,Object> map=new LinkedHashMap<String, Object>();
		map.put("data", list);
		ResponseEntity<Map<String, Object>> re =new ResponseEntity<>(map,HttpStatus.OK);
		System.out.println("re:"+re);
		return re;
	}	
	@RequestMapping(path = "/lendercity",method = RequestMethod.POST,produces = {"application/json"} )
	public ResponseEntity<List<Lender>> lenderCity(@RequestParam("city") String city,@RequestParam("starLevel")String starLevel){
		System.out.println("city:"+city);
		List<Lender> list = lenderService.lenderCity(city,starLevel);
		ResponseEntity<List<Lender>> re= new ResponseEntity<>(list,HttpStatus.OK);
		return re;
	}
	@RequestMapping(path = "/lendercitydist",method = RequestMethod.POST,produces = {"application/json"} )
	public ResponseEntity<List<Lender>> lenderCityDist(@RequestParam("city") String city,@RequestParam("dist") String dist,@RequestParam("starLevel")String starLevel){
		System.out.println("city:"+city+"dist:"+dist+"starLevel"+starLevel);
		List<Lender> list = lenderService.lenderCityDist(city,dist,starLevel);
		ResponseEntity<List<Lender>> re= new ResponseEntity<>(list,HttpStatus.OK);
		return re;
	}
	@RequestMapping(path = "/insertLenderList",method = RequestMethod.POST,produces =  {"application/json"} )
	public ResponseEntity<Map<String,Object>> insertLender(@SessionAttribute("memberBean")MemberBean mBean,@RequestParam("branchBank")String branchCode,Model m) {
		ResponseEntity<Map<String,Object>> re = null;
		Map<String, Object> map=new LinkedHashMap<>();
		boolean lender1=lenderService.checkLender(mBean.getPk());
		if(lender1) {
			BankBean bBean=bankService.searchBank(branchCode);
			Lender lBean = new Lender();
			lBean.setMemberBean(mBean);
			lBean.setBankTest(bBean);
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			System.out.println(ts);
			boolean insert = lenderService.insertLender(lBean);

			if (insert==true) {			
				Lender lender=lenderService.selectLender(mBean.getPk());
				map.put("status", "新增成功");
				map.put("lender", lender);
				re=new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);		
				return re;	
			}
			
		}
		Lender lender=lenderService.selectLender(mBean.getPk());
		map.put("status", "您已經是房貸專員無法新增");
		map.put("lender", lender);
		re=new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		return re;
	}
	@RequestMapping(path = "showOneLender",method = RequestMethod.GET)
	public String showOneLender(@SessionAttribute("memberBean")MemberBean mBean,Model m) {
		Lender lender=lenderService.selectLender(mBean.getPk());
		m.addAttribute("onelender",lender);
		return "showLender";
	}
}
	

