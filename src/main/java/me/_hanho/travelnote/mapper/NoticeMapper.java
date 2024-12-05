package me._hanho.travelnote.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import me._hanho.travelnote.model.Notice;

@Mapper
public interface NoticeMapper {

	int getNoticeCount();

	List<Notice> getNotices(@Param("size") int size, @Param("offset") int offset, 
			@Param("company_id") int company_id);

	List<Notice> getNoticeAndPrevNext(@Param("nId") int nId, @Param("company_id") int company_id);

}
