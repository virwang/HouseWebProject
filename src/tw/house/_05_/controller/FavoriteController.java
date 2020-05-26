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

@Controller
public class FavoriteController {
	
	@Autowired
	IFavoriteList ifavorite;
	
	@RequestMapping(path="/favorite.do", method =RequestMethod.GET)
	public String showfavorite() {
		System.out.println("favorite controller show page ");
		return "favoriteList";
	}
	
	@RequestMapping(path="/favoritelist.do", method =RequestMethod.POST)
	public String favoriteHouse(Model model, @RequestParam("favorite") Integer houseid) {
		System.out.println("hosueid"+ houseid);
		
		List<FavoriteBean> favlist = ifavorite.getHouseid(houseid);
		model.addAttribute("favorite", favlist);
		
		System.out.println("controller show favorite house table");
		return "favoriteList";
	}

}
