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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;
import tw.house._07_.model.HouseBean;
import tw.house._08_.register.model.MemberBean;

@Component("favorite")
@Entity
@Table(name = "favorite")
public class FavoriteBean {
	private Integer fid;
	private Integer accountId;
	private Integer houseid;
	private MemberBean memberId;
	private List<HouseBean> hBean;

	public void Favorite() {

	}

	@Id
	@Column(name = "hid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getFid() {
		return fid;
	}

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "accountid", insertable=false,updatable=false)
	public MemberBean getMemberBean() {
		return memberId;
	}

	@Column(name = "accountid")
	public Integer getAccountId() {
		return accountId;
	}

	@OneToMany(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "houseid", insertable=false,updatable=false)
	public List<HouseBean> gethBean() {
		return hBean;
	}

	@Column(name = "houseid")
	public Integer getHouseid() {
		return houseid;
	}

	@Column(name = "accountid")
	public MemberBean getMembeId() {
		return memberId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberId = memberBean;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}


	public void setHouseid(Integer houseid) {
		this.houseid = houseid;
	}

	public void setMembeId(MemberBean membeId) {
		this.memberId = membeId;
	}

	public void sethBean(List<HouseBean> hBean) {
		this.hBean = hBean;
	}
	
	@Transient
	@Override
	public String toString() {
		return "FavoriteBean [fid=" + fid + ", accountId=" + accountId + ", houseid=" + houseid + ", membeId=" + memberId
				+ ", hBean=" + hBean + "]";
	}
	
	
}
