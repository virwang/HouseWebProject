package tw.house._07_.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.house._07_.model.HouseBean;

@Controller
public class JsonCreatorController {
	@RequestMapping(path = "/houseBeanJson", method = RequestMethod.GET)
    public String processJsonCreate(Model m) {
    	HouseBean hBean = new HouseBean();
    	hBean.setId(1);
    	hBean.setTitle("安安你好");
    	hBean.setAccountid(5);
    	hBean.setAddress("台北市");
    	List<HouseBean> list = new ArrayList<>();
    	list.add(hBean);
    	HouseBean hBean2 = new HouseBean();
    	hBean2.setId(2);
    	hBean2.setTitle("安你好");
    	hBean2.setAccountid(5);
    	hBean2.setAddress("台北市");
    	list.add(hBean2);
    	m.addAttribute("houselist", list);
    	return "buy";

    }
}
