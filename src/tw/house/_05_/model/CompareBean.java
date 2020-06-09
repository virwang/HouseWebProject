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

@Component("Compare")
@Entity
@Table(name = "compare")
public class CompareBean {

	@Id
	@Column(name = "cpk")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cpk;
	
	@OneToOne
	@JoinColumn(name = "id")
	private HouseBean houseBean;

	public CompareBean compare() {
		return null;
	}

	public Integer getCpk() {
		return cpk;
	}

	public void setCpk(Integer cpk) {
		this.cpk = cpk;
	}

	public HouseBean getHouseBean() {
		return houseBean;
	}

	public void setHouseBean(HouseBean houseBean) {
		this.houseBean = houseBean;
	}

	@Transient
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CompareBean [cpk=");
		builder.append(cpk);
		builder.append(", houseBean=");
		builder.append(houseBean);
		builder.append("]");
		return builder.toString();
	}

}
