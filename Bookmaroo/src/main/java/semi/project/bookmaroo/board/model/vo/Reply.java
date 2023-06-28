package semi.project.bookmaroo.board.model.vo;

import java.sql.Date;

public class Reply {
	
	private int replyNo;
	private int memberNo;
	private String replyWriter;
	private int refBoardNo;
	private String replyContent;
	private Date replyUpdateDate;
	
	public Reply() {}

	public Reply(int replyNo, int memberNo, String replyWriter, int refBoardNo, String replyContent,
			Date replyUpdateDate) {
		super();
		this.replyNo = replyNo;
		this.memberNo = memberNo;
		this.replyWriter = replyWriter;
		this.refBoardNo = refBoardNo;
		this.replyContent = replyContent;
		this.replyUpdateDate = replyUpdateDate;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public int getRefBoardNo() {
		return refBoardNo;
	}

	public void setRefBoardNo(int refBoardNo) {
		this.refBoardNo = refBoardNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyUpdateDate() {
		return replyUpdateDate;
	}

	public void setReplyUpdateDate(Date replyUpdateDate) {
		this.replyUpdateDate = replyUpdateDate;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", memberNo=" + memberNo + ", replyWriter=" + replyWriter + ", refBoardNo="
				+ refBoardNo + ", replyContent=" + replyContent + ", replyUpdateDate=" + replyUpdateDate + "]";
	}
	
	
}
