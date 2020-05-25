package tw.house._05_.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Component("favorite")
@Entity
@Table(name = "favorite")
public class FavoriteBean {
	private Integer hid;
	private String houseimg;
	private String title;
	private Float uprice;
	private Float ping;
	private String address;
	private String MRT;
	private Float age;
	private Integer accountid;
	private Integer houseid;
	private Date adddate;

	public void Favorite() {

	}

	@Id
	@Column(name = "hid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getHid() {
		return hid;
	}

	@Column(name = "title")
	public String getTitle() {
		return title;
	}

	@Column(name = "uprice")
	public Float getUprice() {
		return uprice;
	}

	@Column(name = "ping")
	public Float getPing() {
		return ping;
	}

	@Column(name = "address")
	public String getAddress() {
		return address;
	}

	@Column(name = "MRT")
	public String getMRT() {
		return MRT;
	}

	@Column(name = "age")
	public Float getAge() {
		return age;
	}

	@Column(name = "accountId")
	public Integer getAccountid() {
		return accountid;
	}

	@Column(name = "hosueId")
	public Integer getHouseid() {
		return houseid;
	}

	@Column(name = "houseimg")	
	public String getHouseimg() {
		return houseimg;
	}
	
	@Column(name = "addDate")
	public Date getAdddate() {
		return adddate;
	}

	public void setAdddate(Date adddate) {
		this.adddate = adddate;
	}

	public void setHouseimg(String houseimg) {
		this.houseimg = houseimg;
	}

	public void setHid(Integer hid) {
		this.hid = hid;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setUprice(Float uprice) {
		this.uprice = uprice;
	}

	public void setPing(Float ping) {
		this.ping = ping;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setMRT(String mRT) {
		MRT = mRT;
	}

	public void setAge(Float age) {
		this.age = age;
	}

	public void setAccountid(Integer accountid) {
		this.accountid = accountid;
	}

	public void setHouseid(Integer houseid) {
		this.houseid = houseid;
	}

	@Transient
	@Override
	public String toString() {
		return "FavoriteBean [hid=" + hid + ", houseimg=" + houseimg + ", title=" + title + ", uprice=" + uprice
				+ ", ping=" + ping + ", address=" + address + ", MRT=" + MRT + ", age=" + age + ", accountid="
				+ accountid + ", houseid=" + houseid + ", adddate=" + adddate + "]";
	}

}
