package tw.house._07_.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationDAO reservationDAO;
	
	public List<ReservationBean> applicantlist(Integer aplm){
		return reservationDAO.applicantlist(aplm);
	}
	
	public List<ReservationBean> recipientlist(Integer rcpm){
		return reservationDAO.recipientlist(rcpm);
	}
	
	public boolean insertapplication(ReservationBean rBean) {
		return reservationDAO.insertapplication(rBean);
	}
	
	public boolean deleteReservationByHouseId(Integer hid) {
		return reservationDAO.deleteReservationByHouseId(hid);
	}
	public boolean updateresv(Integer rid,String status) {
		return reservationDAO.updateresv(rid, status);
	}
	
}
