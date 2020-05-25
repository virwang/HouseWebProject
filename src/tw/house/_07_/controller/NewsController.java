package tw.house._07_.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.house._07_.model.NewsBean;
import tw.house._07_.model.NewsBeanService;

@Controller
//@RequestMapping(path = "/News")
public class NewsController {
	
	@Autowired
	private NewsBeanService nService;
	
	@GetMapping(path = "newsList")
	public String showNewsList(Model m) {
		
		List<NewsBean> list = nService.getPageNews();
		m.addAttribute("NewsList", list);
		
		return "news";
	}
	@GetMapping(path = "newsSearch")
	public String showSearchNewsList(@RequestParam(value = "area",required=false) String newsareaname, Model m) {
		if (newsareaname==null) {
			return "redirect:/newsList";	
		} else {
			List<NewsBean> list = nService.getSearchNews(newsareaname);
			m.addAttribute("NewsList", list);
			return "news";

		}
		
	}
	@GetMapping(path = "newsShow")
	public String showNews(@RequestParam("NEWSID") Integer newsId, Model m) {
		
		NewsBean news = nService.getSelectNews(newsId);
		System.out.println(news.getNewstitle());
		m.addAttribute("selectnews", news);
		
		return "news_show";
	}

	
}
