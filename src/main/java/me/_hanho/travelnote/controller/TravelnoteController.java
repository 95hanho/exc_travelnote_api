package me._hanho.travelnote.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import me._hanho.travelnote.model.Company;
import me._hanho.travelnote.model.Question;
import me._hanho.travelnote.model.Travelnote;
import me._hanho.travelnote.service.CompanyService;
import me._hanho.travelnote.service.FileService;
import me._hanho.travelnote.service.TravelnoteService;

@RestController
@RequestMapping("/api/v1/lecture")
public class TravelnoteController {
	
	private static final Logger logger = LoggerFactory.getLogger(TravelnoteController.class);
	
	@Autowired
	private TravelnoteService travelnoteService;
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private FileService fileService;

	@GetMapping("/list")
	public ResponseEntity<Map<String, Object>> getTravelnotes(@RequestParam("company_id") int company_id) {
		logger.info("getTravelnotes");
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<List<Travelnote>> list = new ArrayList<>();
		List<Travelnote> travel_list = travelnoteService.getTravelnotes(company_id);
		
		int week = 1;
		List<Travelnote> week_list = new ArrayList<>();
		for(int i = 0; i < travel_list.size(); i++) {
			Travelnote travelnote = travel_list.get(i);
			if(travelnote.getWeek() == week) {
				week_list.add(travelnote);
			} else {
				list.add(week_list);
				week_list = new ArrayList<>();
				week_list.add(travelnote);
				week++;
			}
			if(i == travel_list.size() - 1) {
				list.add(week_list);
			}
		}
		
		result.put("list", list);
		result.put("msg", "목록 조회 완료");
		result.put("response_code", 200);
		result.put("status", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@GetMapping("/detail/{id}")
	public ResponseEntity<Map<String, Object>> initTravelNote(@PathVariable("id") int id) {
		logger.info("initTravelNote");
		Map<String, Object> result = new HashMap<String, Object>();
		
		Travelnote travel = travelnoteService.getTravelnote(id);
		List<String> description_img_list = travelnoteService.getdescripImgs(id);
		Company company = companyService.getCompanyInfo(travel.getCompany_id());
		List<Question> question_info = travelnoteService.getQuestions(id);
		
		int question_count = 0;
		if(question_info != null) {
			question_count = question_info.size();
		}
		
		result.put("limit_value", company.getLimit_value());
		result.put("program_description", travel.getProgram_description());
		result.put("program_description_img", description_img_list);
		result.put("program_sub_title", travel.getSc_date());
		result.put("program_title", travel.getProgram_title());
		result.put("question_count", question_count);
		result.put("question_info", question_info);
		
		result.put("msg", "목록 조회 완료");
		result.put("response_code", 200);
		result.put("status", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@PostMapping("/content")
	public ResponseEntity<Map<String, Object>> saveTravel(@RequestParam(value="answer_text_data", required=false) String answer_text_data,
			@RequestParam("question_id") int question_id,
			@RequestParam("company_id") int company_id,
			@RequestParam(value="answer_img_data", required=false) MultipartFile file) {
		logger.info("saveTravel");
		Map<String, Object> result = new HashMap<String, Object>();

		if(answer_text_data != null) {
			travelnoteService.setQuestionText(answer_text_data, question_id);
		}
		if(file != null) {
			System.out.println(file);
			fileService.setQuestionFile(file, question_id);
		}
		
 		result.put("msg", "수정 완료");
		result.put("response_code", 200);
		result.put("status", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
}
