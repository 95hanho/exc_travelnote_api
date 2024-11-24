package me._hanho.travelnote.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/vi")
public class Controller {

	@GetMapping("/company/{company_url}")
	public ResponseEntity<Map<String, Object>> initLogin(@PathVariable("company_url") String company_url) {
		System.out.println("initLogin");
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
}
