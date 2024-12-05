package me._hanho.travelnote.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me._hanho.travelnote.mapper.NoticeMapper;
import me._hanho.travelnote.model.Notice;

@Repository
public class NoticeRepository {
	
	@Autowired
	private NoticeMapper noticeMapper;

	public int getNoticeCount() {
		return noticeMapper.getNoticeCount();
	}

	public List<Notice> getNotices(int size, int offset, int company_id) {
		return noticeMapper.getNotices(size, offset, company_id);
	}

	public List<Notice> getNoticeAndPrevNext(int nId, int company_id) {
		return noticeMapper.getNoticeAndPrevNext(nId, company_id);
	}

	
}
