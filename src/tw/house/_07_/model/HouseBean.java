package tw.house._07_.model;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.Arrays;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.house._08_.register.model.MemberBean;

@Component("house")
@Entity
@Table(name = "Houselist")
public class HouseBean {
	private Integer id;
	private String title;
	private String totalprice;
	private String unitprice;
	private String ping;
	private String city;
	private String dist;
	private String address;
	private String phone;
	private String apartment;
	private Integer accountid;
	private Integer mrtpk;
	private Integer room;
	private Integer hall;
	private Integer bath;
	private Timestamp addDate;
	private String lat;
	private String lon;
	private MemberBean memberBean;
	private MrtBean mrtBean;

	@JsonIgnore
	private byte[] image1;
	@JsonIgnore
	private byte[] image2;
	@JsonIgnore
	private byte[] image3;
	@Transient
	private String base64image1;
	@Transient
	private String base64image2;
	@Transient
	private String base64image3;

	
	public HouseBean() {
		
	}

	public HouseBean(Integer id, String title, String totalprice, String unitprice, String ping, String city, String dist, String address, String phone,
			String apartment, Integer accountid, Integer mrtpk, Integer room, Integer hall, Integer bath, Timestamp addDate, String lat, String lon) {
		this.id = id;
		this.title = title;
		this.totalprice = totalprice;
		this.unitprice = unitprice;
		this.ping = ping;
		this.city = city;
		this.dist = dist;
		this.address = address;
		this.phone = phone;
		this.apartment = apartment;
		this.accountid= accountid;
		this.mrtpk = mrtpk;
		this.room = room;
		this.hall = hall;
		this.bath = bath;
		this.addDate = addDate;
		this.lat = lat;
		this.lon = lon;


	}
	
	public HouseBean(Integer id, String title,String city, String dist) {
		this.id = id;
		this.title = title;
		this.city = city;
		this.dist = dist;
	}
	@Id @Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name="title")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getTotalprice() {
		return totalprice;
	}
	@Column(name="totalprice")
	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}

	@Column(name="unitprice")
	public String getUnitprice() {
		return unitprice;
	}

	public void setUnitprice(String unitprice) {
		this.unitprice = unitprice;
	}
	@Column(name="ping")
	public String getPing() {
		return ping;
	}

	public void setPing(String ping) {
		this.ping = ping;
	}
	@Column(name = "city")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	@Column(name = "dist")
	public String getDist() {
		return dist;
	}

	public void setDist(String dist) {
		this.dist = dist;
	}

	@Column(name="addr")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	@Column(name="phone")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Column(name="apartment")
	public String getApartment() {
		return apartment;
	}

	public void setApartment(String apartment) {
		this.apartment = apartment;
	}
	@Column(name = "accountid")
	public Integer getAccountid() {
		return accountid;
	}
	
	public void setAccountid(Integer accountid) {
		this.accountid = accountid;
	}
	@Column(name = "mrtpk")
	public Integer getMrtpk() {
		return mrtpk;
	}
	
	public void setMrtpk(Integer mrtpk) {
		this.mrtpk = mrtpk;
	}
	@Column(name = "room")
	public Integer getRoom() {
		return room;
	}

	public void setRoom(Integer room) {
		this.room = room;
	}
	@Column(name = "hall")
	public Integer getHall() {
		return hall;
	}
	
	public void setHall(Integer hall) {
		this.hall = hall;
	}
	@Column(name = "bath")
	public Integer getBath() {
		return bath;
	}
	@Column(name = "addDate")
	public Timestamp getAddDate() {
		return addDate;
	}

	public void setAddDate(Timestamp addDate) {
		this.addDate = addDate;
	}

	public void setBath(Integer bath) {
		this.bath = bath;
	}
	@Column(name = "lat")
	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}
	@Column(name = "lon")
	public String getLon() {
		return lon;
	}

	public void setLon(String lon) {
		this.lon = lon;
	}
	
	@Column(name = "image1")
	public byte[] getImage1() {
		return image1;
	}

	public void setImage1(byte[] image1) {
		this.image1 = image1;
	}
	
	@Column(name = "image2")
	public byte[] getImage2() {
		return image2;
	}

	public void setImage2(byte[] image2) {
		this.image2 = image2;
	}
	
	@Column(name = "image3")
	public byte[] getImage3() {
		return image3;
	}

	public void setImage3(byte[] image3) {
		this.image3 = image3;
	}

	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "accountid"
	, insertable=false,updatable=false)
	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "mrtpk"
	, insertable=false,updatable=false)
	public MrtBean getMrtBean() {
		return mrtBean;
	}
	
	public void setMrtBean(MrtBean mrtBean) {
		this.mrtBean = mrtBean;
	}

	public String getBase64image1() {
		return base64image1;
	}

	public void setBase64image1(String base64image1) {
		this.base64image1 = base64image1;
	}

	public String getBase64image2() {
		return base64image2;
	}

	public void setBase64image2(String base64image2) {
		this.base64image2 = base64image2;
	}

	public String getBase64image3() {
		return base64image3;
	}

	public void setBase64image3(String base64image3) {
		this.base64image3 = base64image3;
	}
	

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("HouseBean [id=");
		builder.append(id);
		builder.append(", title=");
		builder.append(title);
		builder.append(", totalprice=");
		builder.append(totalprice);
		builder.append(", unitprice=");
		builder.append(unitprice);
		builder.append(", ping=");
		builder.append(ping);
		builder.append(", city=");
		builder.append(city);
		builder.append(", dist=");
		builder.append(dist);
		builder.append(", address=");
		builder.append(address);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", apartment=");
		builder.append(apartment);
		builder.append(", accountid=");
		builder.append(accountid);
		builder.append(", mrtpk=");
		builder.append(mrtpk);
		builder.append(", room=");
		builder.append(room);
		builder.append(", hall=");
		builder.append(hall);
		builder.append(", bath=");
		builder.append(bath);
		builder.append(", addDate=");
		builder.append(addDate);
		builder.append(", lat=");
		builder.append(lat);
		builder.append(", lon=");
		builder.append(lon);
		builder.append(", memberBean=");
		builder.append(memberBean);
		builder.append(", mrtBean=");
		builder.append(mrtBean);
		builder.append(", image1=");
		builder.append(Arrays.toString(image1));
		builder.append(", image2=");
		builder.append(Arrays.toString(image2));
		builder.append(", image3=");
		builder.append(Arrays.toString(image3));
		builder.append(", base64image1=");
		builder.append(base64image1);
		builder.append(", base64image2=");
		builder.append(base64image2);
		builder.append(", base64image3=");
		builder.append(base64image3);
		builder.append("]");
		return builder.toString();
	}
	
	

	
	
	
	
}
