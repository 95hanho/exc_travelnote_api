package me._hanho.travelnote.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import me._hanho.travelnote.model.Schedule;

@Mapper
public interface ReflectionMapper {

	List<Schedule> getReflections(int company_id);

	void setReflection(Schedule reflection);

}
