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
@Table(name = "Mrt")
public class MrtBean {
	private Integer pk;
	private String stationcode;
	private String stationname;
	private String linecode;
	private String linename;
	private String mrtaddr;
	private String lat;
	private String lon;
	
	public MrtBean() {
		
	}

	public MrtBean(Integer pk, String stationcode, String stationname, String linecode, String linename,
			String mrtaddr, String lat, String lon) {
		this.pk = pk;
		this.stationcode = stationcode;
		this.stationname = stationname;
		this.linecode = linecode;
		this.linename = linename;
		this.mrtaddr = mrtaddr;
		this.lat = lat;
		this.lon = lon;
	}
	
	@Id @Column(name="pk")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getPk() {
		return pk;
	}

	public void setPk(Integer pk) {
		this.pk = pk;
	}
	@Column(name="stationcode")
	public String getStationcode() {
		return stationcode;
	}

	public void setStationcode(String stationcode) {
		this.stationcode = stationcode;
	}
	@Column(name="stationname")
	public String getStationname() {
		return stationname;
	}

	public void setStationname(String stationname) {
		this.stationname = stationname;
	}
	@Column(name="linecode")
	public String getLinecode() {
		return linecode;
	}

	public void setLinecode(String linecode) {
		this.linecode = linecode;
	}
	@Column(name="linename")
	public String getLinename() {
		return linename;
	}

	public void setLinename(String linename) {
		this.linename = linename;
	}
	@Column(name="addr")
	public String getMrtaddr() {
		return mrtaddr;
	}

	public void setMrtaddr(String mrtaddr) {
		this.mrtaddr = mrtaddr;
	}
	@Column(name="lat")
	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}
	@Column(name="lon")
	public String getLon() {
		return lon;
	}

	public void setLon(String lon) {
		this.lon = lon;
	}
	
	
	
	
	
	
	
	
}
