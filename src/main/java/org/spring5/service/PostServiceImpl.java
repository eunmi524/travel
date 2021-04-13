package org.spring5.service;

import java.util.List;

import org.spring5.domain.PostVO;
import org.spring5.mapper.PostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostServiceImpl implements PostService {
	
	@Autowired
	private PostMapper postMapper;
	
	public List<PostVO> postList(){
		return postMapper.postList();
	}

	@Override
	public void postInsert(PostVO postVO) {
		postMapper.postInsert(postVO);
		
	}

	@Override
	public int postModify(PostVO postVO) {
		return postMapper.postModify(postVO);
	}

	@Override
	public PostVO postRead(Long postBno) {
		return postMapper.postRead(postBno);
	}
}
