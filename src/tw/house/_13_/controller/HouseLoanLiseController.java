package tw.house._13_.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.house._13_.model.bean.HouseLoanList;
import tw.house._13_.model.service.HouseLoanListIplService;

@Controller
public class HouseLoanLiseController {

	@Autowired
	HouseLoanListIplService hlliplservice;


	@RequestMapping(path = "/ShowHouseLoanList.do", method = RequestMethod.GET,produces = {"application/json"})
	public ResponseEntity<Map<String, List<HouseLoanList>>> ShowHouseLoanList(Model m) {

		List<HouseLoanList> hlist = hlliplservice.ShowHouseLoanList();
		Map<String, List<HouseLoanList>> map = new HashMap<>();
		map.put("data",hlist);
		ResponseEntity<Map<String, List<HouseLoanList>>> re = new ResponseEntity<>(map,HttpStatus.OK);
		System.out.println("re=" +re);
		return re;
	}

}
