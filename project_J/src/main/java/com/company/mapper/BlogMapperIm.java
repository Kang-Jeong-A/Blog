package com.company.mapper;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.company.VO.blogVO;
import com.company.VO.fileVO;
import com.company.VO.Paging;

@Repository
public class BlogMapperIm implements BlogMapper{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void join(blogVO vo) {
		sqlSession.insert("join", vo);
	}

	@Override
	public void write(blogVO vo) throws Exception {
		sqlSession.insert("write", vo);
	}

	@Override
	public List<blogVO> list(Paging paging) throws Exception {
		return sqlSession.selectList("blog.list");
	}
	
	@Override
	public int writingCount() throws Exception{
		return sqlSession.selectOne("blog.writingCount");
	}

	@Override
	public blogVO content(Integer w_no) throws Exception {
		return sqlSession.selectOne("content", w_no);
	}

	@Override
	public void delete(Integer w_no) throws Exception {
		sqlSession.delete("delete", w_no);
	}

	@Override
	public void modify(blogVO vo) throws Exception {
		sqlSession.update("modify", vo);
	}

	@Override
	public void fileInsert(blogVO vo) throws Exception {
		sqlSession.insert("fileInsert", vo);
	}

	@Override
	public void fileDelete(String uuid) throws Exception {
		sqlSession.delete("fileDelete", uuid);
	}
	
	@Override
	public List<blogVO> fileList(Integer w_no) throws Exception {
		return sqlSession.selectList("blog.fileList", w_no);
	}

}
