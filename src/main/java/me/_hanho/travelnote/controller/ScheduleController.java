package me._hanho.travelnote.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/schedule")
public class ScheduleController {

	
	@GetMapping("/list")
	public ResponseEntity<Map<String, Object>> initSchedule(@RequestParam("company_id") int company_id) {
		System.out.println("initSchedule");
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
}
