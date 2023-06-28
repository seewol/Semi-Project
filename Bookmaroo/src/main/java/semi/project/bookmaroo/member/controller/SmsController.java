package semi.project.bookmaroo.member.controller;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import lombok.RequiredArgsConstructor;
import semi.project.bookmaroo.member.model.vo.Message;
import semi.project.bookmaroo.member.model.vo.SmsResponse;
import semi.project.bookmaroo.member.service.SmsService;

@Controller
@RequiredArgsConstructor
public class SmsController {
	
	private final SmsService smsService;
	
	@PostMapping("/sms/send")
	@ResponseBody			// kakaoInsert.jsp 98��° �� : ������ ��ü�� "phone"�̶� �̸����� ����ڰ� �Է��� �޴�����ȣ�� ���
	public String sendSms(String phone , Model model) throws JsonProcessingException, RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException {
//		System.out.println("����");
		SmsResponse response;
		ObjectMapper objectMapper = new ObjectMapper();
		String responseJson = "";
		try {
	        
			Message message = new Message(phone);	// Message ��ü �����ؼ� �Է¹��� phone �� 'to' �Ӽ��� �־���
			response = smsService.sendSms(message);
//			model.addAttribute("response", response);						// json Ÿ���� String ���� ��ȯ
			responseJson = objectMapper.registerModule(new JavaTimeModule()).writeValueAsString(response);
//			System.out.println(responseJson);						// pom.xml�� 'Jackson Datatype : JSR310' ����
		} catch (Throwable e) {
			e.printStackTrace();
		}
		System.out.println("responseJson : " + responseJson);
		return responseJson;
	}
}
