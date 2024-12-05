package me._hanho.travelnote.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import me._hanho.travelnote.model.Company;
import me._hanho.travelnote.model.Menu;

@Mapper
public interface CompanyMapper {

	Company getCompanyInfo(String company_url);

	Company getCompanyInfo2(int company_id);

	List<Menu> getMenus(int company_id);

}
