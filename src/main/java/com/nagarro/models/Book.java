package com.nagarro.models;

import java.util.Date;

public class Book {
	long bookCode;

	String bookName;
	String authName;
	Date date;

	public Book(long bookCode, String bookName, String authName, Date date) {
		super();
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.authName = authName;
		this.date = date;
	}

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	public long getBookCode() {
		return bookCode;
	}

	public void setBookCode(long bookCode) {
		this.bookCode = bookCode;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthName() {
		return authName;
	}

	public void setAuthName(String authName) {
		this.authName = authName;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
