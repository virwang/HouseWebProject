package tw.house._19_.MemberData.controller;

import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.house._08_.register.model.MemberBean;
import tw.house._19_.MemberData.model.MemberDataService;

@Controller
@SessionAttributes({"memberBean"})
public class MemberDataController {

	@Autowired
	private MemberDataService memberDataService;

	@RequestMapping(path = "/showMemberData", method = RequestMethod.GET)
	public String memberData(@SessionAttribute("memberBean") MemberBean mb, Model model) {
		MemberBean mdata = memberDataService.memberBean(mb.getAccount());
		model.addAttribute("memberData", mdata);
		return "_19_memberData";
	}
		

	
	@GetMapping("/updateMemberData.do")
	public String editMemberForm(Model model,@SessionAttribute("memberBean") MemberBean mb) {
		MemberBean bean = memberDataService.getByPk(mb.getPk());
		model.addAttribute("memberUpdate", bean);
		return "_19_memberUpdate";
	}
	
	@PostMapping("/updateMember.do")
	public String updateData(@RequestParam("id")Integer id,
			@RequestParam("name")String name,
			@RequestParam("tel")String tel,
			@RequestParam("email")String email,
			@SessionAttribute("memberBean") MemberBean memberBean,Model model) {	
			
			MemberBean bean = memberDataService.getByPk(id);
			
			HashMap<String, String> errorMsg = new HashMap<>();
			model.addAttribute("errors", errorMsg);
			
			
			String regxn="^[\\u4E00-\\u9FA5]+$";
			Pattern pn= Pattern.compile(regxn);
			Matcher rn =pn.matcher(name);
			if(name==null||name.trim().length()==0) {
				errorMsg.put("name", "姓名必須輸入");
			}else if(name.length()<2) {
				errorMsg.put("name", "姓名至少兩個字");
			}else if(rn.find()) {
				System.out.println("姓名正確");
			}else{
				errorMsg.put("name", "必須是中文");
			}
						
			String regxph ="^[09]{2}[0-9]{8}$";
			Pattern pph =Pattern.compile(regxph);
			Matcher rph = pph.matcher(tel);
			if(tel==null||tel.trim().length()==0) {
				errorMsg.put("tel", "手機號碼必須輸入");
			}else if(rph.find()) {
				System.out.println("手機號碼正確");
			}else {
				System.out.println(rph);
				errorMsg.put("tel", "手機號碼格式錯誤");
			}
			
			String regxem = "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z]+$";
			Pattern pem = Pattern.compile(regxem);
			Matcher rem = pem.matcher(email);
			if(email==null||email.trim().length()==0) {
				errorMsg.put("email", "信箱必須輸入");
			}else if(rem.find()) {
				System.out.println("信箱正確");
			}else {
				errorMsg.put("email", "信箱格式錯誤");
			}
			
			if(!errorMsg.isEmpty()) {
				return "redirect:/updateMemberData.do";
				
			}
		boolean update = memberDataService.update(bean);
		if(update) {
			bean.setName(name);
			bean.setTel(tel);
			bean.setEmail(email);
			model.addAttribute("memberBean", memberDataService.getByPk(id));
			return "redirect:/showMemberData";
		}else {
			return "redirect:/updateMemberData.do";
		}
		

	}
//	@ModelAttribute
//	public MemberBean editMemberBean (@RequestParam(value="ACCT", required = false)String account) {
//		MemberBean pkBean = new MemberBean();
//		if (account != null) {
//			pkBean = memberDataService.memberBean(account);
//			System.out.println("在@ModelAttribute修飾的方法 getMemberBean()中，讀到物件:" + pkBean);
//		} else {
//			System.out.println("在@ModelAttribute修飾的方法 getMemberBean()中，無法讀取物件:" + pkBean);
//		}
//		
//		return pkBean;
//	}
}

