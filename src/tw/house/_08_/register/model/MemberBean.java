package tw.house._08_.register.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity @Table(name="Member")
@Component
public class MemberBean {
	private Integer pk;
	private String account;
	@JsonIgnore
	private String psw;
	private String name;
	@JsonIgnore
	private String idCard;
	private String gender;
	private String usertype;
	private String tel;
	private String email;	
	private Timestamp registerDate;
	@Transient
	@JsonIgnore
	private String base64image1;
	@Transient
	private String googleId;
	@Column(name = "googleId")
	public String getGoogleId() {
		return googleId;
	}
	public void setGoogleId(String googleId) {
		this.googleId = googleId;
	}
	@Column(name="base64image1")
	public String getBase64image1() {
		return base64image1;
	}
	public void setBase64image1(String base64image1) {
		this.base64image1 = base64image1;
	}
	public MemberBean(Integer pk, String account, String psw, String name, String idCard, String gender,
			String usertype, String tel, String email, Timestamp registerDate,String base64image1,String googleId) {
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
		this.base64image1=base64image1;
		this.googleId=googleId;
	}
	public MemberBean() {
		
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="pkNo")
	public Integer getPk() {
		return pk;
	}
	public void setPk(Integer pk) {
		this.pk = pk;
	}
	@Column(name="account")
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	@Column(name="password")
	public String getPsw() {
		return psw;
	}
	public void setPsw(String psw) {
		this.psw = psw;
	}
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name="idCard")
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	@Column(name="gender")
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Column(name="memberType")
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getTel() {
		return tel;
	}
	@Column(name="tel")
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Column(name="email")
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
	
	
	
}
