package semi.project.bookmaroo.admin.model.vo;

public class Wishes {
	private String wishNo;
	private String memberNo;
	private String wishTitle;
	private String wishAuthor;
	private String wishPublisher;
	private String wishPrice;
	private String wishEtc;
	private String wishPublication;
	private String memberId;
	
	public Wishes() {}

	public Wishes(String wishNo, String memberNo, String wishTitle, String wishAuthor, String wishPublisher,
			String wishPrice, String wishEtc, String wishPublication, String memberId) {
		super();
		this.wishNo = wishNo;
		this.memberNo = memberNo;
		this.wishTitle = wishTitle;
		this.wishAuthor = wishAuthor;
		this.wishPublisher = wishPublisher;
		this.wishPrice = wishPrice;
		this.wishEtc = wishEtc;
		this.wishPublication = wishPublication;
		this.memberId = memberId;
	}

	public String getWishNo() {
		return wishNo;
	}

	public void setWishNo(String wishNo) {
		this.wishNo = wishNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getWishTitle() {
		return wishTitle;
	}

	public void setWishTitle(String wishTitle) {
		this.wishTitle = wishTitle;
	}

	public String getWishAuthor() {
		return wishAuthor;
	}

	public void setWishAuthor(String wishAuthor) {
		this.wishAuthor = wishAuthor;
	}

	public String getWishPublisher() {
		return wishPublisher;
	}

	public void setWishPublisher(String wishPublisher) {
		this.wishPublisher = wishPublisher;
	}

	public String getWishPrice() {
		return wishPrice;
	}

	public void setWishPrice(String wishPrice) {
		this.wishPrice = wishPrice;
	}

	public String getWishEtc() {
		return wishEtc;
	}

	public void setWishEtc(String wishEtc) {
		this.wishEtc = wishEtc;
	}

	public String getWishPublication() {
		return wishPublication;
	}

	public void setWishPublication(String wishPublication) {
		this.wishPublication = wishPublication;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Wishes [wishNo=" + wishNo + ", memberNo=" + memberNo + ", wishTitle=" + wishTitle + ", wishAuthor="
				+ wishAuthor + ", wishPublisher=" + wishPublisher + ", wishPrice=" + wishPrice + ", wishEtc=" + wishEtc
				+ ", wishPublication=" + wishPublication + ", memberId=" + memberId + "]";
	}
	
	
}
