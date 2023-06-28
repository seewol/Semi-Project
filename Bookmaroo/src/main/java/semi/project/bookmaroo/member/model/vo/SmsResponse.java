package semi.project.bookmaroo.member.model.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Builder
public class SmsResponse {		// 네이버로부터 응답받는 애
	private String requestId;
	private LocalDateTime requestTime;
	private String statusCode;			// 요청 성공하면 HTTP 상태코드가 200!
	private String statusName;
	private String smsConfirmNum;
}
