package me._hanho.travelnote.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {

	void setQuestionFile(MultipartFile file, int question_id);

}
