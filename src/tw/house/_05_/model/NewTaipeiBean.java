package tw.house._05_.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
//import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Component("newTaipei")
@Entity
@Table(name = "NewTaipei")
public class NewTaipeiBean
{
	
	private Integer Id;
	private String district;
	private String location;
	private Integer tprice;
	private Float uprice;
	private String using;
	private Float square;
	private String parking;
	private String constructor;
	private Integer fdate;

	public NewTaipeiBean()
	{
		
	}
	
	@Id	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getNtpId()
	{
		return Id;
	}

	public void setNtpId(Integer Id)
	{
		this.Id = Id;
	}


	@Column(name = "district")
	public String getDistrict()
	{
		return district;
	}

	public void setDistrict(String district)
	{
		this.district = district;
	}

	@Column(name = "location")
	public String getLocation()
	{
		return location;
	}

	public void setLocation(String location)
	{
		this.location = location;
	}

	@Column(name = "tprice")
	public Integer getTprice()
	{
		return tprice;
	}

	public void setTprice(Integer tprice)
	{
		this.tprice = tprice;
	}

	@Column(name = "uprice")
	public Float getUprice()
	{
		return uprice;
	}

	public void setUprice(Float uprice)
	{
		this.uprice = uprice;
	}

	@Column(name = "using")
	public String getUsing()
	{
		return using;
	}

	public void setUsing(String using)
	{
		this.using = using;
	}

	@Column(name = "square")
	public Float getSquare()
	{
		return square;
	}

	public void setSquare(Float square)
	{
		this.square = square;
	}

	@Column(name = "parking")
	public String getParking()
	{
		return parking;
	}

	public void setParking(String parking)
	{
		this.parking = parking;
	}

	@Column(name = "constructor")
	public String getConstructor()
	{
		return constructor;
	}

	public void setConstructor(String constructor)
	{
		this.constructor = constructor;
	}

	@Column(name = "fdate")
	public Integer getFdate()
	{
		return fdate;
	}

	public void setFdate(Integer fdate)
	{
		this.fdate = fdate;
	}

	@Transient
	@Override
	public String toString() {
	//	district = new List();List 
		System.out.print("district length:"+district.length());	

		return "NewTaipeiBean [getNtpId()=" + getNtpId() + ", getDistrict()="
				+ getDistrict() + ", getLocation()=" + getLocation() + ", getTprice()=" + getTprice() + ", getUprice()="
				+ getUprice() + ", getUsing()=" + getUsing() + ", getParking()="
				+ getParking() + ", getConstructor()=" + getConstructor() + ", getFdate()=" + getFdate() + "]";
	}

}
