package tw.house._13_.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.house._13_.model.bean.HouseLoanList;
import tw.house._13_.model.dao.HouseLoanListDAO;


@Service
public class HouseLoanListService implements HouseLoanListIplService {

	HouseLoanListDAO hLLDAO;
	
	@Autowired
	public void setASTTDao(HouseLoanListDAO hLLDAO) {
		this.hLLDAO = hLLDAO;
	}


	@Override
	public List<HouseLoanList> ShowHouseLoanList() {
		return hLLDAO.ShowHouseLoanList();
	}

}

 