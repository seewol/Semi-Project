package semi.project.bookmaroo.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	private int memNo;
	private String memId;
	private String password;
	private String memName;
	private String phone;
	private Date enrollDate;
	private int isRental; 
	private int isAdmin;
	private String loginType;
	private long kakaoId;
	private String memStatus;

	public Member(String memId, String password) {	// 비밀번호 변경 용
		this.memId = memId;
		this.password = password;
	}
}