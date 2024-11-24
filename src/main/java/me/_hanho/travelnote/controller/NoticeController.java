package me._hanho.travelnote.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/gonzi")
public class NoticeController {

	
	@GetMapping("/list/{pageNum}")
	public ResponseEntity<Map<String, Object>> initNotice(@RequestParam("company_id") int company_id,
			@PathVariable("pageNum") int pageNum) {
		System.out.println("initNotice");
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@GetMapping("/detail/{nId}")
	public ResponseEntity<Map<String, Object>> initNoticeDetail(@RequestParam("company_id") int company_id,
			@PathVariable("nId") int nId) {
		System.out.println("initNoticeDetail");
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
}
