package tw.house._05_.model;

import java.sql.Blob;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.house._07_.model.MrtBean;
import tw.house._08_.register.model.MemberBean;

@Component("favorite")
@Entity
@Table(name = "favorite")
public class FavoriteBean {
	private Integer hid;
	private Blob coverImg;
	private String houseimg;
	private String title;
	private Double uprice;
	private Double ping;
	private String city;
	private String district;
	private String address;
	private Integer room;
	private String station;
	private Integer accountId;
	private Date adddate;
	private MemberBean memberBean;
	private MrtBean mrtBean;

	public void Favorite() {

	}

	@Id
	@Column(name = "hid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Transient
	@JsonIgnore
	public Integer getHid() {
		return hid;
	}

	@Column(name = "title")
	public String getTitle() {
		return title;
	}

	@Column(name = "uprice")
	public Double getUprice() {
		return uprice;
	}

	@Column(name = "ping")
	public Double getPing() {
		return ping;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "address", insertable = false, updatable = false)
	public String getAddress() {
		return address;
	}

	@Column(name = "houseimg")
	public String getHouseimg() {
		return houseimg;
	}

	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Taipei")
	@Column(name = "addDate")
	public Date getAdddate() {
		return adddate;
	}

	@Column(name = "coverImg")
	public Blob getCoverImg() {
		return coverImg;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "accountid", insertable = false, updatable = false)
	public MemberBean getMemberBean() {
		return memberBean;
	}

	@Column(name = "stationname")
	public String getMrtstation() {
		return station;
	}


	@Column(name = "city")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "room", insertable = false, updatable = false)
	public Integer getRoom() {
		return room;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "dis", insertable = false, updatable = false)
	public String getDistrict() {
		return district;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "station", insertable = false, updatable = false)
	public String getStation() {
		return station;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "district", insertable = false, updatable = false)
	public void setDistrict(String district) {
		this.district = district;
	}
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "district", insertable = false, updatable = false)
	public void setRoom(Integer room) {
		this.room = room;
	}

	public MrtBean getMrtBean() {
		return mrtBean;
	}

	public void setStation(String station) {
		this.station = station;
	}

	public void setMrtstation(String mrtstation) {
		this.station = mrtstation;
	}

	public void setMrtBean(MrtBean mrtBean) {
		this.mrtBean = mrtBean;
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public void setCoverImg(Blob coverImg) {
		this.coverImg = coverImg;
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

	public void setUprice(Double uprice) {
		this.uprice = uprice;
	}

	public void setPing(Double ping) {
		this.ping = ping;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
