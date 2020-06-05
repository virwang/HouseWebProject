package tw.house._08_.bank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.house._08_.bank.model.BankCodeBean;
import tw.house._08_.bank.model.BankService;
import tw.house._08_.bank.model.BankBean;

@Controller
public class BankController {
	@Autowired
	BankService bankService;
	@GetMapping(path = "/showbank")
	public String turntolenderInsert() {
		return "lenderInsert";
	}
	@RequestMapping(path = "/allbank",method = RequestMethod.GET,produces ={"application/json"} )
	public ResponseEntity<List<BankCodeBean>>  allBank(){
		List<BankCodeBean> list =bankService.AllbankCode();
		ResponseEntity<List<BankCodeBean>> re=new ResponseEntity<List<BankCodeBean>>(list,HttpStatus.OK);
		 return re;
	}
	@RequestMapping(path = "/selectBranchBank",method = RequestMethod.GET,produces ={"application/json"} )
	public ResponseEntity<List<BankBean>>  selectBranchBank(@RequestParam("bankCode")String bankCode){
		List<BankBean> list =bankService.SelectBranch(bankCode);
		ResponseEntity<List<BankBean>> re=new ResponseEntity<>(list,HttpStatus.OK);
		 return re;
	}
}
