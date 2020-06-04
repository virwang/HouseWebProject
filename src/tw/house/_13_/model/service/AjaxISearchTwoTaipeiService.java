package tw.house._13_.model.service;



public interface AjaxISearchTwoTaipeiService {

	//用年份抓表格長度
	public long SearchTwoTaipeiYear (String district, String sdate,String location);
	
	//用模糊字串抓再算平均單價
	public long selectTwoTaipeiDistrict (String district, String sdate,String location);

}
