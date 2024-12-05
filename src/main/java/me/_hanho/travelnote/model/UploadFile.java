package me._hanho.travelnote.model;

public class UploadFile {
	
	private String program_detail_img_url;
	
	public UploadFile() {
	}

	public UploadFile(String program_detail_img_url) {
		super();
		this.program_detail_img_url = program_detail_img_url;
	}

	public String getProgram_detail_img_url() {
		return program_detail_img_url;
	}

	public void setProgram_detail_img_url(String program_detail_img_url) {
		this.program_detail_img_url = program_detail_img_url;
	}

	@Override
	public String toString() {
		return "File [program_detail_img_url=" + program_detail_img_url + "]";
	}
	
}
