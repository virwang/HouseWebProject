package tw.house._05_.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;
import tw.house._07_.model.HouseBean;
import tw.house._08_.register.model.MemberBean;
import tw.house._13_.model.bean.TwoTaipei;

@Component("Favorite")
@Entity
@Table(name = "favorite")
public class FavoriteBean {
	private Integer fid;
	private Integer accountId;
	private Integer houseId;
	private MemberBean memberBean;
	private HouseBean houseBean;


	public FavoriteBean() {

	}

	@Id
	@Column(name = "fid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getFid() {
		return fid;
	}

	@OneToOne
	@JoinColumn(name = "houseid")
//	@Transient
	public HouseBean getHouseBean() {
		return houseBean;
	}

	@OneToOne
	@JoinColumn(name = "accountid")
	public MemberBean getMemberBean() {
		return memberBean;
	}
	@Transient
//	@Column(name = "accountid")
	public Integer getAccountId() {
		return accountId;
	}
	@Transient
//	@Column(name = "houseid")
	public Integer getHouseId() {
		return houseId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public void setHouseId(Integer houseId) {
		this.houseId = houseId;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public void setMembeId(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public void setHouseBean(HouseBean houseBean) {
		this.houseBean = houseBean;
	}
	
	@Transient
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FavoriteBean [fid=");
		builder.append(fid);
		builder.append(", meberBean=");
		builder.append(memberBean);
		builder.append(", houseBean=");
		builder.append(houseBean);
		builder.append("]");
		return builder.toString();
	}
}
