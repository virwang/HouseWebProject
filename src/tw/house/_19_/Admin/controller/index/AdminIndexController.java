package tw.house._19_.Admin.controller.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AdminIndexController {
	@RequestMapping(path = "/admin_index", method = RequestMethod.GET)
	public String admin_index() {
		return "admin_index";
	}
}
