package tw.house._13_.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Taipei")
@Component
public class Taipei {

	private Integer id;
	private String location;
	private Float tprice;
	private Float uprice;
	private String using;
	private Float square;
	private String parking;
	private String constructor;
	private String fdate;
	private String district;


	@Column(name = "id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(int id) {
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

	@Column(name = "tprice")
	public Float getTprice() {
		return tprice;
	}

	public void setTprice(float tprice) {
		this.tprice = tprice;
	}

	@Column(name = "uprice")
	public Float getUprice() {
		return uprice;
	}

	public void setUprice(float uprice) {
		this.uprice = uprice;
	}

	@Column(name = "using")
	public String getUsing() {
		return using;
	}

	public void setUsing(String using) {
		this.using = using;
	}

	@Column(name = "square")
	public Float getSquare() {
		return square;
	}

	public void setSquare(float square) {
		this.square = square;
	}

	@Column(name = "parking")
	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	@Column(name = "constructor")
	public String getConstructor() {
		return constructor;
	}

	public void setConstructor(String constructor) {
		this.constructor = constructor;
	}

	@Column(name = "fdate")
	public String getFdate() {
		return fdate;
	}

	public void setFdate(String fdate) {
		this.fdate = fdate;
	}


	
//	
//	public Taipei(String idistrict) {
//		this.district = idistrict;
//	}
	
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
