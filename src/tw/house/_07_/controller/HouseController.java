package tw.house._07_.controller;

import java.math.RoundingMode;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.model.GeocodingResult;

import tw.house._05_.model.FavoriteBean;
import tw.house._05_.service.IFavorite;
import tw.house._05_.service.PathService;
import tw.house._07_.model.HouseBean;
import tw.house._07_.model.HouseHitBean;
import tw.house._07_.model.HouseHitService;
import tw.house._07_.model.HouseService;
import tw.house._07_.model.MrtBean;
import tw.house._07_.model.MrtService;
import tw.house._07_.model.ReservationService;
import tw.house._08_.register.model.MemberBean;

@Controller
public class HouseController {
	
	@Autowired
	private HouseService hService;
	
	@Autowired
	private MrtService mService;
	
	@Autowired
	private ReservationService rService;
	
	@Autowired
	private HouseHitService hitService;
	
	@Autowired
	private IFavorite ifs;
	
	@Autowired
	private PathService ps;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(path = "/houselist",method = RequestMethod.GET)
	public String showHouseListTurn(Model m,@SessionAttribute(value = "memberBean",required = false)MemberBean mBean) {
		
		List<HouseBean> list = hService.houseList();
		if(mBean!=null) {
			Integer pk = mBean.getPk();
			List<FavoriteBean> list2 = ifs.mfhosue(pk);
			List<Object> obj= ps.top3FaHouse();
//			for (Object object : obj) {
//				System.out.println("123");
//			}
			m.addAttribute("fh", list2);
			m.addAttribute("path", obj);
		}
		m.addAttribute("houselist", list);
		return "buy";
	}
	
	@RequestMapping(path = "/housedetail",method = RequestMethod.GET)
	public String showHouseDetail(@RequestParam("HOUSEID") Integer hid, Model m) {
		Integer hcount = 0;
		HouseBean hBean = hService.selectedHouse(hid);
		List<Object> obj= ps.top3FaHouse();
		m.addAttribute("housedt", hBean);
		HouseHitBean hhBean = hitService.getHtBean(hid);
		if(hhBean!=null) {
			hcount = hhBean.getHit();
		}
		
		m.addAttribute("hcount", hcount);
		m.addAttribute("path", obj);
		return "property-details";
	}
	
