package me._hanho.travelnote.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import me._hanho.travelnote.model.UploadFile;
import me._hanho.travelnote.service.ProgramService;

@RestController
@RequestMapping("/api/v1/program")
public class ProgramController {

	@Autowired
	ProgramService programService;
	
	@GetMapping("/{company_id}")
	public ResponseEntity<Map<String, Object>> getProgramImage(@PathVariable("company_id") int company_id) {
		System.out.println("getProgramImage");
		Map<String, Object> result = new HashMap<String, Object>();
		
		UploadFile uploadFile = programService.getProgramImage(company_id);

		result.put("data", uploadFile);
		result.put("status", "success");
		result.put("response_code", 200);
		result.put("msg", "조회 완료");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
}
