package tw.house._07_.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("mrtService")
public class MrtService {
	@Autowired
	private MrtDAO mrtDAO;
	
	public List<MrtBean> mrtlist(){
		return mrtDAO.mrtlist();
	}
	public List<MrtBean> mrtlinepoint(String line){
		return mrtDAO.mrtlinepoint(line);
	}
	public MrtBean selectedStaion(Integer station) {
		return mrtDAO.selectedStaion(station);
	}
	
}
