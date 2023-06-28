package semi.project.bookmaroo.admin.model.vo;

public class Books {
	private String isbn;
	private String title;
	private String authors;
	private String publisher;
	private String datetime;
	private String price;
	private String contents;
	private String isRental;
	private String thumbnail;
	private String location;
	private String gmCode;
	
	public Books() {}

	public Books(String isbn, String title, String authors, String publisher, String datetime, String price,
			String contents, String isRental, String thumbnail, String location, String gmCode) {
		super();
		this.isbn = isbn;
		this.title = title;
		this.authors = authors;
		this.publisher = publisher;
		this.datetime = datetime;
		this.price = price;
		this.contents = contents;
		this.isRental = isRental;
		this.thumbnail = thumbnail;
		this.location = location;
		this.gmCode = gmCode;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthors() {
		return authors;
	}

	public void setAuthors(String authors) {
		this.authors = authors;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getIsRental() {
		return isRental;
	}

	public void setIsRental(String isRental) {
		this.isRental = isRental;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getGmCode() {
		return gmCode;
	}

	public void setGmCode(String gmCode) {
		this.gmCode = gmCode;
	}

	@Override
	public String toString() {
		return "Book [isbn=" + isbn + ", title=" + title + ", authors=" + authors + ", publisher=" + publisher
				+ ", datetime=" + datetime + ", price=" + price + ", contents=" + contents + ", isRental=" + isRental
				+ ", thumbnail=" + thumbnail + ", location=" + location + ", gmCode=" + gmCode + "]";
	}

	
}
