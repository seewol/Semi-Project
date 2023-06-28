package semi.project.bookmaroo.board.model.vo;

import java.sql.Date;

public class Review {
	private int reviewNo;
	private int memberNo;
	private String reviewerName;
	private int rentNo;
	private String bookName;
	private String bookImage;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewUpdateDate;
	private int reviewViews;
	private int starRating;
	private String reviewBookISBN;
	
	public Review() {}

	public Review(int reviewNo, int memberNo, String reviewerName, int rentNo, String bookName, String bookImage,
			String reviewTitle, String reviewContent, Date reviewUpdateDate, int reviewViews, int starRating,
			String reviewBookISBN) {
		super();
		this.reviewNo = reviewNo;
		this.memberNo = memberNo;
		this.reviewerName = reviewerName;
		this.rentNo = rentNo;
		this.bookName = bookName;
		this.bookImage = bookImage;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewUpdateDate = reviewUpdateDate;
		this.reviewViews = reviewViews;
		this.starRating = starRating;
		this.reviewBookISBN = reviewBookISBN;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getReviewerName() {
		return reviewerName;
	}

	public void setReviewerName(String reviewerName) {
		this.reviewerName = reviewerName;
	}

	public int getRentNo() {
		return rentNo;
	}

	public void setRentNo(int rentNo) {
		this.rentNo = rentNo;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookImage() {
		return bookImage;
	}

	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewUpdateDate() {
		return reviewUpdateDate;
	}

	public void setReviewUpdateDate(Date reviewUpdateDate) {
		this.reviewUpdateDate = reviewUpdateDate;
	}

	public int getReviewViews() {
		return reviewViews;
	}

	public void setReviewViews(int reviewViews) {
		this.reviewViews = reviewViews;
	}

	public int getStarRating() {
		return starRating;
	}

	public void setStarRating(int starRating) {
		this.starRating = starRating;
	}

	public String getReviewBookISBN() {
		return reviewBookISBN;
	}

	public void setReviewBookISBN(String reviewBookISBN) {
		this.reviewBookISBN = reviewBookISBN;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", memberNo=" + memberNo + ", reviewerName=" + reviewerName
				+ ", rentNo=" + rentNo + ", bookName=" + bookName + ", bookImage=" + bookImage + ", reviewTitle="
				+ reviewTitle + ", reviewContent=" + reviewContent + ", reviewUpdateDate=" + reviewUpdateDate
				+ ", reviewViews=" + reviewViews + ", starRating=" + starRating + ", reviewBookISBN=" + reviewBookISBN
				+ "]";
	}

	
	
}
