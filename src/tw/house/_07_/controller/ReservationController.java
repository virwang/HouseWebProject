package tw.house._07_.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import tw.house._07_.model.HouseBean;
import tw.house._07_.model.HouseService;
import tw.house._07_.model.ReservationBean;
import tw.house._07_.model.ReservationService;
import tw.house._08_.register.model.MemberBean;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService rService;
	
	@Autowired
	private HouseService hService;
	
	@PostMapping(path = "/newapplication")
	public String insertApplication(@RequestParam("hid") Integer hid,@RequestParam("date") String date,
			@RequestParam("time") String reservtime,@SessionAttribute("memberBean") MemberBean mb,
			Model m) throws Exception{
		System.out.println(hid);
		System.out.println(date);
		
		LocalDate localDate = LocalDate.parse(date);
		
		ReservationBean rBean = new ReservationBean();
		rBean.setHouseid(hid);
		rBean.setApplicant(mb.getPk());
		Integer recid = hService.selectedHouse(hid).getMemberBean().getPk();
		rBean.setRecipient(recid);
		rBean.setStatus("申請中");
		rBean.setReservatedate(localDate);
		rBean.setReservatetime(reservtime);
		rService.insertapplication(rBean);
		
		
		m.addAttribute("HOUSEID", hid);
		return "redirect:/housedetail";
		
	}
	
	@GetMapping(path = "/reservation")
	public String turnToResPage(@SessionAttribute("memberBean") MemberBean mb,Model m) {
		m.addAttribute("mb", mb);
		return "reservationpage";
	}
	
	@GetMapping(path = "/applicanttable", produces = "application/json")
	public ResponseEntity <List<ReservationBean>> showapplicant(@SessionAttribute("memberBean") MemberBean mb){
		
		List<ReservationBean> list = rService.applicantlist(mb.getPk());
		
		ResponseEntity<List<ReservationBean>> re = new ResponseEntity<>(list,HttpStatus.OK);
		return re;
		
	}
	
	@GetMapping(path = "/recipienttable", produces = "application/json")
	public ResponseEntity <List<ReservationBean>> showrecipient(@SessionAttribute("memberBean") MemberBean mb){
		
		List<ReservationBean> list = rService.recipientlist(mb.getPk());
		
		ResponseEntity<List<ReservationBean>> re = new ResponseEntity<>(list,HttpStatus.OK);
		return re;
		
	}
}
