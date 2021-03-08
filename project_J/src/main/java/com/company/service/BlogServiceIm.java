package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.company.VO.Paging;
import com.company.VO.blogVO;
import com.company.VO.fileVO;
import com.company.mapper.BlogMapper;

@Service
public class BlogServiceIm implements BlogService{
	@Autowired
	private BlogMapper bm;

	@Override
	public void join(blogVO vo) throws Exception {
		bm.join(vo);
	}

	@Override
	public void write(blogVO vo) throws Exception {
		bm.write(vo);
	}

	@Override
	public List<blogVO> list(Paging paging) throws Exception {
		return bm.list(paging);
	}
	
	@Override
	public int writingCount() throws Exception{
		return bm.writingCount();
	}

	@Override
	public blogVO content(Integer w_no) throws Exception {
		return bm.content(w_no);
	}

	@Override
	public void delete(Integer w_no) throws Exception {
		bm.delete(w_no);
	}

	@Override
	public void modify(blogVO vo) throws Exception {
		bm.modify(vo);
	}

	public void fileInsert(blogVO vo)throws Exception {
		bm.fileInsert(vo);
	}

	@Override
	public void fileDelete(String uuid) throws Exception {
		bm.fileDelete(uuid);
	}

	@Override
	public List<blogVO> fileList(Integer w_no) throws Exception {
		return bm.fileList(w_no);
	}

}
