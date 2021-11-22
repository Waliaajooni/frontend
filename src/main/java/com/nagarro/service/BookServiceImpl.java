package com.nagarro.service;

import java.util.Arrays;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.nagarro.models.Book;

@Service
public class BookServiceImpl {
	
	private static final String GET_ALL_BOOKS_API = "http://localhost:8083/books";
	private static final String GET_BOOK_BY_CODE = "http://localhost:8083/books/{bookCode}";
	private static final String CREATE_BOOK_API = "http://localhost:8083/books";
	private static final String UPDATE_BOOK_API = "http://localhost:8083/books";
	private static final String DELETE_BOOK_API = "http://localhost:8083/books/{bookCode}";
	
	@Autowired
	RestTemplate restTemplate;
	
	public List<Book> getAllBooks() {
		Book[] books = restTemplate.getForObject(GET_ALL_BOOKS_API, Book[].class);
		System.out.println(Arrays.asList(books));
		
		return Arrays.asList(books);
	}
	
	public Book getBook(long bcode) {
		//Book book = restTemplate.getForObject(strinh, responseType, map);
		Book bk = restTemplate.getForObject(GET_BOOK_BY_CODE, Book.class, bcode);
		return bk;
	}
	
	public void updateBook(long bcode) {
		Book bk = getBook(bcode);
		
		restTemplate.put(UPDATE_BOOK_API, bk, Book.class);
	}
	
	public void addBook(long bookCode, String bname, String aname) {
		Book book = new Book();
		book.setBookCode(bookCode);
		book.setBookName(bname);
		book.setAuthName(aname);
		book.setDate(new Date());
		
		restTemplate.postForObject(CREATE_BOOK_API, book, Book.class);
	}
	
	public void deleteBook(long bookId) {
		restTemplate.delete(DELETE_BOOK_API, bookId);
	}

}
