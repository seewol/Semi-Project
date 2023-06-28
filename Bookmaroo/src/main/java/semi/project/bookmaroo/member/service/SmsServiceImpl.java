package semi.project.bookmaroo.member.service;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import semi.project.bookmaroo.member.model.vo.Message;
import semi.project.bookmaroo.member.model.vo.SmsRequest;
import semi.project.bookmaroo.member.model.vo.SmsResponse;

@Service
public class SmsServiceImpl implements SmsService {
	
	// @Value : 설정 파일(properties) 값 가져오는 역할
	@Value("${naver-cloud-sms.accessKey}")
	private String accessKey;	// 키를 통해 가져와 변수에 담음
	
	@Value("${naver-cloud-sms.secretKey}")
	private String secretKey;
	
	@Value("${naver-cloud-sms.serviceId}")
	private String serviceId;
 
	@Value("${naver-cloud-sms.senderPhone}")
	private String phone;
	
	public String makeSignature(Long time) throws NoSuchAlgorithmException, UnsupportedEncodingException, InvalidKeyException {
		String space = " ";
        String newLine = "\n";
        String method = "POST";
        String url = "/sms/v2/services/"+ this.serviceId+"/messages";
        String timestamp = time.toString();
        String accessKey = this.accessKey;
        String secretKey = this.secretKey;
 
        String message = new StringBuilder()	// Builder
                .append(method)
                .append(space)
                .append(url)
                .append(newLine)
                .append(timestamp)
                .append(newLine)
                .append(accessKey)
                .toString();
 
        SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(signingKey);
 
        byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
        String encodeBase64String = Base64.encodeBase64String(rawHmac);
 
        return encodeBase64String;
	}
	
	public SmsResponse sendSms(Message message) throws JsonProcessingException, RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException {
		String smsConfirm = createSmsKey(); // 인증번호 만들기 (아래 메소드 있음)
		Long time = System.currentTimeMillis();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("x-ncp-apigw-timestamp", time.toString());								// header
		headers.set("x-ncp-iam-access-key", accessKey);										// 네이버 클라우드가 원하는 정보 넣어주는 곳
		headers.set("x-ncp-apigw-signature-v2", makeSignature(time));
		
		List<Message> messages = new ArrayList<>();
		messages.add(message);	// 1개여도 list에 담아서 보냄 (정해진 규칙)
		
		SmsRequest request = SmsRequest.builder() // 네이버에게 요청 보내기
				.type("SMS")
				.contentType("COMM")
				.countryCode("82")					// 메소드 체이닝					
				.from(phone) // 발신자
				.content("[책마루]\n인증번호 〈" + smsConfirm + "〉를 입력해주세요(^^)♪")
				.messages(messages) // 수신 번호 리스트 (하지만 우리는 하나만 입력 받음. 위 88번째 줄)
				.build();	// 객체 생성
		
	
		ObjectMapper objectMapper = new ObjectMapper(); // 객체에 대한 매핑을 도와줌 → ObjectMapper
		String body = objectMapper.writeValueAsString(request);	// 메소드로 보낼 수 있는 형태로 만듦  	// body
								// └ 이 메소드가 객체를 JSON 형태로 바꿈 (이미 정의된 메소드)
		HttpEntity<String> httpBody = new HttpEntity<>(body, headers);
		// └ HTTP 패킷을 생성해 줌.
		// HTTP 안에는 크게 header와 body로 나뉨
		
		SmsResponse response = null;
		try {
			// ┌ 통신 도와주는 애 (서버 → 서버 로 요청 보낼 때 자주 쓰임)
			RestTemplate restTemplate = new RestTemplate();
		    restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());								
//		    System.out.println(serviceId);																										// 응답 클래스 지정
		    response = restTemplate.postForObject(new URI("https://sens.apigw.ntruss.com/sms/v2/services/" + serviceId + "/messages"), httpBody, SmsResponse.class);
		    response.setSmsConfirmNum(smsConfirm);	// └ postForObject : 응답 결과를 객체로 받는 메소드
	    											// SmsResponse.class : 객체 받을 타입을 정해주는 인자(객체 만들 클래스를 지정한 것 → SmsResponse)
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;	
	}
	
	// 인증번호 만들기
	public static String createSmsKey() {
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();
		
		for(int i = 0; i < 5; i++) {
			key.append(rnd.nextInt(10));
		}
		
		return key.toString();
	}
}
