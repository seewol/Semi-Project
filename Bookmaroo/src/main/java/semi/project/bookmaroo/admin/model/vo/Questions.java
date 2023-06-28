package semi.project.bookmaroo.admin.model.vo;

public class Questions {
	private String boardNo;
	private String memberNo1;
	private String boardTitle;
	private String boardContent;
	private String boardUpdateDate;
	private String boardViews;
	private String boardType;
	private String memberName;
	private String memberId;
	private String replyNo;
	private String memberNo2;
	private String refBoardNo;
	private String replyContent;
	private String replyUpdateDate;
	
	public Questions() {}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getMemberNo1() {
		return memberNo1;
	}

	public void setMemberNo1(String memberNo1) {
		this.memberNo1 = memberNo1;
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

	public String getBoardUpdateDate() {
		return boardUpdateDate;
	}

	public void setBoardUpdateDate(String boardUpdateDate) {
		this.boardUpdateDate = boardUpdateDate;
	}

	public String getBoardViews() {
		return boardViews;
	}

	public void setBoardViews(String boardViews) {
		this.boardViews = boardViews;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}

	public String getMemberNo2() {
		return memberNo2;
	}

	public void setMemberNo2(String memberNo2) {
		this.memberNo2 = memberNo2;
	}

	public String getRefBoardNo() {
		return refBoardNo;
	}

	public void setRefBoardNo(String refBoardNo) {
		this.refBoardNo = refBoardNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyUpdateDate() {
		return replyUpdateDate;
	}

	public void setReplyUpdateDate(String replyUpdateDate) {
		this.replyUpdateDate = replyUpdateDate;
	}

	@Override
	public String toString() {
		return "Questions [boardNo=" + boardNo + ", memberNo1=" + memberNo1 + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardUpdateDate=" + boardUpdateDate + ", boardViews="
				+ boardViews + ", boardType=" + boardType + ", memberName=" + memberName + ", memberId=" + memberId
				+ ", replyNo=" + replyNo + ", memberNo2=" + memberNo2 + ", refBoardNo=" + refBoardNo + ", replyContent="
				+ replyContent + ", replyUpdateDate=" + replyUpdateDate + "]";
	}

	
}
