package me._hanho.travelnote.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me._hanho.travelnote.model.Company;
import me._hanho.travelnote.model.Menu;
import me._hanho.travelnote.repository.CompanyRepository;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompanyRepository companyDAO;

	@Override
	public Company getCompanyInfo(String company_url) {
		return companyDAO.getCompanyInfo(company_url);
	}

	@Override
	public Company getCompanyInfo(int company_id) {
		return companyDAO.getCompanyInfo(company_id);
	}

	@Override
	public List<Menu> getMenus(int company_id) {
		return companyDAO.getMenus(company_id);
	}

}
