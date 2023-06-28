package semi.project.bookmaroo.admin.board.model.vo;

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
public class Attachment {
	
	private int popUpNum; //p_no
	private int memberNumAttm; //m_no
	private String popupTitleAttm; //p_title
	
	private int fileNo; //첨부파일 번호
	private String fileUrl; //첨부파일 경로
	private String fileType; //첨부파일 확장자
	private String fileName; //파일원본이름
	private String fileText; // 파일 대체 텍스트
	private int fileClassify; //파일분류 (공지게시판{1} 인지 일반게시판{0}인지
	private String fileSequence; //시퀀스
	private String fileRename; //파일 리네임 된 이름
	


}
