package tw.house._13_.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "TwoTaipei")
@Component
public class TwoTaipei {

	private Integer id;
	private String district;
	private String location;
	private Float landa_m;
	private Float landa_p;
	private String sdate;
	private String sbuild;
	private String tbuild;
	private String buildtype;
	private String fdate;
	private String farea_m;
	private Float farea_p;
	private Float tprice;
	private Float tprice_s;
	private String uprice_m;
	private Float uprice_p;
	private String rmnote;

	@Column(name = "id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "district")
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	
	@Column(name = "location")
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	@Column(name = "landa_m")
	public Float getLanda_m() {
		return landa_m;
	}
	public void setLanda_m(Float landa_m) {
		this.landa_m = landa_m;
	}
	
	@Column(name = "landa_p")
	public Float getLanda_p() {
		return landa_p;
	}
	public void setLanda_p(Float landa_p) {
		this.landa_p = landa_p;
	}
	
	@Column(name = "sdate")
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	
	@Column(name = "sbuild")
	public String getSbuild() {
		return sbuild;
	}
	public void setSbuild(String sbuild) {
		this.sbuild = sbuild;
	}
	
	@Column(name = "tbuild")
	public String getTbuild() {
		return tbuild;
	}
	public void setTbuild(String tbuild) {
		this.tbuild = tbuild;
	}
	
	@Column(name = "buildtype")
	public String getBuildtype() {
		return buildtype;
	}
	public void setBuildtype(String buildtype) {
		this.buildtype = buildtype;
	}
	
	@Column(name = "fdate")
	public String getFdate() {
		return fdate;
	}
	public void setFdate(String fdate) {
		this.fdate = fdate;
	}
	
	@Column(name = "farea_m")
	public String getFarea_m() {
		return farea_m;
	}
	public void setFarea_m(String farea_m) {
		this.farea_m = farea_m;
	}
	
	@Column(name = "farea_p")
	public Float getFarea_p() {
		return farea_p;
	}
	public void setFarea_p(Float farea_p) {
		this.farea_p = farea_p;
	}
	
	@Column(name = "tprice")
	public Float getTprice() {
		return tprice;
	}
	public void setTprice(Float tprice) {
		this.tprice = tprice;
	}
	
	@Column(name = "tprice_s")
	public Float getTprice_s() {
		return tprice_s;
	}
	public void setTprice_s(Float tprice_s) {
		this.tprice_s = tprice_s;
	}
	@Column(name = "uprice_m")
	public String getUprice_m() {
		return uprice_m;
	}
	public void setUprice_m(String uprice_m) {
		this.uprice_m = uprice_m;
	}
	
	@Column(name = "uprice_p")
	public Float getUprice_p() {
		return uprice_p;
	}
	public void setUprice_p(Float uprice_p) {
		this.uprice_p = uprice_p;
	}
	
	@Column(name = "rmnote")
	public String getRmnote() {
		return rmnote;
	}
	public void setRmnote(String rmnote) {
		this.rmnote = rmnote;
	}



	
//	public Taipei(ResultSet rs) throws SQLException {
//		setDistrict(rs.getString("district"));
//		setLocation(rs.getString("location"));
//		setTprice(rs.getFloat("tprice"));
//		setUprice(rs.getFloat("uprice"));
//		setUsing(rs.getString("using"));
//		setSquare(rs.getFloat("square"));
//		setParking(rs.getString("parking"));
//		setConstructor(rs.getString("constructor"));
//		setFdate(rs.getString("fdate"));
//	}

//	public Taipei(String district, String parking, String location, 
//			String using, String constructor, String fdate, 
//			float square, float tprice, float uprice ) {
//		super();
//		this.district = district;
//		this.tprice = tprice;
//		this.uprice = uprice;
//		this.location = location;
//		this.square = square;
//		this.parking = parking;
//		this.constructor = constructor;
//		this.using = using;
//		this.fdate = fdate;
//	}

//	@Override
//	public String toString() {
//		return "Taipei [location=" + location + ", tprice=" + tprice + ", uprice=" + uprice + ", using=" + using
//				+ ", square=" + square + ", parking=" + parking + ", constructor=" + constructor + ", fdate=" + fdate
//				+ ", district=" + district + "]";
//	}
//
//	

}
