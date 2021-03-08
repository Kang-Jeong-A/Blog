package com.company.service;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.company.VO.Paging;
import com.company.VO.blogVO;
import com.company.VO.fileVO;
import com.company.blog.BlogController;

import net.coobird.thumbnailator.Thumbnailator;

public interface BlogService {
	//servlet xml에 정의한 파일 업로드 경로
	@Resource(name="uploadFolder")
	String uploadFolder="C:\\Users\\LG\\Desktop\\eclipse-workspace\\project_J\\src\\main\\webapp\\resources\\ImgUpload";
	
	static final Logger log = LoggerFactory.getLogger(BlogController.class);
	
	public void join(blogVO vo) throws Exception;
	
	public void write(blogVO vo) throws Exception;
	public List<blogVO> list(Paging paging) throws Exception;
	public int writingCount() throws Exception;
	
	public blogVO content(Integer w_no) throws Exception;
	public void delete(Integer w_no) throws Exception;
	public void modify(blogVO vo) throws Exception;
	
	public default void fileInsert(blogVO vo, MultipartFile[] uploadFile) throws Exception{
		//folder생성
		File uploadPath=new File(uploadFolder, getFolder());
		log.info("upload path : "+uploadPath);
		
		//날짜 폴더 없으면 생성
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		//파일 업로드
		for(MultipartFile multipartFile : uploadFile) {
			log.info("============");
			log.info("file name : "+multipartFile.getOriginalFilename());
			log.info("file size : "+multipartFile.getSize());
			
				String uploadFileName=multipartFile.getOriginalFilename();

				//IE
				uploadFileName=uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
				log.info("file name only : "+uploadFileName);
				vo.setFileName(uploadFileName);
				
				// 중복방지
				UUID uuid=UUID.randomUUID();
				uploadFileName=uuid.toString()+"_"+uploadFileName;
				
				File saveFile=new File(uploadPath, uploadFileName);
				
				try {
					//파일 저장
					multipartFile.transferTo(saveFile);
	
					vo.setUuid(uuid.toString());
					vo.setUploadPath(uploadPath.toString());
					//vo.setUploadPath(uploadFolder);
					
					//image체크->이미지맞으면 썸네일 생성
					if(checkImageType(saveFile)) {
						vo.setFileType(true);
						
						FileOutputStream thumbnail=new FileOutputStream(new File(uploadPath, "thumb_"+uploadFileName));
						Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
						thumbnail.close();
					}
					//list.add(vo);
					}catch(Exception e) {
						e.printStackTrace();
						log.error(e.getMessage());
					}
		}
	};

	//날짜 폴더 생성
	static String getFolder() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String str=sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	
	//image인지 체크
	static boolean checkImageType(File file) {
		try {
			String contentType=Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public void fileDelete(String uuid) throws Exception;
	public List<blogVO> fileList(Integer w_no) throws Exception;
}
