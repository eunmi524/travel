package org.spring5.domain;

import java.util.List;

public class BoardPageDTO {
	private int boardCnt;
	private List<BoardVO> list;
	
	public BoardPageDTO() {
	}

	public BoardPageDTO(int boardCnt, List<BoardVO> list) {
		this.boardCnt = boardCnt;
		this.list = list;
	}

	public int getBoardCnt() {
		return boardCnt;
	}

	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}

	public List<BoardVO> getList() {
		return list;
	}

	public void setList(List<BoardVO> list) {
		this.list = list;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + boardCnt;
		result = prime * result + ((list == null) ? 0 : list.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BoardPageDTO other = (BoardPageDTO) obj;
		if (boardCnt != other.boardCnt)
			return false;
		if (list == null) {
			if (other.list != null)
				return false;
		} else if (!list.equals(other.list))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BoardPageDTO [boardCnt=" + boardCnt + ", list=" + list + "]";
	}
	

}
