package me._hanho.travelnote.service;

import java.util.List;

import me._hanho.travelnote.model.Company;
import me._hanho.travelnote.model.Menu;

public interface CompanyService {

	Company getCompanyInfo(String company_url);

	Company getCompanyInfo(int company_id);

	List<Menu> getMenus(int company_id);

}
