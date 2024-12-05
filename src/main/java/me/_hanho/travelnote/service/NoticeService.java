package me._hanho.travelnote.service;

import java.util.List;

import me._hanho.travelnote.model.Notice;

public interface NoticeService {

	int getNoticeCount();

	List<Notice> getNotices(int size, int offset, int company_id);

	List<Notice> getNoticeAndPrevNext(int nId, int company_id);

}
