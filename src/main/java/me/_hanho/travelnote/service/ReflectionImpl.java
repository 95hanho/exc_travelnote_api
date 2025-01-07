package me._hanho.travelnote.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me._hanho.travelnote.model.Schedule;
import me._hanho.travelnote.repository.ReflectionRepository;

@Service
public class ReflectionImpl implements ReflectionService {

	@Autowired
	private ReflectionRepository reflectionDAO;
	
	@Override
	public List<Schedule> getReflections(int company_id) {
		return reflectionDAO.getReflections(company_id);
	}

	@Override
	public void setReflection(Schedule reflection) {
		reflectionDAO.setReflection(reflection);
	}

}
