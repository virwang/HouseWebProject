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
@Table(name = "bankCode")
public class BankCodeBean {
	private Integer bankPkId;
	private String bankCode;
	private String bankName;
	
	public BankCodeBean() {		
	}
	public BankCodeBean(Integer bankPkId,String bankCode, String bankName) {
		super();
		this.bankPkId=bankPkId;
		this.bankCode = bankCode;
		this.bankName = bankName;
	}
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="bankpkId")
	public Integer getBankPkId() {
		return bankPkId;
	}
	public void setBankPkId(Integer bankPkId) {
		this.bankPkId = bankPkId;
	}
	@Column(name = "bankCode")
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	@Column(name="bankName")
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BankCodeBean [bankCode=");
		builder.append(bankCode);
		builder.append(", bankName=");
		builder.append(bankName);
		builder.append("]");
		return builder.toString();
	}
	
}
