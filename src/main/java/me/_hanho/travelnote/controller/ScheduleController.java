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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import me._hanho.travelnote.model.Company;
import me._hanho.travelnote.model.Schedule;
import me._hanho.travelnote.service.CompanyService;
import me._hanho.travelnote.service.ScheduleService;

@RestController
@RequestMapping("/api/v1/schedule")
public class ScheduleController {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private ScheduleService scheduleService;

	
	@GetMapping("/list")
	public ResponseEntity<Map<String, Object>> initSchedule(@RequestParam("company_id") int company_id) {
		logger.info("initSchedule");
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<Schedule> list =  scheduleService.getSchedules(company_id);
				
		Company cur_company = companyService.getCompanyInfo(company_id);

		result.put("list", list);
		result.put("msg", "목록 조회 완료");
		result.put("list_title", cur_company.getList_title());
		result.put("response_code", 200);
		result.put("status", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
}
