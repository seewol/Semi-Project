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
	@ResponseBody			// kakaoInsert.jsp 98번째 줄 : 데이터 객체에 "phone"이란 이름으로 사용자가 입력한 휴대폰번호가 담김
	public String sendSms(String phone , Model model) throws JsonProcessingException, RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException {
//		System.out.println("ㅎㅎ");
		SmsResponse response;
		ObjectMapper objectMapper = new ObjectMapper();
		String responseJson = "";
		try {
	        
			Message message = new Message(phone);	// Message 객체 생성해서 입력받은 phone 값 'to' 속성에 넣어줌
			response = smsService.sendSms(message);
//			model.addAttribute("response", response);						// json 타입의 String 으로 변환
			responseJson = objectMapper.registerModule(new JavaTimeModule()).writeValueAsString(response);
//			System.out.println(responseJson);						// pom.xml에 'Jackson Datatype : JSR310' 설정
		} catch (Throwable e) {
			e.printStackTrace();
		}
		System.out.println("responseJson : " + responseJson);
		return responseJson;
	}
}
