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
public class SmsResponse {		// ���̹��κ��� ����޴� ��
	private String requestId;
	private LocalDateTime requestTime;
	private String statusCode;			// ��û �����ϸ� HTTP �����ڵ尡 200!
	private String statusName;
	private String smsConfirmNum;
}
