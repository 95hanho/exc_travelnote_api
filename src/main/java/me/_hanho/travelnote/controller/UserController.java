package me._hanho.travelnote.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.HttpServletRequest;
import me._hanho.travelnote.model.Token;
import me._hanho.travelnote.model.User;
import me._hanho.travelnote.service.TokenService;
import me._hanho.travelnote.service.UserService;

@RestController
@RequestMapping("/api/v1/auth")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private TokenService tokenService;
	
	@PostMapping("/login")
	public ResponseEntity<Map<String, Object>> login(@ModelAttribute User user, @RequestHeader("user-agent") String agent
			, HttpServletRequest request) {
		logger.info("login");
		Map<String, Object> result = new HashMap<String, Object>();

		User checkUser = userService.getUser(user);
		if(checkUser != null) {
			User onlyId = new User();
			onlyId.setMember_id(checkUser.getMember_id());
			String accessToken = tokenService.makeJwtToken(63L, onlyId);
			String refreshToken = tokenService.makeJwtToken(183L);
			String ipAddress = request.getRemoteAddr();
			Token token = new Token(refreshToken, agent, ipAddress, checkUser.getMember_id());
			Token checkToken = userService.getToken(token);
			int result_count = 0;
			if(checkToken == null) {
				result_count = userService.insertToken(token);
			} else {
				try {
					tokenService.parseJwtToken(checkToken.getRefresh_token());
					result_count = userService.updateToken(token);
				} catch (Exception e) {
					result_count = userService.insertToken(token);
				}
			}

			result.put("msg", "로그인");
			result.put("status", "success");
			result.put("response_code", 200);
			result.put("access_token", accessToken);
			result.put("refresh_token", refreshToken);
			return new ResponseEntity<>(
					result
					, HttpStatus.OK);
		} else {
			result.put("msg", "입력하신 아이디 또는 비밀번호가 일치하지 않습니다");
			result.put("response_code", 430);
			result.put("status", "success");
			return new ResponseEntity<>(
					result
					, HttpStatus.OK);
		}
	}
	
	@PostMapping("/re-generator/refresh/token")
	public ResponseEntity<Map<String, Object>> reToken(@RequestParam("refresh_token") String refresh_token,
			HttpServletRequest request, @RequestHeader("user-agent") String agent) {
		logger.info("reToken " + refresh_token);
		Map<String, Object> result = new HashMap<String, Object>();
		
		Claims claims = null;
		try {
			claims = tokenService.parseJwtToken(refresh_token);
		} catch (Exception e) {
			result.put("msg", "token제대로 안됨");
			return new ResponseEntity<>(result, HttpStatus.UNAUTHORIZED);
		}
		
		if(claims != null) {
			String ipAddress = request.getRemoteAddr();
			Token token = new Token(refresh_token, agent, ipAddress);
			User checkUser = userService.getUser(token);
			
			if(checkUser != null) {
				User onlyId = new User();
				onlyId.setMember_id(checkUser.getMember_id());
				String accessToken = tokenService.makeJwtToken(63L, onlyId);
				String refreshToken = tokenService.makeJwtToken(183L);
				Token token2 = new Token(refreshToken, agent, ipAddress, checkUser.getMember_id());
				int result_count = userService.updateToken(token2);
				
				result.put("msg", "access 토큰 재발급 성공");
				result.put("access_token", accessToken);
				result.put("refresh_token", refreshToken);
				result.put("response_code", 200);
				result.put("status", "success");
				return new ResponseEntity<>(result, HttpStatus.OK);
			} else {
				result.put("msg", "token제대로 안됨");
				return new ResponseEntity<>(result, HttpStatus.UNAUTHORIZED);
			}
		} else {
			result.put("msg", "token제대로 안됨");
			return new ResponseEntity<>(result, HttpStatus.UNAUTHORIZED);
		}
	}
	
	@GetMapping("/lost/pw")
	public ResponseEntity<Map<String, Object>> pwdSend(@RequestParam("target") String target,
			@RequestParam("company_id") String company_id) {
		logger.info("pwdSend");
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("msg", "success");
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@PutMapping("/lost/pw")
	public ResponseEntity<Map<String, Object>> pwdChange(@RequestParam("id") String id,
			@RequestParam("plain_password") String plain_password, @RequestParam("company_id") String company_id) {
		logger.info("pwdChange");
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("msg", "success");
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
}
