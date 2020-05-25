package tw.house._07_.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.house._07_.model.HouseBean;
import tw.house._07_.model.HouseService;
import tw.house._07_.model.MrtBean;
import tw.house._07_.model.MrtService;

@Controller
public class MapController {
	@Autowired
	private MrtService mrtService;
	
	@Autowired
	private HouseService hService;
	
	
	@GetMapping(path = "/searchhousemap")
	public String searchmap() {
		return "searchmap";
	}
	
	@GetMapping(path = "/searchmapjson",produces = {"application/json"})
	public ResponseEntity<List<MrtBean>> showMrtPoint() {
		List<MrtBean> list = mrtService.mrtlist();
		ResponseEntity<List<MrtBean>> re = new ResponseEntity<>(list,HttpStatus.OK);
		return re;
		
	}
	@GetMapping(path = "/mrtlinepoint",produces = {"application/json"})
	public ResponseEntity<List<MrtBean>> showEachMrtLinePoint(@RequestParam("linecode")String line){
		System.out.println(line);
		List<MrtBean> list = mrtService.mrtlinepoint(line);
		ResponseEntity<List<MrtBean>> re = new ResponseEntity<>(list, HttpStatus.OK);
		return re;
	}
	@GetMapping(path = "/stationhouse",produces = {"application/json"})
	public ResponseEntity<Map<String, Object>> houseByMrt(@RequestParam("stationpk")Integer station){
		MrtBean mrt = mrtService.selectedStaion(station);
		List<HouseBean> hlist = hService.mrthouse(station);
		Map<String, Object> map = new LinkedHashMap<>();
		map.put("mrt", mrt);
		map.put("hlist", hlist);
		ResponseEntity<Map<String, Object>> re = new ResponseEntity<>(map, HttpStatus.OK);
		return re;
	}
}
