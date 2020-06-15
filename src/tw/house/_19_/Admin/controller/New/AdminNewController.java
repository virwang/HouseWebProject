package tw.house._19_.Admin.controller.New;

import java.util.List;
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
import tw.house._07_.model.NewsBean;
import tw.house._19_.Admin.model.New.AdminNewService;

@Controller
public class AdminNewController {
	@Autowired
	private AdminNewService service;
	
	@RequestMapping(path = "/getnewlist", method = RequestMethod.GET)
	public String NewList(Model model) {
		List<NewsBean> list = service.getNews();
		model.addAttribute("newList", list);
		return "admin_newsList";
	}
	@RequestMapping(path = "/ajaxnewlist", method = RequestMethod.GET,produces = {"application/json"} )
	public ResponseEntity<List<NewsBean>> ajaxnewlist(){
		List<NewsBean> list = service.getNews();
		ResponseEntity<List<NewsBean>> re= new ResponseEntity<>(list,HttpStatus.OK);
		return re;
		}
	@GetMapping("/showNew")
	public String getNew(Model model,@RequestParam("id") Integer id) {
		NewsBean bean = service.getById(id);
		model.addAttribute("new1", bean);
		return "admin_newsU_D";
	}
	@PostMapping("/updateNew")
	public String updateNew(@RequestParam("id")Integer id,
			@RequestParam("newstitle")String newstitle,
			@RequestParam("newscontent")String newscontent,
			@RequestParam("newscityname")String newscityname,
			@RequestParam("newsareaname")String newsareaname,
			Model model) {	
		
			NewsBean bean = service.getById(id);
			
		boolean update = service.update(bean);
		System.out.println(update);
		if(update) {
			bean.setNewstitle(newstitle);
			bean.setNewscontent(newscontent);
			bean.setNewscityname(newscityname);
			bean.setNewsareaname(newsareaname);
			return "redirect:/admin_index";
		}else {
			return "redirect:/showNew";
		}
	}
	@DeleteMapping("/deleteNew")
	public String delete(@RequestParam("nid") Integer id) {
		System.out.println("nid="+id);
		NewsBean bean = service.getById(id);
		boolean delete = service.delete(bean);
		if(delete==true) {
			System.out.println("delete Success");
			return "redirect:/admin_index";
		}else {
			System.out.println("delete failed");
			return "redirect:/admin_index";
		}
	}
	@GetMapping("/createnew")
	public String showInsertForm(Model model) {
		NewsBean bean = new NewsBean();
		model.addAttribute("NewsBean", bean);
		return "admin_newscreate";
	}
	@PostMapping("/insertNews")
	public String insertNews(NewsBean bean,
			@RequestParam("newstitle")String newstitle,
			@RequestParam("newscityname")String newscityname,
			@RequestParam("newsareaname")String newsareaname,
			@RequestParam("newscontent")String newscontent,
			Model model
			) {
		System.out.println("newscityname="+newscityname);
		boolean save=service.save(bean);
		if(save) {
			bean.setNewstitle(newstitle);
			bean.setNewscityname(newscityname);
			bean.setNewsareaname(newsareaname);
			bean.setNewscontent(newscontent);	
			bean.setNewsareaid(1);
			if(newscityname.equals("taipei")) {		
				bean.setNewscityid(1);
			}else {
				bean.setNewscityid(2);
			}
			
			return "redirect:admin_index";
		}else {
			return "redirect:admin_index";
		}	
}
}
