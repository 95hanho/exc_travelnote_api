package me._hanho.travelnote.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me._hanho.travelnote.model.Schedule;
import me._hanho.travelnote.repository.ScheduleRepository;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleRepository scheduleDAO;
	
	@Override
	public List<Schedule> getSchedules(int company_id) {
		return scheduleDAO.getSchedules(company_id);
	}

	
}
