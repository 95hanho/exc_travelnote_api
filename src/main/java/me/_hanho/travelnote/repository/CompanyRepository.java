package me._hanho.travelnote.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me._hanho.travelnote.mapper.CompanyMapper;
import me._hanho.travelnote.model.Company;
import me._hanho.travelnote.model.Menu;

@Repository
public class CompanyRepository {
	
	@Autowired
	private CompanyMapper companyMapper;

	public Company getCompanyInfo(String company_url) {
		return companyMapper.getCompanyInfo(company_url);
	}

	public Company getCompanyInfo(int company_id) {
		return companyMapper.getCompanyInfo2(company_id);
	}

	public List<Menu> getMenus(int company_id) {
		return companyMapper.getMenus(company_id);
	}

}
