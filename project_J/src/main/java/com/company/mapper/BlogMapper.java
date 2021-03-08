package com.company.mapper;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.company.VO.blogVO;
import com.company.VO.fileVO;
import com.company.VO.Paging;

public interface BlogMapper {
	public void join(blogVO vo) throws Exception;
	
	public void write(blogVO vo) throws Exception;
	public List<blogVO> list(Paging paging) throws Exception;
	public int writingCount() throws Exception;
	
	public blogVO content(Integer w_no) throws Exception;
	public void delete(Integer w_no) throws Exception;
	public void modify(blogVO vo) throws Exception;
	
	public void fileInsert(blogVO vo) throws Exception;
	public void fileDelete(String uuid) throws Exception;
	public List<blogVO> fileList(Integer w_no) throws Exception;
}
