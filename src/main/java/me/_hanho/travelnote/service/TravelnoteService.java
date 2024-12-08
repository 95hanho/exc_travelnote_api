package me._hanho.travelnote.service;

import java.util.List;

import me._hanho.travelnote.model.Question;
import me._hanho.travelnote.model.Travelnote;

public interface TravelnoteService {

	List<Travelnote> getTravelnotes(int company_id);

	Travelnote getTravelnote(int id);
	
	List<Question> getQuestions(int id);

	List<String> getdescripImgs(int id);

	void setQuestionText(String answer_text_data, int question_id);


}
