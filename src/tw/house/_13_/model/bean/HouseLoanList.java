package tw.house._13_.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "HouseLoanList")
@Component
public class HouseLoanList {

	private Integer HOUSE_ID;
	private String BANK_NAME;
	private String PROJECT_NAME;
	private String BANK_LINKS;
	private String STARTDATE;
	private String ENDDATE;
	private String RATE_TYPE;
	private Float GRACE_MONTH;
	private String LIMIT_TYPE;
	private String UPDATE_DATE;
	private Float PROJECT_ID;
	private Float FirstRate;
	
	
	@Column(name = "HOUSE_ID")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getHOUSE_ID() {
		return HOUSE_ID;
	}
	public void setHOUSE_ID(Integer hOUSE_ID) {
		HOUSE_ID = hOUSE_ID;
	}
	
	@Column(name = "BANK_NAME")
	public String getBANK_NAME() {
		return BANK_NAME;
	}
	public void setBANK_NAME(String bANK_NAME) {
		BANK_NAME = bANK_NAME;
	}
	
	@Column(name = "PROJECT_NAME")
	public String getPROJECT_NAME() {
		return PROJECT_NAME;
	}
	public void setPROJECT_NAME(String pROJECT_NAME) {
		PROJECT_NAME = pROJECT_NAME;
	}
	
	@Column(name = "BANK_LINKS")
	public String getBANK_LINKS() {
		return BANK_LINKS;
	}
	public void setBANK_LINKS(String bANK_LINKS) {
		BANK_LINKS = bANK_LINKS;
	}
	
	@Column(name = "STARTDATE")
	public String getSTARTDATE() {
		return STARTDATE;
	}
	public void setSTARTDATE(String sTARTDATE) {
		STARTDATE = sTARTDATE;
	}
	
	@Column(name = "ENDDATE")
	public String getENDDATE() {
		return ENDDATE;
	}
	public void setENDDATE(String eNDDATE) {
		ENDDATE = eNDDATE;
	}
	
	@Column(name = "RATE_TYPE")
	public String getRATE_TYPE() {
		return RATE_TYPE;
	}
	public void setRATE_TYPE(String rATE_TYPE) {
		RATE_TYPE = rATE_TYPE;
	}
	
	@Column(name = "GRACE_MONTH")
	public Float getGRACE_MONTH() {
		return GRACE_MONTH;
	}
	public void setGRACE_MONTH(Float gRACE_MONTH) {
		GRACE_MONTH = gRACE_MONTH;
	}
	
	@Column(name = "LIMIT_TYPE")
	public String getLIMIT_TYPE() {
		return LIMIT_TYPE;
	}
	public void setLIMIT_TYPE(String lIMIT_TYPE) {
		LIMIT_TYPE = lIMIT_TYPE;
	}
	
	@Column(name = "UPDATE_DATE")
	public String getUPDATE_DATE() {
		return UPDATE_DATE;
	}
	public void setUPDATE_DATE(String uPDATE_DATE) {
		UPDATE_DATE = uPDATE_DATE;
	}
	
	@Column(name = "PROJECT_ID")
	public Float getPROJECT_ID() {
		return PROJECT_ID;
	}
	public void setPROJECT_ID(Float pROJECT_ID) {
		PROJECT_ID = pROJECT_ID;
	}
	
	@Column(name = "FirstRate")
	public Float getFirstRate() {
		return FirstRate;
	}
	public void setFirstRate(Float firstRate) {
		FirstRate = firstRate;
	}
}
	