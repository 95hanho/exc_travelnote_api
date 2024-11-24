package me._hanho.travelnote.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import me._hanho.travelnote.model.User;

@RestController
@RequestMapping("/api/v1/auth")
public class UserController {
	
	
	@PostMapping("/login")
	public ResponseEntity<Map<String, Object>> login(@ModelAttribute User user) {
		System.out.println("login");
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("msg", "success");
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@GetMapping("/lost/pw")
	public ResponseEntity<Map<String, Object>> pwdSend(@RequestParam("target") String target,
			@RequestParam("company_id") String company_id) {
		System.out.println("pwdSend");
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("msg", "success");
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@PutMapping("/lost/pw")
	public ResponseEntity<Map<String, Object>> pwdChange(@RequestParam("id") String id,
			@RequestParam("plain_password") String plain_password, @RequestParam("company_id") String company_id) {
		System.out.println("pwdChange");
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("msg", "success");
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
}
