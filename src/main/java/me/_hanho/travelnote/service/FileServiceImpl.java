package me._hanho.travelnote.service;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import io.jsonwebtoken.io.IOException;
import me._hanho.travelnote.model.UploadFile;
import me._hanho.travelnote.repository.FileRepository;

@Service
public class FileServiceImpl implements FileService {

	// application.properties에 선언된 파일 저장 경로
	// ex) "/files/{프로젝트이름}/"
	@Value("${spring.servlet.multipart.location}")
    private String uploadDir; 
	
	@Autowired
	private FileRepository fileDAO;
	
	@Override
	public void setQuestionFile(MultipartFile file, int question_id) {
		UploadFile inFile = new UploadFile();
		// 파일명 설정
		String originalFileName = file.getOriginalFilename();
		String storedFileName = System.currentTimeMillis() + "_" + originalFileName;
		String filePath = uploadDir + "/" + storedFileName;
		inFile.setName(originalFileName);
		inFile.setFilePath(filePath);
		inFile.setQuestion_id(question_id);
		Boolean result = true;
		Boolean result3 = false;
		
		ArrayList<UploadFile> file_list = fileDAO.getFiles(question_id);
		if(file_list.size() > 0) {
			result = deleteFile(file_list.get(0).getFilePath());
			Boolean result2 = saveFile(file, storedFileName);
			if(result2) {
				fileDAO.updateFile(inFile);
			}
		} else {
			result = saveFile(file, storedFileName);
			if(result) {
				fileDAO.createFile(inFile);
			}
		}
	}
	
	public boolean saveFile(MultipartFile file, String storedFileName) throws IOException {
		File dest = new File(storedFileName);
		// 파일 저장
		try {
			file.transferTo(dest);
		} catch (IllegalStateException | java.io.IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean deleteFile(String filePath) throws IOException {
		File file = new File(filePath);

        // 파일 존재 여부 확인
        if (file.exists()) {
            // 파일 삭제
            boolean deleted = file.delete();
            if (deleted) {
                System.out.println("파일 삭제 성공: " + filePath);
            } else {
                System.out.println("파일 삭제 실패: " + filePath);
            }
            return deleted;
        } else {
            System.out.println("파일이 존재하지 않습니다: " + filePath);
            return false;
        }
	}
}
