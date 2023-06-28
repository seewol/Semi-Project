package semi.project.bookmaroo.book.model.vo;

import java.sql.Date;

public class BookCheck {
	
	private int rentNumber;
	private int memberNumber;
	private int bdNumber;
	private Date rentDate;
	private Date dueDate;
	private Date returnDate;
	private String isReturn;
	private int bookNumber;
	private String bookName;  //도서이름
	private String author;    //저자
	private String publisher; //출판사
	private String bookImage; //도서이미지url
	
	public BookCheck() {}

	public BookCheck(int rentNumber, int memberNumber, int bdNumber, Date rentDate, Date dueDate, Date returnDate,
			String isReturn, int bookNumber, String bookName, String author, String publisher, String bookImage) {
		super();
		this.rentNumber = rentNumber;
		this.memberNumber = memberNumber;
		this.bdNumber = bdNumber;
		this.rentDate = rentDate;
		this.dueDate = dueDate;
		this.returnDate = returnDate;
		this.isReturn = isReturn;
		this.bookNumber = bookNumber;
		this.bookName = bookName;
		this.author = author;
		this.publisher = publisher;
		this.bookImage = bookImage;
	}

	public int getRentNumber() {
		return rentNumber;
	}

	public void setRentNumber(int rentNumber) {
		this.rentNumber = rentNumber;
	}

	public int getMemberNumber() {
		return memberNumber;
	}

	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}

	public int getBdNumber() {
		return bdNumber;
	}

	public void setBdNumber(int bdNumber) {
		this.bdNumber = bdNumber;
	}

	public Date getRentDate() {
		return rentDate;
	}

	public void setRentDate(Date rentDate) {
		this.rentDate = rentDate;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public String getIsReturn() {
		return isReturn;
	}

	public void setIsReturn(String isReturn) {
		this.isReturn = isReturn;
	}

	public int getBookNumber() {
		return bookNumber;
	}

	public void setBookNumber(int bookNumber) {
		this.bookNumber = bookNumber;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getBookImage() {
		return bookImage;
	}

	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}

	@Override
	public String toString() {
		return "BookCheck [rentNumber=" + rentNumber + ", memberNumber=" + memberNumber + ", bdNumber=" + bdNumber
				+ ", rentDate=" + rentDate + ", dueDate=" + dueDate + ", returnDate=" + returnDate + ", isReturn="
				+ isReturn + ", bookNumber=" + bookNumber + ", bookName=" + bookName + ", author=" + author
				+ ", publisher=" + publisher + ", bookImage=" + bookImage + "]";
	}
	
	
	
	
	
	
}
