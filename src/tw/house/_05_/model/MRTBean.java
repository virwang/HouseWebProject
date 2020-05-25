package tw.house._05_.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "MRT")

public class MRTBean {

	private String Id;
	private String station;
	private String lineId;
	private String line;
	private String addr;

	@Id
	@Column(name = "id")
	public String getId() {
		return Id;
	}

	@Column(name = "station")
	public String getStation() {
		return station;
	}

	@Column(name = "lineId")
	public String getLineId() {
		return lineId;
	}

	@Column(name = "line")
	public String getLine() {
		return line;
	}

	@Column(name = "addr")
	public String getAddr() {
		return addr;
	}

	public void setId(String id) {
		Id = id;
	}

	public void setStation(String station) {
		this.station = station;
	}

	public void setLineId(String lineId) {
		this.lineId = lineId;
	}

	public void setLine(String line) {
		this.line = line;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	@Transient
	@Override
	public String toString() {
		return "MRTBean [Id=" + Id + ", station=" + station + ", lineId=" + lineId + ", line=" + line + ", addr=" + addr
				+ "]";
	}
	
	
}
