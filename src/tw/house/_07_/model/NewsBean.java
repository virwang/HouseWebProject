package tw.house._07_.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Component
@Entity
@Table(name = "News")
public class NewsBean {
	private Integer newsnum;
	private String newstitle;
	@JsonIgnore
	private String newscontent;
	private Integer newscityid;
	private String newscityname;
	private Integer newsareaid;
	private String newsareaname;
	
	public NewsBean(Integer newsnum, String newstitle, String newscontent, Integer newscityid, String newscityname,
			Integer newsareaid, String newsareaname) {

		this.newsnum = newsnum;
		this.newstitle = newstitle;
		this.newscontent = newscontent;
		this.newscityid = newscityid;
		this.newscityname = newscityname;
		this.newsareaid = newsareaid;
		this.newsareaname = newsareaname;
	}
	
	
	
	public NewsBean() {
		
	}


	@Id @Column(name = "news_number")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getNewsnum() {
		return newsnum;
	}
	public void setNewsnum(Integer newsnum) {
		this.newsnum = newsnum;
	}
	@Column(name = "news_title")
	public String getNewstitle() {
		return newstitle;
	}
	public void setNewstitle(String newstitle) {
		this.newstitle = newstitle;
	}
	
	@Column(name = "news_content")
	public String getNewscontent() {
		return newscontent;
	}
	public void setNewscontent(String newscontent) {
		this.newscontent = newscontent;
	}
	@Column(name = "news_city_id")
	public Integer getNewscityid() {
		return newscityid;
	}
	public void setNewscityid(Integer newscityid) {
		this.newscityid = newscityid;
	}
	@Column(name = "news_city_name")
	public String getNewscityname() {
		return newscityname;
	}
	public void setNewscityname(String newscityname) {
		this.newscityname = newscityname;
	}
	@Column(name = "news_area_id")
	public Integer getNewsareaid() {
		return newsareaid;
	}
	public void setNewsareaid(Integer newsareaid) {
		this.newsareaid = newsareaid;
	}
	@Column(name = "news_area_name")
	public String getNewsareaname() {
		return newsareaname;
	}
	public void setNewsareaname(String newsareaname) {
		this.newsareaname = newsareaname;
	}
	
	
	
}
