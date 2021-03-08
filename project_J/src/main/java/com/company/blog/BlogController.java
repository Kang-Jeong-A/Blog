package com.company.blog;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;

import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.VO.Paging;
import com.company.VO.blogVO;
import com.company.service.BlogService;

import net.coobird.thumbnailator.Thumbnailator;

@Controller

public class BlogController {
	private static final Logger log = LoggerFactory.getLogger(BlogController.class);
	
	@Autowired
	private BlogService service;
	
	@GetMapping("/")
	public String main(Model model) {		
		return "Main";
	}
	
	@GetMapping("/Main")
	public void main() {		
	}
	
	/* 가입페이지 */
	@GetMapping("/Join")
	public void joinGET(){
		
	}
	
	//가입
	@PostMapping("/Join")
	public String join(blogVO vo, Model model) throws Exception{
		service.join(vo);
		return "redirect:/";
	}
	
	//로그인 페이지
	@GetMapping("/Login")
	public void loginGET() {}
	
	//로그인
	@PostMapping("/Login")
	public String login(Authentication auth, Model model) {
		
		return "redirect:/Write";
	}
	
	@GetMapping("/Mypage")
	public void mypage() {
		
	}
	
	/* blog */
	//블로그 메인
	@GetMapping("/BlogMain")
	public void blogMain(Model model, @RequestParam(defaultValue = "1") Integer thisPage) throws Exception{
		Paging paging = new Paging();
		
		paging.page(service.writingCount(), thisPage);

		model.addAttribute("paging", paging);
		model.addAttribute("list", service.list(paging));
	}

	// 블로그 설정 화면
	@GetMapping("/BlogSetting")
	public void blogSetting() {
		
	}
	
	// 글 상세
	@GetMapping("/Content")
	public void content(@RequestParam Integer w_no, @ModelAttribute("paging") Paging paging, Model model) throws Exception{
		blogVO vo = new blogVO();
		
		model.addAttribute("fileList", service.fileList(w_no));
		model.addAttribute("content", service.content(w_no));
		
		System.out.println("thisPage = " + paging.getThisPage());
		System.out.println("w_no = " + w_no);
		System.out.println("fileType = " + vo.isFileType());
	}

	
	//글 수정화면 불러오기
	@GetMapping("/Modify")
	public void modifyGET(@RequestParam Integer w_no, @ModelAttribute("paging") Paging paging, Model model) throws Exception {
		model.addAttribute("content", service.content(w_no));

	}
	
	//글 수정 실행
	@PostMapping("/Modify")
	public String modify(blogVO vo, @ModelAttribute("paging") Paging paging, RedirectAttributes rttr) throws Exception {
		service.modify(vo);
		
		rttr.addAttribute("thisPage", paging.getThisPage());
		rttr.addAttribute("pageSize", paging.getPageSize());
		
		return "redirect:/Content?w_no=" + vo.getW_no();
	}
	
	// 글 삭제 실행
	@PostMapping("/Delete")
	public String delete(@RequestParam Integer w_no, @ModelAttribute("paging") Paging paging, RedirectAttributes rttr) throws Exception{
		service.delete(w_no);
		
		rttr.addAttribute("thisPage", paging.getThisPage());
		rttr.addAttribute("pageSize", paging.getPageSize());

		return "redirect:/BlogMain";
	}
	
	//글쓰기  화면
	@GetMapping("/Write")
	public void writeGET(@ModelAttribute("paging") Paging paging) {
		
	}
	

	//글 등록
	@PostMapping("/Write")
	public String write(blogVO vo, Model model, MultipartFile[] uploadFile, @ModelAttribute("paging") Paging paging, RedirectAttributes rttr) throws Exception {
		//List<blogVO> list=new ArrayList<>();
		service.write(vo);
		log.info("file ? " +uploadFile[0].isEmpty());
		//첨부파일 존재하면 실행
		if(uploadFile[0].getSize() > 0 && !uploadFile[0].isEmpty()) {service.fileInsert(vo, uploadFile);}
			/*
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
					//service.fileInsert(vo, uploadFile);
			//}
		}*/

		rttr.addAttribute("thisPage", paging.getThisPage());
		rttr.addAttribute("pageSize", paging.getPageSize());
		
		return "redirect:/Content?w_no=" + vo.getW_no();
		//return new ResponseEntity<>(list, HttpStatus.OK);
	}

	//날짜 폴더 생성
	private String getFolder() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String str=sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	
	//image인지 체크
	private boolean checkImageType(File file) {
		try {
			String contentType=Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
