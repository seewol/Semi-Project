package semi.project.bookmaroo.book.model.vo;

import java.sql.Date;

public class Book {
	
	private int bookNumber;   //도서관리번호
	private String bookISBN;  //ISBN
	private String bookName;  //도서이름
	private String summary;   //상세내용
	private String gmName;    //메인장르명
	private String gsName;    //서브장르명
	private String author;    //저자
	private String publisher; //출판사
	private Date publication; //발행일자
	private int bookCount;    //소장도서수
	private String bookImage; //도서이미지url
	private Date resistDate;  //등록날짜
	private String isRental;  //대출여부
	private double stars; 		  //별점 평균
	
	public Book() {}
	
	public Book(int bookNumber, String bookISBN, String bookName, String summary, String gmName, String gsName,
			String author, String publisher, Date publication, int bookCount, String bookImage, Date resistDate,
			String isRental, double stars) {
		super();
		this.bookNumber = bookNumber;
		this.bookISBN = bookISBN;
		this.bookName = bookName;
		this.summary = summary;
		this.gmName = gmName;
		this.gsName = gsName;
		this.author = author;
		this.publisher = publisher;
		this.publication = publication;
		this.bookCount = bookCount;
		this.bookImage = bookImage;
		this.resistDate = resistDate;
		this.isRental = isRental;
		this.stars = stars;
	}

	public int getBookNumber() {
		return bookNumber;
	}

	public void setBookNumber(int bookNumber) {
		this.bookNumber = bookNumber;
	}

	public String getBookISBN() {
		return bookISBN;
	}

	public void setBookISBN(String bookISBN) {
		this.bookISBN = bookISBN;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getGmName() {
		return gmName;
	}

	public void setGmName(String gmName) {
		this.gmName = gmName;
	}

	public String getGsName() {
		return gsName;
	}

	public void setGsName(String gsName) {
		this.gsName = gsName;
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

	public Date getPublication() {
		return publication;
	}

	public void setPublication(Date publication) {
		this.publication = publication;
	}

	public int getBookCount() {
		return bookCount;
	}

	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}

	public String getBookImage() {
		return bookImage;
	}

	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}

	public Date getResistDate() {
		return resistDate;
	}

	public void setResistDate(Date resistDate) {
		this.resistDate = resistDate;
	}

	public String getisRental() {
		return isRental;
	}

	public void setisRental(String isRental) {
		this.isRental = isRental;
	}
	
	public double getStars() {
		return stars;
	}

	public void setStars(double stars) {
		this.stars = stars;
	}

	@Override
	public String toString() {
		return "Book [bookNumber=" + bookNumber + ", bookISBN=" + bookISBN + ", bookName=" + bookName + ", summary="
				+ summary + ", gmName=" + gmName + ", gsName=" + gsName + ", author=" + author + ", publisher="
				+ publisher + ", publication=" + publication + ", bookCount=" + bookCount + ", bookImage=" + bookImage
				+ ", resistDate=" + resistDate + ", isRental=" + isRental + ", stars=" + stars + "]";
	}
	
	
	
	
	
	
}
