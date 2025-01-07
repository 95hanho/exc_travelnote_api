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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import me._hanho.travelnote.model.Company;
import me._hanho.travelnote.model.Schedule;
import me._hanho.travelnote.service.CompanyService;
import me._hanho.travelnote.service.ReflectionService;

@RestController
@RequestMapping("/api/v1/reflection")
public class ReflectionController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReflectionController.class);
	
	@Autowired
	private ReflectionService reflectionService;
	
	@Autowired
	private CompanyService companyService;

	@GetMapping("/list")
	public ResponseEntity<Map<String, Object>> initReflection(@RequestParam("company_id") int company_id) {
		logger.info("initReflection");
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<Schedule> list = reflectionService.getReflections(company_id);
		
		Company company = companyService.getCompanyInfo(company_id);

		result.put("list", list);
		result.put("reflection_title", company.getReflection_title());
		result.put("msg", "목록 조회 완료");
		result.put("response_code", 200);
		result.put("status", "success");
		result.put("today_info", false);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@PostMapping("/content")
	public ResponseEntity<Map<String, Object>> saveReflect(@ModelAttribute Schedule reflection) {
		logger.info("saveReflect");
		Map<String, Object> result = new HashMap<String, Object>();
		
		reflectionService.setReflection(reflection);

		result.put("msg", "작성/수정 완료");
		result.put("response_code", 200);
		result.put("status", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
}
