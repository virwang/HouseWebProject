package tw.house._08_.bank.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import tw.house._08_.bank.model.Lender;
import tw.house._08_.bank.model.LenderService;

@Controller
public class LenderController {
	@Autowired
	LenderService lenderService;
	
	@GetMapping(path = "/lend")
	public String turntolend() {
		return "lender";
	}
	
	@RequestMapping(path = "/Lender.do3",method = RequestMethod.POST)
	public String showLender(Model m) {
		System.out.println("123");
		List<Lender> list = lenderService.lenderList();
		m.addAttribute("lenderlist",list);
		return "lender";
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
}
	

