package me._hanho.travelnote.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import me._hanho.travelnote.model.Question;
import me._hanho.travelnote.model.Travelnote;

@Mapper
public interface TravelnoteMapper {

	List<Travelnote> getTravelnotes(int company_id);
	
	Travelnote getTravelnote(int id);

	List<Question> getQuestions(int id);

	List<String> getdescripImgs(int id);

	String getAnswerFilepath(int id);

}
