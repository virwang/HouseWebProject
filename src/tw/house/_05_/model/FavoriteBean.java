package tw.house._05_.model;

import java.sql.Blob;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;


import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.house._07_.model.HouseBean;
import tw.house._07_.model.MrtBean;
import tw.house._08_.register.model.MemberBean;

@Component("favorite")
@Entity
@Table(name = "favorite")
public class FavoriteBean {
	private Integer fid;
	private Integer accountId;
	private Integer houseid;
	private MemberBean membeId;
	private MrtBean mrtBean;
	private List<HouseBean> hBean;
 
	public void Favorite() {

	}

	@Id
	@Column(name = "hid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getFid() {
		return fid;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "accountid", insertable = false, updatable = false)
	public MemberBean getMemberBean() {
		return membeId;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "mrtpk", insertablefalse,updatable=false)
	public MrtBean getMrtBean() {
		return mrtBean;
	}


	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "accountid", insertable=false,updatable=false)
	public Integer getAccountId() {
		return accountId;
	}
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "houseid", referencedColumnName = "id")
	public HouseBean gethBean() {
		return hBean;
	}
	
	@Column(name = "houseid")
	public Integer getHouseid() {
		return houseid;
	}

	@Column(name = "accountid")
	public MemberBean getMembeId() {
		return membeId;
	}


	public void setMrtBean(MrtBean mrtBean) {
		this.mrtBean = mrtBean;
	}
	
	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.membeId = memberBean;
	}

	public void setHid(Integer hid) {
		this.fid = hid;
	}


}
