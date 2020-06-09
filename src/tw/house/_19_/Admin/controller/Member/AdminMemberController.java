package tw.house._19_.Admin.controller.Member;

import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.house._08_.bank.model.Lender;
import tw.house._08_.bank.model.LenderDAO;
import tw.house._08_.register.model.MemberBean;
import tw.house._19_.Admin.model.Member.AdminMemberService;


@Controller
public class AdminMemberController {
	@Autowired
	private LenderDAO lenderDao;
	
	@Autowired
	private AdminMemberService service;

//	@RequestMapping(path = "/getmemberlist", method = RequestMethod.GET)
//	public String memberList(Model model) {
//		List<MemberBean> list = service.getMembers();
//		model.addAttribute("memberList", list);
//		return "admin_memberList";
//	}
	@RequestMapping(path = "/ajaxgetmemberlist", method = RequestMethod.GET,produces = {"application/json"} )
	public ResponseEntity<List<MemberBean>> ajaxMemberList(){
		List<MemberBean> list = service.getMembers();
		ResponseEntity<List<MemberBean>> re= new ResponseEntity<>(list,HttpStatus.OK);
		return re;
		}
			
	@GetMapping("/showmember")
	public String getMember(Model model,@RequestParam("id") Integer id) {
		MemberBean bean = service.getById(id);
		model.addAttribute("member", bean);
		System.out.println("show");
		return "admin_memberU_D";
	}
	
	@PostMapping("/updateMember")
	public String updateMember(@RequestParam("id")Integer id,
			@RequestParam("name")String name,
			@RequestParam("tel")String tel,
			@RequestParam("usertype")String usertype,
			@RequestParam("email")String email,
			Model model) {	
			System.out.println(id);
			MemberBean bean = service.getById(id);
			
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
				return "redirect:/showmember";
				
			}
		boolean update = service.update(bean);
		System.out.println(update);
		if(update) {
			bean.setName(name);
			bean.setTel(tel);
			bean.setEmail(email);
			bean.setUsertype(usertype);
			return "redirect:/admin_index";
		}else {
			return "redirect:/showmember";
		}
	}
		@DeleteMapping("/deleteMember")
		public String delete(@RequestParam("mid") Integer id) {
			System.out.println("mid="+id);
			MemberBean bean = service.getById(id);
			Lender lender=lenderDao.selectLender(id);
			boolean delete = service.delete(bean);
			if(delete==true) {
				lenderDao.delete(lender);
				System.out.println("delete Success");
				return "redirect:/admin_index";
			}else {
				System.out.println("delete failed");
				return "redirect:/showmember";
			}
		}
}

