package tw.house._13_.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Favorite_test")
@Component
public class Favorite_test {

	private Integer fav_id;
	private Integer mem_id;
	private Integer house_id;
	
	@Column(name = "fav_id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getFav_id() {
		return fav_id;
	}
	public void setFav_id(Integer fav_id) {
		this.fav_id = fav_id;
	}
	
	@Column(name = "mem_id")
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	
	@Column(name = "house_id")
	public Integer getHouse_id() {
		return house_id;
	}
	public void setHouse_id(Integer house_id) {
		this.house_id = house_id;
	}

}
