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
	
	// @Value : ���� ����(properties) �� �������� ����
	@Value("${naver-cloud-sms.accessKey}")
	private String accessKey;	// Ű�� ���� ������ ������ ����
	
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
		String smsConfirm = createSmsKey(); // ������ȣ ����� (�Ʒ� �޼ҵ� ����)
		Long time = System.currentTimeMillis();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("x-ncp-apigw-timestamp", time.toString());								// header
		headers.set("x-ncp-iam-access-key", accessKey);										// ���̹� Ŭ���尡 ���ϴ� ���� �־��ִ� ��
		headers.set("x-ncp-apigw-signature-v2", makeSignature(time));
		
		List<Message> messages = new ArrayList<>();
		messages.add(message);	// 1������ list�� ��Ƽ� ���� (������ ��Ģ)
		
		SmsRequest request = SmsRequest.builder() // ���̹����� ��û ������
				.type("SMS")
				.contentType("COMM")
				.countryCode("82")					// �޼ҵ� ü�̴�					
				.from(phone) // �߽���
				.content("[å����]\n������ȣ ��" + smsConfirm + "���� �Է����ּ���(^^)��")
				.messages(messages) // ���� ��ȣ ����Ʈ (������ �츮�� �ϳ��� �Է� ����. �� 88��° ��)
				.build();	// ��ü ����
		
	
		ObjectMapper objectMapper = new ObjectMapper(); // ��ü�� ���� ������ ������ �� ObjectMapper
		String body = objectMapper.writeValueAsString(request);	// �޼ҵ�� ���� �� �ִ� ���·� ����  	// body
								// �� �� �޼ҵ尡 ��ü�� JSON ���·� �ٲ� (�̹� ���ǵ� �޼ҵ�)
		HttpEntity<String> httpBody = new HttpEntity<>(body, headers);
		// �� HTTP ��Ŷ�� ������ ��.
		// HTTP �ȿ��� ũ�� header�� body�� ����
		
		SmsResponse response = null;
		try {
			// �� ��� �����ִ� �� (���� �� ���� �� ��û ���� �� ���� ����)
			RestTemplate restTemplate = new RestTemplate();
		    restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());								
//		    System.out.println(serviceId);																										// ���� Ŭ���� ����
		    response = restTemplate.postForObject(new URI("https://sens.apigw.ntruss.com/sms/v2/services/" + serviceId + "/messages"), httpBody, SmsResponse.class);
		    response.setSmsConfirmNum(smsConfirm);	// �� postForObject : ���� ����� ��ü�� �޴� �޼ҵ�
	    											// SmsResponse.class : ��ü ���� Ÿ���� �����ִ� ����(��ü ���� Ŭ������ ������ �� �� SmsResponse)
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;	
	}
	
	// ������ȣ �����
	public static String createSmsKey() {
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();
		
		for(int i = 0; i < 5; i++) {
			key.append(rnd.nextInt(10));
		}
		
		return key.toString();
	}
}
