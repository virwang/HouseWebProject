package tw.house._05_.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.house._05_.model.FavoriteBean;
import tw.house._05_.service.IFavoriteList;
import tw.house._07_.model.HouseService;
import tw.house._07_.model.MrtService;

@Controller
public class FavoriteController {
	

	
	@Autowired
	IFavoriteList ifavorite;
	@Autowired
	private HouseService hService;
	
	@Autowired
	private MrtService mService;
	
	
	@RequestMapping(path="/favorite", method =RequestMethod.GET)
	public String showfavorite() {
		System.out.println("favorite controller show page ");
		return "favoriteList";
	}
	
	@RequestMapping(path="/favoritelist", method =RequestMethod.POST)
	public String favoriteHouse(Model model, @RequestParam("favorite") Integer accountid) {
		System.out.println("hosueid"+ accountid);
		
		List<FavoriteBean> favlist = ifavorite.getmid(accountid);
		model.addAttribute("favorite", favlist);
		
		System.out.println("controller show favorite house table");
		return "favoriteList";
	}

}
