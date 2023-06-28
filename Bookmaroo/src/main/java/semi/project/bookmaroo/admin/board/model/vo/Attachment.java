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
	
	private int fileNo; //÷������ ��ȣ
	private String fileUrl; //÷������ ���
	private String fileType; //÷������ Ȯ����
	private String fileName; //���Ͽ����̸�
	private String fileText; // ���� ��ü �ؽ�Ʈ
	private int fileClassify; //���Ϻз� (�����Խ���{1} ���� �ϹݰԽ���{0}����
	private String fileSequence; //������
	private String fileRename; //���� ������ �� �̸�
	


}
