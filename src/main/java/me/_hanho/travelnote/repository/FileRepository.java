package me._hanho.travelnote.repository;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me._hanho.travelnote.mapper.FileMapper;
import me._hanho.travelnote.model.UploadFile;

@Repository
public class FileRepository {
	
	@Autowired
	private FileMapper fileMapper;

	public ArrayList<UploadFile> getFiles(int question_id) {
		return fileMapper.getFiles(question_id);
	}

	public void updateFile(UploadFile inFile) {
		 fileMapper.updateFile(inFile);
	}

	public void createFile(UploadFile inFile) {
		fileMapper.createFile(inFile);
	}

}
