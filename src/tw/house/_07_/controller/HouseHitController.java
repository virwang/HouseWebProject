package tw.house._07_.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.house._07_.model.HouseHitBean;
import tw.house._07_.model.HouseHitService;

@Controller
public class HouseHitController {

	@Autowired
	private HouseHitService hitService;
	
	@PostMapping(path = "/counthit")
	public ResponseEntity<String> countHit(@RequestParam("htid")Integer id,@RequestParam("count")Integer hit) {
		System.out.println("htid="+id+"&count="+hit);
		String status = "";
		ResponseEntity<String> re = null;
		HouseHitBean htBean = hitService.getHtBean(id);
		if (htBean==null) {
			boolean isht = hitService.insertHit(id);
			System.out.println(isht);
			if (isht) {
				HouseHitBean httBean = hitService.getHtBean(id);
				httBean.setHit(0+1);
				status="success";
				return re= new ResponseEntity<String>(status,HttpStatus.OK);
			}
			status="success";
			return re= new ResponseEntity<String>(status,HttpStatus.OK);
		}
//		System.out.println(htBean.toString());
		System.out.println("before set="+htBean.getHit());
		hit = hit+1;
		htBean.setHit(hit);
		System.out.println("after set="+htBean.getHit());
		
		boolean hitStatus = hitService.updateHit(htBean);
		System.out.println();
		if (hitStatus) {
			status="success";
			return re= new ResponseEntity<String>(status,HttpStatus.OK);
		}
		status="false";
		return re= new ResponseEntity<String>(status,HttpStatus.OK);
	}
}
