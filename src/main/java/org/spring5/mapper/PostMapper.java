package org.spring5.mapper;

import java.util.List;

import org.spring5.domain.PostVO;

public interface PostMapper {
	
	public List<PostVO> postList();  
	
	public void postInsert(PostVO postVO);
	
	public int postModify(PostVO postVO);
	
	public PostVO postRead(Long postBno);

}
