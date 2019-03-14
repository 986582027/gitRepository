package com.sb.bean;

public class BookType {
	//图书类型ID
	private int typeId;
	//图书类型名称
	private String typeName;
	public BookType() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	@Override
	public String toString() {
		return "BookType [typeId=" + typeId + ", typeName=" + typeName + "]";
	}
	
}
