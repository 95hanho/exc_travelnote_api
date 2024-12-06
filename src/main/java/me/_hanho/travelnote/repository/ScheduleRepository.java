package me._hanho.travelnote.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me._hanho.travelnote.mapper.ScheduleMapper;
import me._hanho.travelnote.model.Schedule;

@Repository
public class ScheduleRepository {

	@Autowired
	private ScheduleMapper scheduleMapper;
	
	public List<Schedule> getSchedules(int company_id) {
		return scheduleMapper.getSchedules(company_id);
	}

}
