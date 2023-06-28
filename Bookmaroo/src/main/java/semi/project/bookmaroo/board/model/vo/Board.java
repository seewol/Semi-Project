package semi.project.bookmaroo.board.model.vo;

import java.sql.Date;

public class Board {

	private int boardNo;
	private int memberNo;
	private String writer;
	private String boardTitle;
	private String boardContent;
	private Date boardUpdateDate;
	private int boardViews;
	private int boardType;
	
	public Board() {}
	
	public Board(int boardNo, int memberNo, String writer, String boardTitle, String boardContent, Date boardUpdateDate,
			int boardViews, int boardType) {
		super();
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.writer = writer;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardUpdateDate = boardUpdateDate;
		this.boardViews = boardViews;
		this.boardType = boardType;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardUpdateDate() {
		return boardUpdateDate;
	}

	public void setBoardUpdateDate(Date boardUpdateDate) {
		this.boardUpdateDate = boardUpdateDate;
	}

	public int getBoardViews() {
		return boardViews;
	}

	public void setBoardViews(int boardViews) {
		this.boardViews = boardViews;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", memberNo=" + memberNo + ", writer=" + writer + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardUpdateDate=" + boardUpdateDate
				+ ", boardViews=" + boardViews + ", boardType=" + boardType + "]";
	}
	
	
	
}
