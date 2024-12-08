package me._hanho.travelnote.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import me._hanho.travelnote.model.UploadFile;

@Mapper
public interface FileMapper {

	ArrayList<UploadFile> getFiles(int question_id);

	void updateFile(UploadFile inFile);

	void createFile(UploadFile inFile);

}
