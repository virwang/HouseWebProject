package tw.house._19_.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.house._08_.register.model.MemberBean;
import tw.house._19_.model.MemberDataService;

@Controller

public class MemberDataController {

	@Autowired
	private MemberDataService memberDataService;

//	@RequestMapping(path = "/memberData",method = RequestMethod.GET)
//	public String showMemberData(Model model) {
//		
//		List<MemberBean> mdata = memberDataService.memberList();
//		model.addAttribute("memberData", mdata);
//		
//		return "_19_memberData";
//	}

	@RequestMapping(path = "/showMemberData", method = RequestMethod.GET)
	public String memberData(@RequestParam("ACCT") String account, Model model) {
		List<MemberBean> mdata = memberDataService.memberList(account);
		System.out.println(mdata);
		model.addAttribute("memberData", mdata);
		return "_19_memberData";
	}

}
