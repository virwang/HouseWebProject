package tw.house._13_.controller;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import tw.house._13_.model.bean.TwoTaipei;
import tw.house._13_.model.service.AjaxISearchTwoTaipeiService;

@Controller
public class AjaxController {

	@Autowired
	AjaxISearchTwoTaipeiService asttservice;

	// 送出長度跟平均價格
	@RequestMapping(path = "/TotalBought.do", method = RequestMethod.GET)
	public @ResponseBody String TotalBought(Model m, @RequestParam("districtavg") String district,
			@RequestParam(value = "select_year", required = false) String sdate,
			@RequestParam(value = "searchword", required = false) String location) {
		System.out.println("抓到了：" + district + "／" + sdate + "／" + location);

		Map<String, String> result = new HashMap<>();
		List<TwoTaipei> tlist = asttservice.SearchTwoTaipeiYear(district, sdate, location);
		int listSize = tlist.size();
		System.out.println("listSize=" + listSize);

		float uPrice = 0;
		for (int i = 0; i < tlist.size(); i++) {
			uPrice += tlist.get(i).getUprice_p();
		}
		String strListSize = String.valueOf(listSize);
		System.out.println("strListSize=" + strListSize);

		float xx = uPrice / listSize;
		DecimalFormat df = new DecimalFormat("##.00");
		xx = Float.parseFloat(df.format(xx));
		String avgUprice = String.valueOf(xx);
		System.out.println("avgUprice=" + avgUprice);

		result.put("TwoTaipeiListSize", strListSize);
		result.put("TwoTaipeiListAvgUprice", avgUprice);
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(result);
		System.out.println("json=" + json);

		return json;
	}

	@RequestMapping(path = "/HouseDetail.do", method = RequestMethod.GET)
	public @ResponseBody String HouseDetail(Model m, @RequestParam("id") Integer id) {

		List<TwoTaipei> tlist = asttservice.selectTwoTaipeiID(id);
//		System.out.println("tlist=" + tlist);
//		tlist = new ArrayList<TwoTaipei>();
		Iterator<TwoTaipei> iterator = tlist.iterator();
		while (iterator.hasNext()) {
			System.out.println("iterator.next()="+iterator.next());
		}
					
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(tlist);
		System.out.println("json=" + json);
				
		
		return json;
	}

}
