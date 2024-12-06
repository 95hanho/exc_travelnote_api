package me._hanho.travelnote.service;

import java.util.List;

import me._hanho.travelnote.model.Schedule;

public interface ScheduleService {

	List<Schedule> getSchedules(int company_id);

}
