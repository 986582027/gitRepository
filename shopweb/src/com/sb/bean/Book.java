package com.sb.bean;

import java.util.Date;

public class Book {
	//图书ID
	private int bookId;
	//图书名称
	private String bookName;
	//图书价格
	private double bookPrice;
	//图书简介
	private String bookIntroduce;
	//上架时间
	private Date bookTime;
	//图书作者
	private String bookAuthor;
	//图书状态（已上架，已下架）
	private String bookState;
	//图片地址名称
	private String bookImage;
	//图书售出数量
	private int bookSell;
	//浏览量
	private int glanceNumber;
	//图书类型（外键）
	private int typeId;
	public Book() {
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
	public double getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(double bookPrice) {
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
	public String getBookState() {
		return bookState;
	}
	public void setBookState(String bookState) {
		this.bookState = bookState;
	}
	public String getBookImage() {
		return bookImage;
	}
	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}
	public int getBookSell() {
		return bookSell;
	}
	public void setBookSell(int bookSell) {
		this.bookSell = bookSell;
	}
	public int getGlanceNumber() {
		return glanceNumber;
	}
	public void setGlanceNumber(int glanceNumber) {
		this.glanceNumber = glanceNumber;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", bookName=" + bookName + ", bookPrice=" + bookPrice + ", bookIntroduce="
				+ bookIntroduce + ", bookTime=" + bookTime + ", bookAuthor=" + bookAuthor + ", bookState=" + bookState
				+ ", bookImage=" + bookImage + ", bookSell=" + bookSell + ", glanceNumber=" + glanceNumber + ", typeId="
				+ typeId + "]";
	}
	
}
