package me._hanho.travelnote.mapper;

import org.apache.ibatis.annotations.Mapper;

import me._hanho.travelnote.model.UploadFile;

@Mapper
public interface ProgramMapper {

	UploadFile getProgramImage(int company_id);

}
