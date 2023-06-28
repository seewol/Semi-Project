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
	
	// �� īī�� �α���
	@Override									
	public String getAccessToken(String code) throws Exception {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";	// token �޾ƿ� url

		try {
			URL url = new URL(reqURL);
			
			// �� URLConnection�� ���� Ŭ������ HTTP ���������� ����� ������ ��� �� ��� (�������� : ����� ���� �Ծ�)
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// �� �ٸ� ���� Ŭ������ ���������� URL���� ������ ��Ÿ���� ��ü�� ����, �������� ����� ��Ʈ���� ������ ���� ����� ����
			// POST ��û�� ���� �⺻���� false�� setDoOutput�� true��
			// getInputStream() / getOutputStream()�� java.net.URLConnection Ŭ������ �޼ҵ��, �������� ����� ��Ʈ���� ������ ����

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST ��û�� �ʿ�� �䱸�ϴ� �Ķ���� ��Ʈ���� ���� ����
			
			// getOutputStream() : ������ �����͸� ������ ��� ��Ʈ��(OutputStream)�� ��ȯ,
			// 		�޼ҵ� ȣ�� �� ������ �����͸� ������ �غ� �Ǹ�, ��ȯ�� ��� ��Ʈ���� �����͸� ����ϸ� ������ ����
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			// �� �����͸� ���۸��Ϸ� ����� �� ����
			StringBuilder sb = new StringBuilder();
			// �� ���ڿ��� ���۸��� �� �ִ� ��� ����
			// ���۸�(Buffering)�� �����͸� �ӽ÷� �����ϴ� �޸� ����
			
			// ������ ����ϱ� ���� OutputStream ��ü�� ����Ͽ� BufferedWriter ��ü�� ����, StringBuilder ��ü�� �����ϴ� �ڵ�
			// ���Ŀ��� ������ BufferedWriter ��ü�� StringBuilder ��ü�� ����Ͽ� �����͸� ����ϴ� ���� �۾��� ����
			
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=3820ee86989bf11805e157a18f4e15b1"); // REST_APIŰ ������ �߱޹��� key �־��ֱ�
			sb.append("&redirect_uri=http://localhost:8099/bookmaroo/kakao"); // REDIRECT_URI ������ ������ �ּ� �־��ֱ�

			sb.append("&code=" + code);
			bw.write(sb.toString());	// ������ ������
			bw.flush();	// ����

			// ��� �ڵ尡 200�̶�� ����
			int responseCode = conn.getResponseCode();	// īī������ ��û�� ���
			System.out.println("responseCode : " + responseCode);

			// ��û�� ���� ���� JSONŸ���� Response �޼��� �о����				
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			// getInputStream() : �����κ��� �����͸� �о���� �Է� ��Ʈ��(InputStream)�� ��ȯ
			// 		�޼ҵ带 ȣ���ϸ� �������� �����͸� �����ϸ� �� ������ �����͸� �о�� �� ����
			
			String line = "";							
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			
			// Jackson ���̺귯���� �ٽ� Ŭ����
			// �� ObjectMapper ��ü ���� : Java ��ü�� JSON �����ͷ� ��ȯ�� �� �ִ� ��� ����
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map						// readValue()�� ���ڿ��� Map ��ü�� ��ȯ (Ű:��Ʈ��/��:Object)
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});

			access_Token = jsonMap.get("access_token").toString();
			refresh_Token = jsonMap.get("refresh_token").toString();

			System.out.println("access_token : " + access_Token); // ȹ��
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();	// ��Ʈ�� ����
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token; // access_Token���� ����� ������ ������ �� ����
	}
	
	@SuppressWarnings("unchecked") // ��� ���ܿ�
	@Override
	public Member getUserInfo(String access_Token) throws Throwable {
		// ��û�ϴ� Ŭ���̾�Ʈ���� ���� ������ �ٸ� �� �ֱ⿡ HashMapŸ������ ����
		// HashMap<String, Object> userInfo = new HashMap<String, Object>();
		
		String reqURL = "https://kapi.kakao.com/v2/user/me"; // �� ����� ���� �޾ƿ��� url
		
		Member member = new Member();

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// ��û�� �ʿ��� Header�� ���Ե� ����
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();	// īī�� ���� ��� ��û ���
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
				// jackson objectmapper ��ü ����
				ObjectMapper objectMapper = new ObjectMapper();
				// JSON String -> Map
				Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
				});

				System.out.println(jsonMap);
				System.out.println("īī�� ���̵� : " + jsonMap.get("id"));
				
				// ���� �������� īī������ ��û�Ͽ� īī�� ID�� �޾ƿ԰�,
				// �޾ƿ� īī�� ID�� �츮 DB�� �����ϴ��� �Ʒ� findByKakaoId�� Ȯ��!!
				Member findMember = mDAO.findByKakaoId(sqlSession, (long)jsonMap.get("id"));
				
				// findByKakaoIdD�� ã�Ƽ� findMember�� ��ܾ� �ϴµ�, null�� DB�� ���� ���.
				// ���� insertKakaoMember �޼ҵ带 ���� ȸ�� ������ ������.
				if(findMember == null) {
					member.setKakaoId((long)jsonMap.get("id"));
					member.setLoginType("KAKAO");
					
					// īī���� ȸ������
					int insertResult = mDAO.insertKakaoMember(sqlSession, member);
					
					// ȸ�������� ���������� ������ 1�� ��ȯ�ǰ�, �α���
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
