package me._hanho.travelnote.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import me._hanho.travelnote.model.Reflection;

@RestController
@RequestMapping("/api/v1/reflection")
public class ReflectionController {

	@GetMapping("/list")
	public ResponseEntity<Map<String, Object>> initReflection(@PathVariable("company_id") int company_id) {
		System.out.println("initReflection");
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@PostMapping("/reflection/content")
	public ResponseEntity<Map<String, Object>> saveReflect(@ModelAttribute Reflection reflection) {
		System.out.println("saveReflect");
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
}
