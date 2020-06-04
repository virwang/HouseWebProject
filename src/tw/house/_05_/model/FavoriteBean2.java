package tw.house._05_.model;

import java.sql.Blob;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;
import tw.house._07_.model.HouseBean;
import tw.house._08_.register.model.MemberBean;
//
@Component
@Entity
@Table(name = "favoriteT")
public class FavoriteBean2 {
	private Integer fid;
	private HouseBean houseBean;
	private MemberBean memberBean;


	public FavoriteBean2() {

	}
	

	public void setHouseBean(HouseBean houseBean) {
		this.houseBean = houseBean;
	}


	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}


	@Id
	@Column(name = "fid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid=fid;
	}

	@OneToOne
	@JoinColumn(name = "houseid")
	public HouseBean getHouseBean() {
		return houseBean;
	}


	@OneToOne
	@JoinColumn(name = "accountid")
	public MemberBean getMemberBean() {
		return memberBean;
	}
	
	
	
}
