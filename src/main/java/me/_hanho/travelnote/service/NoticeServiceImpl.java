package me._hanho.travelnote.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me._hanho.travelnote.model.Notice;
import me._hanho.travelnote.repository.NoticeRepository;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeRepository NoticeDAO;
	
	@Override
	public int getNoticeCount() {
		return NoticeDAO.getNoticeCount();
	}

	@Override
	public List<Notice> getNotices(int size, int offset, int company_id) {
		return NoticeDAO.getNotices(size, offset, company_id);
	}

	@Override
	public List<Notice> getNoticeAndPrevNext(int nId, int company_id) {
		return NoticeDAO.getNoticeAndPrevNext(nId, company_id);
	}

}
