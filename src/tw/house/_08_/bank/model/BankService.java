package tw.house._08_.bank.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BankService {
	@Autowired
	BankDAO bankDao;
	public List<BankCodeBean> AllbankCode(){
		 return bankDao.AllbankCode();
	}
	public List<BankBean>SelectBranch(String bankCode) {
		return bankDao.SelectBranch(bankCode);
	}
	public BankBean searchBank(String branchCode) {
		return bankDao.searchBank(branchCode);
	}
}
