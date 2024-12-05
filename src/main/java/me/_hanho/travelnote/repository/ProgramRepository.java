package me._hanho.travelnote.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me._hanho.travelnote.mapper.ProgramMapper;
import me._hanho.travelnote.model.UploadFile;

@Repository
public class ProgramRepository {
	
	@Autowired
	private ProgramMapper programMapper;

	public UploadFile getProgramImage(int company_id) {
		System.out.println(programMapper.getProgramImage(company_id));
		return programMapper.getProgramImage(company_id);
	}

}
