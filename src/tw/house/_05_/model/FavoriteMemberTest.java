package tw.house._05_.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import tw.house._05_.model.FavoriteBean;

@Entity
@Table(name = "Member")
@Component
public class FavoriteMemberTest {
	private Integer pk;
	private String account;
	private String psw;
	private String name;
	private String idCard;
	private String gender;
	private String usertype;
	private String tel;
	private String email;
	private Timestamp registerDate;
	private List<FavoriteHouseTest> fht;

	

	public FavoriteMemberTest(Integer pk, String account, String psw, String name, String idCard, String gender,
			String usertype, String tel, String email, Timestamp registerDate) {
		super();
		this.pk = pk;
		this.account = account;
		this.psw = psw;
		this.name = name;
		this.idCard = idCard;
		this.gender = gender;
		this.usertype = usertype;
		this.tel = tel;
		this.email = email;
		this.registerDate = registerDate;
	}

	public FavoriteMemberTest() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pkNo")
	public Integer getPk() {
		return pk;
	}

	public void setPk(Integer pk) {
		this.pk = pk;
	}

	@Column(name = "account")
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Column(name = "password")
	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "idCard")
	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	@Column(name = "gender")
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Column(name = "memberType")
	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getTel() {
		return tel;
	}

	@Column(name = "tel")
	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name = "email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Timestamp registerDate) {
		this.registerDate = registerDate;
	}
	
	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "members")
	public List<FavoriteHouseTest> getFht() {
		return fht;
	}

	public void setFht(List<FavoriteHouseTest> fht) {
		this.fht = fht;
	}	


}