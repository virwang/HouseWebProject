package tw.house._08_.bank.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "bank")
public class BankBean {
	private Integer bankId;
	private String bankCode;
	private String branchCode;
	private String bankName;
	private String bankCity;
	private String bankDist;
	private String bankAddr;
	private String bankTel;
	
	public BankBean() {
	}
	public BankBean(Integer bankId, String bankCode, String branchCode, String bankName, String bankCity,
			String bankDist, String bankAddr, String bankTel) {
		super();
		this.bankId = bankId;
		this.bankCode = bankCode;
		this.branchCode = branchCode;
		this.bankName = bankName;
		this.bankCity = bankCity;
		this.bankDist = bankDist;
		this.bankAddr = bankAddr;
		this.bankTel = bankTel;
	}
	@Id @Column(name = "bankId")
	@GeneratedValue(strategy =GenerationType.IDENTITY )
	public Integer getBankId() {
		return bankId;
	}
	public void setBankId(Integer bankId) {
		this.bankId = bankId;
	}
	@Column(name = "bankCode")
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	@Column(name = "branchCode")
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	@Column(name = "bankName")
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	@Column(name = "bankCity")
	public String getBankCity() {
		return bankCity;
	}
	public void setBankCity(String bankCity) {
		this.bankCity = bankCity;
	}
	@Column(name = "bankDist")
	public String getBankDist() {
		return bankDist;
	}
	public void setBankDist(String bankDist) {
		this.bankDist = bankDist;
	}
	@Column(name = "bankAddr")
	public String getBankAddr() {
		return bankAddr;
	}
	public void setBankAddr(String bankAddr) {
		this.bankAddr = bankAddr;
	}
	@Column(name = "bankTel")
	public String getBankTel() {
		return bankTel;
	}
	public void setBankTel(String bankTel) {
		this.bankTel = bankTel;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BookTest [bankId=");
		builder.append(bankId);
		builder.append(", bankCode=");
		builder.append(bankCode);
		builder.append(", branchCode=");
		builder.append(branchCode);
		builder.append(", bankName=");
		builder.append(bankName);
		builder.append(", bankCity=");
		builder.append(bankCity);
		builder.append(", bankDist=");
		builder.append(bankDist);
		builder.append(", bankAddr=");
		builder.append(bankAddr);
		builder.append(", bankTel=");
		builder.append(bankTel);
		builder.append("]");
		return builder.toString();
	}
	
	
}

