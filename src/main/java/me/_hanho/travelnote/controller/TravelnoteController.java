package me._hanho.travelnote.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import me._hanho.travelnote.model.Travelnote;

@RestController
@RequestMapping("/api/v1/lecture")
public class TravelnoteController {

	@GetMapping("/detail/{id}")
	public ResponseEntity<Map<String, Object>> initTravelNote(@RequestParam("id") int id) {
		System.out.println("initTravelNote");
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@PostMapping("/content")
	public ResponseEntity<Map<String, Object>> saveTravel(@ModelAttribute Travelnote travelnote,
			@RequestParam(value="answer_img_data", required=false) MultipartFile file) {
		System.out.println("saveTravel");
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
}
