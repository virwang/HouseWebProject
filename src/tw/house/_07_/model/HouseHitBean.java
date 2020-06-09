package tw.house._07_.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "househit")
public class HouseHitBean {
	@Id @Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name="hid")
	private Integer hid;
	@Column(name="hit")
	private Integer hit;
	
	public HouseHitBean() {
		
	}

	public HouseHitBean(Integer id, Integer hid, Integer hit) {
		this.id = id;
		this.hid = hid;
		this.hit = hit;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getHid() {
		return hid;
	}

	public void setHid(Integer hid) {
		this.hid = hid;
	}

	public Integer getHit() {
		return hit;
	}

	public void setHit(Integer hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("HouseHitBean [id=");
		builder.append(id);
		builder.append(", hid=");
		builder.append(hid);
		builder.append(", hit=");
		builder.append(hit);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
	
}
