package semi.project.bookmaroo.admin.book.model.vo;

import java.sql.Date;

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
public class AdminBook {
	private int bookDetailNumber; //도서관리번호
	private String bookISBN; //ISBN
	private String bookName; //도서이름
	private String summary; //상세내용
	private String gmName; //메인장르명
	private String gsName; //서브장르명
	private String author; //저자
	private String publisher; // 출판사
	private Date publication; //발행일자
	private int bookCount; //소장도서수
	private String bookImage; //도서이미지url
	private Date resistDate; // 등록날짜
	private char isReturn; //반납여부
	private Date rentDate; //대출일자
	private Date dueDate; //반납예정일
	private Date returnDate; //반납예정일
	private int rentNo; //대출번호
	private int bookMemNo; //대출자 번호
}
