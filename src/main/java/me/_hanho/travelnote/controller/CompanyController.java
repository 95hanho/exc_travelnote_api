package me._hanho.travelnote.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import me._hanho.travelnote.model.Company;
import me._hanho.travelnote.model.Menu;
import me._hanho.travelnote.service.CompanyService;

@RestController
@RequestMapping("/api/v1/company")
public class CompanyController {
	
	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	@Autowired
	private CompanyService companyService;
	
	@GetMapping("/{company_url}")
	public ResponseEntity<Map<String, Object>> initLogin(@PathVariable("company_url") String company_url) {
		logger.info("initLogin");
		Map<String, Object> result = new HashMap<String, Object>();
		
		Company companyInfo = companyService.getCompanyInfo(company_url);
		
		result.put("data", companyInfo);
		result.put("status", "success");
		result.put("response_code", 200);
		result.put("msg", "조회 완료");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@GetMapping("/menu/{company_id}")
	public ResponseEntity<Map<String, Object>> initMenu(@PathVariable("company_id") int company_id) {
		logger.info("initLogin");
		Map<String, Object> result = new HashMap<String, Object>();
		
		Company companyInfo = companyService.getCompanyInfo(company_id);
		
		List<Menu> menu_list = companyService.getMenus(company_id);
		
		result.put("custom_top_title_bold", companyInfo.getCustom_top_title_bold());
		result.put("custom_top_title_plain", companyInfo.getCustom_top_title_plain());
		result.put("menu_list", menu_list);
		result.put("status", "success");
		result.put("response_code", 200);
		result.put("msg", "조회 완료");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
}
