package me._hanho.travelnote.service;

import java.util.List;

import me._hanho.travelnote.model.Schedule;

public interface ReflectionService {

	List<Schedule> getReflections(int company_id);

	void setReflection(Schedule reflection);

}
