package me._hanho.travelnote.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me._hanho.travelnote.model.Question;
import me._hanho.travelnote.model.Travelnote;
import me._hanho.travelnote.repository.TravelnoteRepository;

@Service
public class TravelnoteImpl implements TravelnoteService {

	@Autowired
	private TravelnoteRepository travelnoteDAO;
	
	@Override
	public List<Travelnote> getTravelnotes(int company_id) {
		return travelnoteDAO.getTravelnotes(company_id);
	}
	
	@Override
	public Travelnote getTravelnote(int id) {
		return travelnoteDAO.getTravelnote(id);
	}

	@Override
	public List<Question> getQuestions(int id) {
		return travelnoteDAO.getQuestions(id);
	}

	@Override
	public List<String> getdescripImgs(int id) {
		return travelnoteDAO.getdescripImgs(id);
	}

	@Override
	public void setQuestionText(String answer_text_data, int question_id) {
		travelnoteDAO.setQuestionText(answer_text_data, question_id);
	}


	
}
