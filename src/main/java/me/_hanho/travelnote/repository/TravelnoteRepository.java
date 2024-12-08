package me._hanho.travelnote.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me._hanho.travelnote.mapper.TravelnoteMapper;
import me._hanho.travelnote.model.Answer;
import me._hanho.travelnote.model.Question;
import me._hanho.travelnote.model.Travelnote;

@Repository
public class TravelnoteRepository {
	
	@Autowired
	private TravelnoteMapper travelnoteMapper;

	public List<Travelnote> getTravelnotes(int company_id) {
		return travelnoteMapper.getTravelnotes(company_id);
	}
	
	public Travelnote getTravelnote(int id) {
		return travelnoteMapper.getTravelnote(id);
	}


	public List<Question> getQuestions(int id) {
		List<Question> q_list = travelnoteMapper.getQuestions(id);
		for(Question q : q_list) {
			if(q.getType().equals("TEXT")) {
				String content = "";
				if(q.getContents() != null) {
					content = q.getContents();
				}
				q.setAnswer(new Answer(content));
			} else if(q.getType().equals("IMG")) {
				String filepath = travelnoteMapper.getAnswerFilepath(q.getId());
				q.setAnswer(new Answer(filepath));
			}
		}
		return q_list; 
	}

	public List<String> getdescripImgs(int id) {
		return travelnoteMapper.getdescripImgs(id);
	}

	public void setQuestionText(String answer_text_data, int question_id) {
		travelnoteMapper.setQuestionText(answer_text_data, question_id);
	}

	
}
