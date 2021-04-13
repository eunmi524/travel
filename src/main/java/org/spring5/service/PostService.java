package org.spring5.service;

import java.util.List;

import org.spring5.domain.PostVO;

public interface PostService {
	
	public List<PostVO> postList();
	
	public void postInsert(PostVO postVO);
	
	public int postModify(PostVO postVO);
	
	public PostVO postRead(Long postBno);
	
}
