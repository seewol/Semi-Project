package semi.project.bookmaroo.member.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import semi.project.bookmaroo.member.model.dao.MemberDAO;
import semi.project.bookmaroo.member.model.vo.KakaoInsertMember;
import semi.project.bookmaroo.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;
	
	// ● 카카오 로그인
	@Override									
	public String getAccessToken(String code) throws Exception {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";	// token 받아올 url

		try {
			URL url = new URL(reqURL);
			
			// ┌ URLConnection의 하위 클래스로 HTTP 프로토콜을 사용해 서버와 통신 시 사용 (프로토콜 : 통신을 위한 규약)
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// └ 다른 하위 클래스와 마찬가지로 URL과의 연결을 나타내는 객체를 생성, 서버와의 입출력 스트림을 얻어오는 등의 기능을 제공
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			// getInputStream() / getOutputStream()은 java.net.URLConnection 클래스의 메소드로, 서버와의 입출력 스트림을 얻어오는 역할

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			
			// getOutputStream() : 서버로 데이터를 보내는 출력 스트림(OutputStream)을 반환,
			// 		메소드 호출 시 서버로 데이터를 전송할 준비가 되며, 반환된 출력 스트림에 데이터를 출력하면 서버로 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			// └ 데이터를 버퍼링하려 출력할 수 있음
			StringBuilder sb = new StringBuilder();
			// └ 문자열을 버퍼링할 수 있는 기능 제공
			// 버퍼링(Buffering)은 데이터를 임시로 저장하는 메모리 영역
			
			// 서버와 통신하기 위해 OutputStream 객체를 사용하여 BufferedWriter 객체를 생성, StringBuilder 객체를 생성하는 코드
			// 이후에는 생성된 BufferedWriter 객체와 StringBuilder 객체를 사용하여 데이터를 출력하는 등의 작업을 수행
			
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=3820ee86989bf11805e157a18f4e15b1"); // REST_API키 본인이 발급받은 key 넣어주기
			sb.append("&redirect_uri=http://localhost:8099/bookmaroo/kakao"); // REDIRECT_URI 본인이 설정한 주소 넣어주기

			sb.append("&code=" + code);
			bw.write(sb.toString());	// 데이터 보내기
			bw.flush();	// 비우기

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();	// 카카오에게 요청한 결과
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기				
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			// getInputStream() : 서버로부터 데이터를 읽어오는 입력 스트림(InputStream)을 반환
			// 		메소드를 호출하면 서버에서 데이터를 전송하면 그 때부터 데이터를 읽어올 수 있음
			
			String line = "";							
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			
			// Jackson 라이브러리의 핵심 클래스
			// └ ObjectMapper 객체 생성 : Java 객체를 JSON 데이터로 변환할 수 있는 기능 제공
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map						// readValue()로 문자열을 Map 객체로 변환 (키:스트링/값:Object)
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});

			access_Token = jsonMap.get("access_token").toString();
			refresh_Token = jsonMap.get("refresh_token").toString();

			System.out.println("access_token : " + access_Token); // 획득
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();	// 스트림 닫음
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token; // access_Token으로 사용자 정보를 가져올 수 있음
	}
	
	@SuppressWarnings("unchecked") // 경고 제외용
	@Override
	public Member getUserInfo(String access_Token) throws Throwable {
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		// HashMap<String, Object> userInfo = new HashMap<String, Object>();
		
		String reqURL = "https://kapi.kakao.com/v2/user/me"; // ★ 사용자 정보 받아오는 url
		
		Member member = new Member();

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();	// 카카오 서버 통신 요청 결과
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			System.out.println("result type : " + result.getClass().getName()); // java.lang.String

			try {
				// jackson objectmapper 객체 생성
				ObjectMapper objectMapper = new ObjectMapper();
				// JSON String -> Map
				Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
				});

				System.out.println(jsonMap);
				System.out.println("카카오 아이디 : " + jsonMap.get("id"));
				
				// 위의 과정에서 카카오에게 요청하여 카카오 ID를 받아왔고,
				// 받아온 카카오 ID가 우리 DB에 존재하는지 아래 findByKakaoId로 확인!!
				Member findMember = mDAO.findByKakaoId(sqlSession, (long)jsonMap.get("id"));
				
				// findByKakaoIdD로 찾아서 findMember에 담겨야 하는데, null은 DB에 없는 경우.
				// 따라서 insertKakaoMember 메소드를 통해 회원 가입을 진행함.
				if(findMember == null) {
					member.setKakaoId((long)jsonMap.get("id"));
					member.setLoginType("KAKAO");
					
					// 카카오로 회원가입
					int insertResult = mDAO.insertKakaoMember(sqlSession, member);
					
					// 회원가입이 정상적으로 됐으면 1이 반환되고, 로그인
					if (insertResult == 1) {
						findMember = mDAO.findByKakaoId(sqlSession, (long)jsonMap.get("id"));
					}
				} 
				return findMember;
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Member login(Member m) {
		return mDAO.login(sqlSession, m);
	}

	@Override
	public int kakaoAdd(Member m) {
		return mDAO.kakaoAdd(sqlSession, m);
	}
	
	@Override
	public Member findByKakaoId(long id) {
		return mDAO.findByKakaoId(sqlSession, id);
	}

	@Override
	public int checkId(String id) {
		return mDAO.checkId(sqlSession, id);
	}

	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public int findPwdCode(Member m) {
		return mDAO.findPwdCode(sqlSession, m);
	}

	@Override
	public int changePwd(Member findPwd) {
		return mDAO.changePwd(sqlSession, findPwd);
	}

	@Override
	public ArrayList<Member> findId(Member m) {
		return mDAO.findId(sqlSession, m);
	}

	@Override
	public int deleteMember(String id) {
		return mDAO.deleteMember(sqlSession, id);
	}

	@Override
	public int updatePwd(Member m) {
		return mDAO.updatePwd(sqlSession, m);
	}

	@Override
	public int updatePhone(Member m) {
		return mDAO.updatePhone(sqlSession, m);
	}


	

	
	
	
	
	
	
	//Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
	//Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");
	
	// System.out.println(properties.get("nickname"));
	// System.out.println(kakao_account.get("email"));
	
	//String nickname = properties.get("nickname").toString();
	//String email = kakao_account.get("email").toString();
	
	//userInfo.put("nickname", nickname);
	//userInfo.put("email", email);
	
	
	
}
