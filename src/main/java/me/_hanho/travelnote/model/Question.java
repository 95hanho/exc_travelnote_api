package me._hanho.travelnote.model;

public class Question {

	private int id;
	private String title;
	private String type;
	private String contents;
	private int lecture_idx;
	
	private Answer answer;
	
	public Question() {
	}

	public Question(int id, String title, String type, String contents, int lecture_idx) {
		super();
		this.id = id;
		this.title = title;
		this.type = type;
		this.contents = contents;
		this.lecture_idx = lecture_idx;
	}
	
	public Question(int id, String title, String type, String contents, int lecture_idx, Answer answer) {
		super();
		this.id = id;
		this.title = title;
		this.type = type;
		this.contents = contents;
		this.lecture_idx = lecture_idx;
		this.answer = answer;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getLecture_idx() {
		return lecture_idx;
	}

	public void setLecture_idx(int lecture_idx) {
		this.lecture_idx = lecture_idx;
	}
	
	public Answer getAnswer() {
		return answer;
	}

	public void setAnswer(Answer answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", title=" + title + ", type=" + type + ", contents=" + contents
				+ ", lecture_idx=" + lecture_idx + ", answer=" + answer + "]";
	}

}
