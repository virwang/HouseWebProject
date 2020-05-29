package tw.house._05_.model;

import java.sql.Blob;
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
import tw.house._07_.model.HouseBean;
import tw.house._08_.register.model.MemberBean;

@Component("favorite")
@Entity
@Table(name = "favorite")
public class FavoriteBean {
	private Integer fid;
	private Integer houseid;
	private Integer accountid;
	private MemberBean mb;
	private List<HouseBean> hBean;

	public void Favorite() {

	}

	@Id
	@Column(name = "fid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getFid() {
		return fid;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "accountid", insertable=false,updatable=false)
	public MemberBean getMb() {
		return mb;
	}

	public void setMb(MemberBean mb) {
		this.mb = mb;
	}
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id", insertable = false, updatable = false)
//	@Transient
	public List<HouseBean> gethBean() {
		return hBean;
	}

	@Column(name = "houseid")
	public Integer getHouseid() {
		return houseid;
	}
	
	@Column(name = "accountid")
	public Integer getAccountid() {
		return accountid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public void setHouseid(Integer houseid) {
		this.houseid = houseid;
	}

	public void sethBean(List<HouseBean> hBean) {
		this.hBean = hBean;
	}

	public void setAccountid(Integer accountid) {
		this.accountid = accountid;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FavoriteBean [fid=");
		builder.append(fid);
		builder.append(", houseid=");
		builder.append(houseid);
		builder.append(", accountid=");
		builder.append(accountid);
		builder.append(", mb=");
		builder.append(mb);
		builder.append(", hBean=");
		builder.append(hBean);
		builder.append("]");
		return builder.toString();
	}
		
}
