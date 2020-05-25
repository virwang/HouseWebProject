package tw.house._05_.model;

public class FavoriteImgBean {
	FavoriteBean favBean;
	String imgData;

	public FavoriteImgBean() {

	}

	public FavoriteImgBean(FavoriteBean favBean, String imgData) {
		this.favBean = favBean;
		this.imgData = imgData;
	}

	public FavoriteBean getFavBean() {
		return favBean;
	}

	public void setFavBean(FavoriteBean favBean) {
		this.favBean = favBean;
	}

	public String getImgData() {
		return imgData;
	}

	public void setImgData(String imgData) {
		this.imgData = imgData;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("HouseImgBean [favbean= ");
		builder.append(favBean);
		builder.append(", imgData=");
		builder.append(imgData);
		builder.append("]");
		System.out.println("house img bean =" + favBean + "-" + imgData);
		return builder.toString();
	}

}
