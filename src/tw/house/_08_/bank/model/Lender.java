package tw.house._08_.bank.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GenerationType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import tw.house._08_.register.model.MemberBean;

@Component
@Entity
@Table(name = "Lender")
public class Lender {
	private Integer pkId;
//	private Integer nameId;
//	private Integer bankId;
	private String moneyType;
	private String easing;
	private String star;
	private MemberBean memberBean;
	private BankBean bankTest;
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="pkNo")
	public MemberBean getMemberBean() {
		return memberBean;
	}
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "bankId")
	public BankBean getBankTest() {
		return bankTest;
	}
	public void setBankTest(BankBean bankTest) {
		this.bankTest = bankTest;
	}


	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}
//	@ManyToOne(cascade = CascadeType.ALL)
//	@JoinColumn(name = "bankId")
//	public Bank getBankBean() {
//		return bankBean;
//	}
//	
//	public void setBankBean(Bank bankBean) {
//		this.bankBean = bankBean;
//	}

	public Lender() {
	}	
	public Lender(Integer pkId, String moneyType, String easing, String star, MemberBean memberBean,
			BankBean bankTest) {
		super();
		this.pkId = pkId;
		this.moneyType = moneyType;
		this.easing = easing;
		this.star = star;
		this.memberBean = memberBean;
		this.bankTest = bankTest;
	}

	@Id @Column(name = "pkId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getPkId() {
		return pkId;
	}
	public void setPkId(Integer pkId) {
		this.pkId = pkId;
	}
//	@Column(name = "nameId")
//	
//	public Integer getNameId() {
//		return nameId;
//	}
//	public void setNameId(Integer nameId) {
//		this.nameId = nameId;
//	}
//	@Column(name = "bankId")
//	public Integer getBankId() {
//		return bankId;
//	}
//	public void setBankId(Integer bankId) {
//		this.bankId = bankId;
//	}
	@Column(name = "moneyType")
	public String getMoneyType() {
		return moneyType;
	}
	public void setMoneyType(String moneyType) {
		this.moneyType = moneyType;
	}
	@Column(name = "easing")
	public String getEasing() {
		return easing;
	}
	public void setEasing(String easing) {
		this.easing = easing;
	}
	@Column(name = "star")
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Lender [pkId=");
		builder.append(pkId);
		builder.append(", moneyType=");
		builder.append(moneyType);
		builder.append(", easing=");
		builder.append(easing);
		builder.append(", star=");
		builder.append(star);
		builder.append(", memberBean=");
		builder.append(memberBean);
		builder.append(", bankTest=");
		builder.append(bankTest);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
