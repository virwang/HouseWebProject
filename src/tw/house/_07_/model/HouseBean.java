package tw.house._07_.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

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
	private String address;
	private String phone;
	private String apartment;
	private String mrt;
	private Date adddate;
	private Integer accountid;
	private MemberBean memberBean;
	
	public HouseBean() {
		
	}

	public HouseBean(Integer id, String title, String totalprice, String unitprice, String ping, String address, String phone,
			String apartment, Integer accountid, String mrt, Date adddate) {
		this.id = id;
		this.title = title;
		this.totalprice = totalprice;
		this.unitprice = unitprice;
		this.ping = ping;
		this.address = address;
		this.phone = phone;
		this.apartment = apartment;
		this.accountid= accountid;
		this.mrt= mrt;
		this.adddate= adddate;
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

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "accountid", insertable=false,updatable=false)
	public MemberBean getMemberBean() {
		return memberBean;
	}
	
	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	@Column(name= "mrt")
	public String getMrt() {
		return mrt;
	}

	public void setMrt(String mrt) {
		this.mrt = mrt;
	}
	
	@Column(name = "adddate")
	public Date getAdddate() {
		return adddate;
	}

	public void setAdddate(Date adddate) {
		this.adddate = adddate;
	}
	
	@Transient
	@Override
	public String toString() {
		System.out.println("get station="+mrt);
		return "HouseBean [id=" + id + ", title=" + title + ", totalprice=" + totalprice + ", unitprice=" + unitprice
				+ ", ping=" + ping + ", address=" + address + ", phone=" + phone + ", apartment=" + apartment + ", mrt="
				+ mrt + ", adddate=" + adddate + ", accountid=" + accountid + ", memberBean=" + memberBean + "]";
	}
}
