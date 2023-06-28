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
	private int bookDetailNumber; //����������ȣ
	private String bookISBN; //ISBN
	private String bookName; //�����̸�
	private String summary; //�󼼳���
	private String gmName; //�����帣��
	private String gsName; //�����帣��
	private String author; //����
	private String publisher; // ���ǻ�
	private Date publication; //��������
	private int bookCount; //���嵵����
	private String bookImage; //�����̹���url
	private Date resistDate; // ��ϳ�¥
	private char isReturn; //�ݳ�����
	private Date rentDate; //��������
	private Date dueDate; //�ݳ�������
	private Date returnDate; //�ݳ�������
	private int rentNo; //�����ȣ
	private int bookMemNo; //������ ��ȣ
}
