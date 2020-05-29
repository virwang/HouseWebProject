package tw.house._05_.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Component(value = "compare")
@Entity
@Table(name = "compare")
public class Compare {
	
	Integer hiberid;
	Integer userid;
	Integer houseid;
	String title;
	Integer totalprice;
	String uprice;
	String ping;
	String addr;
	String MRT;
	Integer houseage;
	String floor;
	String type;

	public Compare() {
	}
	
	
	@Id @Column(name = "hiberId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getHiberid() {
		return hiberid;
	}

	@Column(name = "userId")
	public Integer getUserid() {
		return userid;
	}

	@Column(name = "houseId")
	public Integer getHouseid() {
		return houseid;
	}

	@Column(name = "title")
	public String getTitle() {
		return title;
	}

	@Column(name = "totalproce")
	public Integer getTotalprice() {
		return totalprice;
	}

	@Column(name = "uprice")
	public String getUprice() {
		return uprice;
	}

	@Column(name ="ping")
	public String getPing() {
		return ping;
	}

	@Column(name = "MRT")
	public String getMRT() {
		return MRT;
	}

	@Column(name = "hosueage")
	public Integer getHouseage() {
		return houseage;
	}

	@Column(name = "floor")
	public String getFloor() {
		return floor;
	}
	
	@Column(name = "type")
	public String getType() {
		return type;
	}

	@Column(name = "addr")
	public String getAddr() {
		return addr;
	}

	public void setHiberid(Integer hiberid) {
		this.hiberid = hiberid;
	}


	public void setUserid(Integer userid) {
		this.userid = userid;
	}


	public void setHouseid(Integer houseid) {
		this.houseid = houseid;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public void setTotalprice(Integer totalprice) {
		this.totalprice = totalprice;
	}


	public void setUprice(String uprice) {
		this.uprice = uprice;
	}


	public void setPing(String ping) {
		this.ping = ping;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public void setMRT(String mRT) {
		MRT = mRT;
	}


	public void setHouseage(Integer houseage) {
		this.houseage = houseage;
	}


	public void setFloor(String floor) {
		this.floor = floor;
	}


	public void setType(String type) {
		this.type = type;
	}


	@Transient
	@Override
	public String toString() {
		return "ShowFavorite [hiberid=" + hiberid + ", userid=" + userid + ", houseid=" + houseid + ", title=" + title
				+ ", totalprice=" + totalprice + ", uprice=" + uprice + ", ping=" + ping + ", addr=" + addr + ", MRT="
				+ MRT + ", houseage=" + houseage + ", floor=" + floor + ", type=" + type + "]";
	}

	
}
