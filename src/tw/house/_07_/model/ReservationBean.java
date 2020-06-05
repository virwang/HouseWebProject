package tw.house._07_.model;

import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import tw.house._08_.register.model.MemberBean;

@Component("Reservation")
@Entity
@Table(name = "Reservation")
public class ReservationBean {
	
	private Integer no;
	private Integer houseid;
	private Integer applicant;
	private Integer recipient;
	private String  status;
	private LocalDate reservatedate;
	private String  reservatetime;
	private HouseBean houseBean;
	private MemberBean memberBean;

	
	public ReservationBean() {
		
	}
	public ReservationBean(Integer no, Integer houseid, Integer applicant, Integer recipient,
			String status,LocalDate reservatedate,String reservatetime) {
		this.no = no;
		this.houseid = houseid;
		this.applicant = applicant;
		this.recipient = recipient;
		this.status = status;
		this.reservatedate = reservatedate;
		this.reservatetime = reservatetime;
	}
	@Id @Column(name="no")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	@Column(name = "houseid")
	public Integer getHouseid() {
		return houseid;
	}
	public void setHouseid(Integer houseid) {
		this.houseid = houseid;
	}
	@Column(name = "applicant")
	public Integer getApplicant() {
		return applicant;
	}
	public void setApplicant(Integer applicant) {
		this.applicant = applicant;
	}
	@Column(name = "recipient")
	public Integer getRecipient() {
		return recipient;
	}
	public void setRecipient(Integer recipient) {
		this.recipient = recipient;
	}
	@Column(name = "status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Column(name = "reservatetime")
	public String getReservatetime() {
		return reservatetime;
	}
	public void setReservatetime(String reservatetime) {
		this.reservatetime = reservatetime;
	}
	@Column(name = "reservatedate")
	public LocalDate getReservatedate() {
		return reservatedate;
	}
	public void setReservatedate(LocalDate reservatedate) {
		this.reservatedate = reservatedate;
	}
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "houseid"
	, insertable=false,updatable=false)
	public HouseBean getHouseBean() {
		return houseBean;
	}
	public void setHouseBean(HouseBean houseBean) {
		this.houseBean = houseBean;
	}
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "applicant"
	, insertable=false,updatable=false)
	public MemberBean getMemberBean() {
		return memberBean;
	}
	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}



	
	
	
	
}
