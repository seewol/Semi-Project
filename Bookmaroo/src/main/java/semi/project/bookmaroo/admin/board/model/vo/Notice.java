package semi.project.bookmaroo.admin.board.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeNumber;
	private int memberNumber;
	private String noticeTitle;
	private String noticeContents;
	private Date noticeDate;
	private String memberId;
	private String memberName;
	private int isRental;
	
	public Notice() {}
	
	public Notice(int noticeNumber, int memberNumber, String noticeTitle, String noticeContents, Date noticeDate,
			String memberId, String memberName, int isRental) {
		super();
		this.noticeNumber = noticeNumber;
		this.memberNumber = memberNumber;
		this.noticeTitle = noticeTitle;
		this.noticeContents = noticeContents;
		this.noticeDate = noticeDate;
		this.memberId = memberId;
		this.memberName = memberName;
		this.isRental = isRental;
	}

	public int getNoticeNumber() {
		return noticeNumber;
	}

	public void setNoticeNumber(int noticeNumber) {
		this.noticeNumber = noticeNumber;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContents() {
		return noticeContents;
	}

	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getIsRental() {
		return isRental;
	}

	public void setIsRental(int isRental) {
		this.isRental = isRental;
	}

	@Override
	public String toString() {
		return "Notice [noticeNumber=" + noticeNumber + ", memberNumber=" + memberNumber + ", noticeTitle="
				+ noticeTitle + ", noticeContents=" + noticeContents + ", noticeDate=" + noticeDate + ", memberId="
				+ memberId + ", memberName=" + memberName + ", isRental=" + isRental + "]";
	}
	
	
	
}
