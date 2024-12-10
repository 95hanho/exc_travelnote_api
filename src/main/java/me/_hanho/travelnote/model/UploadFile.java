package me._hanho.travelnote.model;

public class UploadFile {
	
	private int file_num;
	private String name;
	private String filePath;
	
	private String type;
	private int company_id;
	private int lecture_idx;
	private int question_id;
	
	private String program_detail_img_url;
	
	public UploadFile() {
	}

	public UploadFile(String program_detail_img_url) {
		super();
		this.program_detail_img_url = program_detail_img_url;
	}
	
	public UploadFile(int file_num, String name, String filePath, String type, int company_id, int lecture_idx,
			int question_id, String program_detail_img_url) {
		super();
		this.file_num = file_num;
		this.name = name;
		this.filePath = filePath;
		this.type = type;
		this.company_id = company_id;
		this.lecture_idx = lecture_idx;
		this.question_id = question_id;
		this.program_detail_img_url = program_detail_img_url;
	}

	public String getProgram_detail_img_url() {
		return program_detail_img_url;
	}

	public void setProgram_detail_img_url(String program_detail_img_url) {
		this.program_detail_img_url = program_detail_img_url;
	}
	
	public int getFile_num() {
		return file_num;
	}

	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	public int getLecture_idx() {
		return lecture_idx;
	}

	public void setLecture_idx(int lecture_idx) {
		this.lecture_idx = lecture_idx;
	}

	public int getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}

	@Override
	public String toString() {
		return "UploadFile [file_num=" + file_num + ", name=" + name + ", filePath=" + filePath + ", type=" + type
				+ ", company_id=" + company_id + ", lecture_idx=" + lecture_idx + ", question_id=" + question_id
				+ ", program_detail_img_url=" + program_detail_img_url + "]";
	}

}
