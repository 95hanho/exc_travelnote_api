package me._hanho.travelnote.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me._hanho.travelnote.mapper.ReflectionMapper;
import me._hanho.travelnote.model.Schedule;

@Repository
public class ReflectionRepository {

	@Autowired
	private ReflectionMapper reflectionMapper;
	
	public List<Schedule> getReflections(int company_id) {
		return reflectionMapper.getReflections(company_id);
	}

	public void setReflection(Schedule reflection) {
		reflectionMapper.setReflection(reflection);
	}

}
