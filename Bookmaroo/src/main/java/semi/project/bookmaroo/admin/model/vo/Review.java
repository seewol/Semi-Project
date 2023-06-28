package semi.project.bookmaroo.admin.model.vo;

public class Review {
	private String reviewNo;
	private String reviewTitle;
	private String reviewContent;
	private String reviewUpdateDate;
	private String reviewViews;
	private String starRating;
	private String reviewBookIsbn;
	private String memberId;
	
	public Review() {}

	public Review(String reviewNo, String reviewTitle, String reviewContent, String reviewUpdateDate,
			String reviewViews, String starRating, String reviewBookIsbn, String memberId) {
		super();
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewUpdateDate = reviewUpdateDate;
		this.reviewViews = reviewViews;
		this.starRating = starRating;
		this.reviewBookIsbn = reviewBookIsbn;
		this.memberId = memberId;
	}

	public String getReviewNo() {
		return reviewNo;
	}
	
	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
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
	
	public String getReviewUpdateDate() {
		return reviewUpdateDate;
	}
	
	public void setReviewUpdateDate(String reviewUpdateDate) {
		this.reviewUpdateDate = reviewUpdateDate;
	}
	
	public String getReviewViews() {
		return reviewViews;
	}
	
	public void setReviewViews(String reviewViews) {
		this.reviewViews = reviewViews;
	}
	
	public String getStarRating() {
		return starRating;
	}
	
	public void setStarRating(String starRating) {
		this.starRating = starRating;
	}
	
	public String getReviewBookIsbn() {
		return reviewBookIsbn;
	}
	
	public void setReviewBookIsbn(String reviewBookIsbn) {
		this.reviewBookIsbn = reviewBookIsbn;
	}
	
	public String getMemberId() {
		return memberId;
	}
	
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent
				+ ", reviewUpdateDate=" + reviewUpdateDate + ", reviewViews=" + reviewViews + ", starRating="
				+ starRating + ", reviewBookIsbn=" + reviewBookIsbn + ", memberId=" + memberId + "]";
	}
	
}
