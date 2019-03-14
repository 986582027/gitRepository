package com.sb.admin.bean;

import java.util.Date;

public class AdminVO {

	private int bookId;
	private String bookName;
	private Double bookPrice;
	private String bookIntroduce;
	private Date bookTime;
	private String bookAuthor;
	private String bookTypeName;
	private String bookState;
	public AdminVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public Double getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(Double bookPrice) {
		this.bookPrice = bookPrice;
	}
	public String getBookIntroduce() {
		return bookIntroduce;
	}
	public void setBookIntroduce(String bookIntroduce) {
		this.bookIntroduce = bookIntroduce;
	}
	public Date getBookTime() {
		return bookTime;
	}
	public void setBookTime(Date bookTime) {
		this.bookTime = bookTime;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public String getBookTypeName() {
		return bookTypeName;
	}
	public void setBookTypeName(String bookTypeName) {
		this.bookTypeName = bookTypeName;
	}
	public String getBookState() {
		return bookState;
	}
	public void setBookState(String bookState) {
		this.bookState = bookState;
	}
	@Override
	public String toString() {
		return "AdminVO [bookId=" + bookId + ", bookName=" + bookName + ", bookPrice=" + bookPrice + ", bookIntroduce="
				+ bookIntroduce + ", bookTime=" + bookTime + ", bookAuthor=" + bookAuthor + ", bookTypeName="
				+ bookTypeName + ", bookState=" + bookState + "]";
	}
	
	
}
