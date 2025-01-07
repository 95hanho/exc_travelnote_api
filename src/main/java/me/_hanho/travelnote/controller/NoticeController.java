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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import me._hanho.travelnote.model.Notice;
import me._hanho.travelnote.service.NoticeService;

@RestController
@RequestMapping("/api/v1/gonzi")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/list/{pageNum}")
	public ResponseEntity<Map<String, Object>> initNotice(@RequestParam("company_id") int company_id,
			@PathVariable("pageNum") int pageNum) {
		logger.info("initNotice");
		Map<String, Object> result = new HashMap<String, Object>();
		
		int size = 8;
		int notice_count = noticeService.getNoticeCount();
		int max_page = notice_count / size + 1;
		int offset = (pageNum - 1) * size;
		if(max_page >= pageNum) {
			List<Notice> list = noticeService.getNotices(size, offset, company_id);
			
			result.put("list", list);
			result.put("msg", "목록 조회 완료");
			result.put("record", list.size());
			result.put("response_code", 200);
			result.put("status", "success");
			result.put("this_page", pageNum + "");
			result.put("total_record", notice_count);
			return new ResponseEntity<>(result, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(result, HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping("/detail/{nId}")
	public ResponseEntity<Map<String, Object>> initNoticeDetail(@RequestParam("company_id") int company_id,
			@PathVariable("nId") int nId) {
		logger.info("initNoticeDetail");
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<Notice> list = noticeService.getNoticeAndPrevNext(nId, company_id);

		Notice curNotice = null;
		Notice nextNotice = null;
		Notice prevNotice = null;
		
		if(list.size() == 3) {
			prevNotice = list.get(0);
			curNotice = list.get(1);
			nextNotice = list.get(2);
		} else if(list.size() > 1) {
			if(list.get(0).getId() == nId) {
				curNotice = list.get(0);
				nextNotice = list.get(1);
			} else if (list.get(1).getId() == nId) {
				prevNotice = list.get(0);
				curNotice = list.get(1);
			}
		} else {
			curNotice = list.get(0);
		}
		
		result.put("id", curNotice.getId());
		result.put("title", curNotice.getTitle());
		result.put("content", curNotice.getContent());
		result.put("date", curNotice.getDate());
		result.put("msg", "조회 완료");
		result.put("nextInfo", nextNotice);
		result.put("prevInfo", prevNotice);
		result.put("response_code", 200);
		result.put("status", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
}
