package tw.house._07_.controller;

import java.math.RoundingMode;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import tw.house._07_.model.HouseBean;
import tw.house._07_.model.HouseService;
import tw.house._07_.model.MrtBean;
import tw.house._07_.model.MrtService;
import tw.house._08_.register.model.MemberBean;

@Controller
public class HouseController {
	
	@Autowired
	private HouseService hService;
	
	@Autowired
	private MrtService mService;
	
	@RequestMapping(path = "/houselist",method = RequestMethod.GET)
	public String showHouseListTurn(Model m) {
		
		List<HouseBean> list = hService.houseList();
		m.addAttribute("houselist", list);
		
		return "buy";
	}
	
	@RequestMapping(path = "/housedetail",method = RequestMethod.GET)
	public String showHouseDetail(@RequestParam("HOUSEID") Integer hid, Model m) {
		
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
	public String pageToInsertHouse(Model m) {
		List<MrtBean> list = mService.mrtlist();
		
		m.addAttribute("mrtlist", list);
		return "newHouse";
	}
	
	@RequestMapping(path = "/inserthouse", method = RequestMethod.POST)
	public String insertHouse(@RequestParam("title") String title,@RequestParam("tprice") String tprice,@RequestParam("ping") String ping,
							  @RequestParam("city") String city,@RequestParam("dist") String dist,@RequestParam("addr") String addr,
							  @RequestParam("apart") String apart,@RequestParam("room") String room,@RequestParam("hall") String hall,
							  @RequestParam("bath") String bath,@RequestParam("mrt") String mrt,@RequestParam("picture1") MultipartFile picture1,
							  @SessionAttribute("memberBean")MemberBean mBean, Model m, HttpServletRequest request) {
		
//		System.out.println(mBean.getAccount()+"!!!");
//		System.out.println("memberpk: "+mBean.getPk());
		//取小數以下兩位
		NumberFormat numberFormat = new DecimalFormat("#.00");
		numberFormat.setRoundingMode(RoundingMode.HALF_UP);
		
		
		HouseBean hBean = new HouseBean();
		hBean.setTitle(title);
		hBean.setTotalprice(tprice);
		hBean.setPing(ping);
		Double unitprice = Double.valueOf(tprice)/Double.valueOf(ping);
		String uprice = numberFormat.format(unitprice);
		System.out.println(uprice);
		hBean.setUnitprice(uprice);
		hBean.setCity(city);
		hBean.setDist(dist);
		hBean.setAddress(addr);
		hBean.setPhone(mBean.getTel());
		hBean.setApartment(apart);
		hBean.setRoom(Integer.valueOf(room));
		hBean.setHall(Integer.valueOf(hall));
		hBean.setBath(Integer.valueOf(bath));
		hBean.setAccountid(mBean.getPk());
		hBean.setMrtpk(Integer.valueOf(mrt));
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		hBean.setAddDate(ts);
//		hBean.setMemberBean(mBean);
		
		//圖片

		
		// 建立byte物件，交由 Hibernate 寫入資料庫
//		if (picture1 != null && !picture1.isEmpty()) {
//			try {
//				byte[] b = picture1.getBytes();
//				Blob blob = new SerialBlob(b);
//				hBean.setImage1(blob);
//			} catch (Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//			}
//		}

		
		
		
		boolean insert = hService.insertHouse(hBean);
		System.out.println(insert);
		if (insert==true) {
			List<HouseBean> list = hService.memberHouseList(mBean.getAccount());
			m.addAttribute("houselist", list);
			
			return "redirect:/memberhouse";
		}
		return "redirect:/memberhouse";
		
		
	}
	
	
	
	@DeleteMapping(path = "/deletehouse")
	public String deleteHouse(@RequestParam("deleteh") String houseid) {
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
