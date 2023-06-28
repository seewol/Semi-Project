package semi.project.bookmaroo.admin.model.vo;

public class User {
	private String memberNo;
	private String memberId;
	private String password;
	private String memberName;
	private String phone;
	private String enrollDate;
	private String isRental;
	private String isAdmin;
	private String loginType;
	private String kakaoId;
	private String memberStatus;
	
	public User() {}

	public User(String memberNo, String memberId, String password, String memberName, String phone, String enrollDate,
			String isRental, String isAdmin, String loginType, String kakaoId, String memberStatus) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.isRental = isRental;
		this.isAdmin = isAdmin;
		this.loginType = loginType;
		this.kakaoId = kakaoId;
		this.memberStatus = memberStatus;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getIsRental() {
		return isRental;
	}

	public void setIsRental(String isRental) {
		this.isRental = isRental;
	}

	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	public String getKakaoId() {
		return kakaoId;
	}

	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	@Override
	public String toString() {
		return "User [memberNo=" + memberNo + ", memberId=" + memberId + ", password=" + password + ", memberName="
				+ memberName + ", phone=" + phone + ", enrollDate=" + enrollDate + ", isRental=" + isRental
				+ ", isAdmin=" + isAdmin + ", loginType=" + loginType + ", kakaoId=" + kakaoId + ", memberStatus="
				+ memberStatus + "]";
	}
	
	
	
}
