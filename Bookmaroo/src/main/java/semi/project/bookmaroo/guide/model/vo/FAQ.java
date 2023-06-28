package semi.project.bookmaroo.guide.model.vo;

import java.sql.Date;

public class FAQ {
	private int faqNumber;
	private int memberNumber;
	private String faqQuestion;
	private String faqAnswer;
	private Date faqDate;
	
	public FAQ() {}

	public FAQ(int faqNumber, int memberNumber, String faqQuestion, String faqAnswer, Date faqDate) {
		super();
		this.faqNumber = faqNumber;
		this.memberNumber = memberNumber;
		this.faqQuestion = faqQuestion;
		this.faqAnswer = faqAnswer;
		this.faqDate = faqDate;
	}

	public int getFaqNumber() {
		return faqNumber;
	}

	public void setFaqNumber(int faqNumber) {
		this.faqNumber = faqNumber;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public String getFaqQuestion() {
		return faqQuestion;
	}

	public void setFaqQuestion(String faqQuestion) {
		this.faqQuestion = faqQuestion;
	}

	public String getFaqAnswer() {
		return faqAnswer;
	}

	public void setFaqAnswer(String faqAnswer) {
		this.faqAnswer = faqAnswer;
	}

	public Date getFaqDate() {
		return faqDate;
	}

	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}

	@Override
	public String toString() {
		return "FAQ [faqNumber=" + faqNumber + ", memberNumber=" + memberNumber + ", faqQuestion=" + faqQuestion
				+ ", faqAnswer=" + faqAnswer + ", faqDate=" + faqDate + "]";
	}
	
	
	
	
	
}