	@RequestMapping(path = "/memberhouse",method = RequestMethod.GET)
	public String memberHouseList(@SessionAttribute("memberBean") MemberBean mBean, Model m) {
		Integer macct = mBean.getPk();
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
	@RequestMapping(path="/modhouse",method = RequestMethod.POST)
	public String pageToUpdateHouse(@RequestParam("updateh") Integer hid,Model m) {
		
		HouseBean hBean = hService.selectedHouse(hid);
		List<MrtBean> list = mService.mrtlist();
		m.addAttribute("hBean", hBean);
		m.addAttribute("mrtlist", list);
		return "updateHouse";
	}
	
	@GetMapping(path = "/searchhouseajax")
	public ResponseEntity <List<HouseBean>> searchHouseBar(@RequestParam("city") String city,@RequestParam("dist") String dist,@RequestParam(value = "addr",required = false) String daddr){
		
		List<HouseBean> list = new ArrayList<>();
		list = hService.searchHouse(city, dist, daddr);
		
		ResponseEntity<List<HouseBean>> re = new ResponseEntity<>(list,HttpStatus.OK);
		return re;
		
	}
	@PostMapping(path = "/searchhouse")
	public String searchHouseBar(@RequestParam("city") String city,@RequestParam("dist") String dist,@RequestParam(value = "addr",required = false) String daddr,Model m){
		System.out.println("controlleraddr="+daddr);
		List<HouseBean> list = new ArrayList<>();
		list = hService.searchHouse(city, dist, daddr);
		
		m.addAttribute("houselist", list);
		
		return "buy";
		
	} 
	
	@RequestMapping(path = "/inserthouse", method = RequestMethod.POST)
	public String insertHouse(@RequestParam("title") String title,@RequestParam("tprice") String tprice,@RequestParam("ping") String ping,
							  @RequestParam("city") String city,@RequestParam("dist") String dist,@RequestParam("addr") String addr,
							  @RequestParam("apart") String apart,@RequestParam("room") Integer room,@RequestParam("hall") Integer hall,
							  @RequestParam("bath") Integer bath,@RequestParam("mrt") Integer mrt,
							  @RequestParam(value = "picture1", required = false) MultipartFile picture1,
							  @RequestParam(value = "picture2", required = false) MultipartFile picture2,
							  @RequestParam(value = "picture3", required = false) MultipartFile picture3,
							  @SessionAttribute("memberBean")MemberBean mBean, Model m) throws Exception{
		
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
		
		//經緯度
		String fullAddress = city+dist+addr;
		Map<String, String> gResult = getGeocode(fullAddress);
		hBean.setLat(gResult.get("lat"));
		hBean.setLon(gResult.get("lon"));
		
		
		
		//圖片

		
		// 建立byte物件，交由 Hibernate 寫入資料庫
		if (picture1 != null && !picture1.isEmpty()) {
			try {
				byte[] b1 = picture1.getBytes();
				byte[] encodeBase641 = Base64.getEncoder().encode(b1);
				hBean.setImage1(b1);
				String base64Encoded1 = new String(encodeBase641,"UTF-8");
				hBean.setBase64image1(base64Encoded1);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		if (picture2 != null && !picture2.isEmpty()) {
			try {
				byte[] b2 = picture2.getBytes();
				byte[] encodeBase642 = Base64.getEncoder().encode(b2);
				hBean.setImage2(b2);
				String base64Encoded2 = new String(encodeBase642,"UTF-8");
				hBean.setBase64image2(base64Encoded2);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		if (picture3 != null && !picture3.isEmpty()) {
			try {
				byte[] b3 = picture3.getBytes();
				byte[] encodeBase643 = Base64.getEncoder().encode(b3);
				hBean.setImage3(b3);
				String base64Encoded3 = new String(encodeBase643,"UTF-8");
				hBean.setBase64image3(base64Encoded3);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		
		
		
		boolean insert = hService.insertHouse(hBean);
		System.out.println(insert);
		if (insert==true) {
			List<HouseBean> list = hService.memberHouseList(mBean.getPk());
			m.addAttribute("houselist", list);
			
			return "redirect:/memberhouse";
		}
		return "redirect:/memberhouse";
		
		
	}
	
	
	
	@RequestMapping(path = "/updatehouse", method = RequestMethod.POST)
	public String updateHouse(@RequestParam("hid") Integer hid,@RequestParam("title") String title,@RequestParam("tprice") String tprice,@RequestParam("ping") String ping,
							  @RequestParam("city") String city,@RequestParam("dist") String dist,@RequestParam("addr") String addr,
							  @RequestParam("apart") String apart,@RequestParam("room") Integer room,@RequestParam("hall") Integer hall,
							  @RequestParam("bath") Integer bath,@RequestParam("mrt") Integer mrt,
							  @RequestParam(value = "picture1", required = false) MultipartFile picture1,
							  @RequestParam(value = "picture2", required = false) MultipartFile picture2,
							  @RequestParam(value = "picture3", required = false) MultipartFile picture3,
							  @SessionAttribute("memberBean")MemberBean mBean, Model m) throws Exception{
		
//		System.out.println(mBean.getAccount()+"!!!");
//		System.out.println("memberpk: "+mBean.getPk());
		System.out.println("picture1="+picture1);
		//取小數以下兩位
		NumberFormat numberFormat = new DecimalFormat("#.00");
		numberFormat.setRoundingMode(RoundingMode.HALF_UP);
		
		
		HouseBean hBean = hService.selectedHouse(hid);
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
		hBean.setRoom(room);
		hBean.setHall(hall);
		hBean.setBath(Integer.valueOf(bath));
		hBean.setAccountid(mBean.getPk());
		hBean.setMrtpk(mrt);
		hBean.setAddDate(hBean.getAddDate());

//		hBean.setMemberBean(mBean);
		
		//經緯度
		String fullAddress = city+dist+addr;
		Map<String, String> gResult = getGeocode(fullAddress);
		hBean.setLat(gResult.get("lat"));
		hBean.setLon(gResult.get("lon"));
		
		//圖片

		
		// 建立byte物件，交由 Hibernate 寫入資料庫
		if (picture1 != null && !picture1.isEmpty()) {
			try {
				byte[] b1 = picture1.getBytes();
				byte[] encodeBase641 = Base64.getEncoder().encode(b1);
				hBean.setImage1(b1);
				String base64Encoded1 = new String(encodeBase641,"UTF-8");
				hBean.setBase64image1(base64Encoded1);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		if (picture2 != null && !picture2.isEmpty()) {
			try {
				byte[] b2 = picture2.getBytes();
				byte[] encodeBase642 = Base64.getEncoder().encode(b2);
				hBean.setImage2(b2);
				String base64Encoded2 = new String(encodeBase642,"UTF-8");
				hBean.setBase64image2(base64Encoded2);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		if (picture3 != null && !picture3.isEmpty()) {
			try {
				byte[] b3 = picture3.getBytes();
				byte[] encodeBase643 = Base64.getEncoder().encode(b3);
				hBean.setImage3(b3);
				String base64Encoded3 = new String(encodeBase643,"UTF-8");
				hBean.setBase64image3(base64Encoded3);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		
		
		
		boolean update = hService.updateHouse(hBean);
		System.out.println(update);
		if (update==true) {
			List<HouseBean> list = hService.memberHouseList(mBean.getPk());
			m.addAttribute("houselist", list);
			
			return "redirect:/memberhouse";
		}
		return "redirect:/memberhouse";
		
		
	}
	
	
	
	@DeleteMapping(path = "/deletehouse")
	public String deleteHouse(@RequestParam("deleteh") Integer houseid) {
		boolean dltresv = rService.deleteReservationByHouseId(houseid);
		if (dltresv) {
			System.out.println("DELETE reservation");
		}
		boolean dlfh = ifs.deleteFavoriteByHid(houseid);
		if (dlfh) {
			System.out.println("DELETE favorite");
		}
		boolean dlhit = hitService.deleteHit(houseid);
		if (dlhit) {
			System.out.println("DELETE Hit");
		}
		
		boolean delete = hService.deleteHouse(houseid);
		if (delete) {
			System.out.println("DELETE success");
			return "redirect:/memberhouse";
		} else {
			System.out.println("DELETE failed");
		}
		return "redirect:/memberhouse";
	}
	
	private Map<String, String> getGeocode (String address) throws Exception{
		GeoApiContext context = new GeoApiContext.Builder()
			    .apiKey("AIzaSyAYTYpbvVfpyr5SsW2jUw_mGap2KAUOfQ0")
			    .build();
		GeocodingResult[] results = GeocodingApi.geocode(context, address).await();
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String lat = gson.toJson(results[0].geometry.location.lat);
		String lon = gson.toJson(results[0].geometry.location.lng);

		Map<String, String> mgeocode = new LinkedHashMap<>();
		mgeocode.put("lat", lat);
		mgeocode.put("lon", lon);
		context.shutdown();
		
		return mgeocode;
		
		
	}
}
