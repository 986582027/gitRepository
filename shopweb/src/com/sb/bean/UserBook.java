package com.sb.bean;

public class UserBook {
	//图书ID
	private int bookId;
	//用户ID
	private int userid;
	//购买数量
	private int bookNum;
	//用户姓名
	private String userName;
	//图书路径名称
	private String bookImage;
	//图书名称
	private String bookName;
	//图书价格
	private double bookPrice;
	//用户手机号
	private String userPhone;
	//用户地址
	private String userAddress;
	//是否购买
	private String isBuy;
	public UserBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getBookNum() {
		return bookNum;
	}
	public void setBookNum(int bookNum) {
		this.bookNum = bookNum;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBookImage() {
		return bookImage;
	}
	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
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
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getIsBuy() {
		return isBuy;
	}
	public void setIsBuy(String isBuy) {
		this.isBuy = isBuy;
	}
	@Override
	public String toString() {
		return "UserBook [bookId=" + bookId + ", userid=" + userid + ", bookNum=" + bookNum + ", userName=" + userName
				+ ", bookImage=" + bookImage + ", bookName=" + bookName + ", bookPrice=" + bookPrice + ", userPhone="
				+ userPhone + ", userAddress=" + userAddress + ", isBuy=" + isBuy + "]";
	}
	
	
}
