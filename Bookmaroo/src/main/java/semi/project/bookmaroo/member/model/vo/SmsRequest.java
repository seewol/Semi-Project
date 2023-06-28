package semi.project.bookmaroo.member.model.vo;

import java.util.List;

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
public class SmsRequest {	// 네이버에 요청 보내는 애
	private String type;
	private String contentType;
	private String countryCode;
	private String from;
	private String content;
	private List<Message> messages;
	
}
