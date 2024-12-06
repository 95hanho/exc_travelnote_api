package me._hanho.travelnote.model;

public class Answer {

	private String contents;
	private String type;
	
	public Answer() {
		// TODO Auto-generated constructor stub
	}
	
	public Answer(String contents) {
		super();
		this.contents = contents;
	}

	public Answer(String contents, String type) {
		super();
		this.contents = contents;
		this.type = type;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Answer [contents=" + contents + ", type=" + type + "]";
	}
}
