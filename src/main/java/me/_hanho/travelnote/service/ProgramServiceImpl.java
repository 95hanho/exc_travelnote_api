package me._hanho.travelnote.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me._hanho.travelnote.model.UploadFile;
import me._hanho.travelnote.repository.ProgramRepository;

@Service
public class ProgramServiceImpl implements ProgramService {
	
	@Autowired
	private ProgramRepository programDAO;

	@Override
	public UploadFile getProgramImage(int company_id) {
		return programDAO.getProgramImage(company_id);
	}

}
