package com.nagarro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nagarro.models.Book;
import com.nagarro.service.BookServiceImpl;

@Controller
public class HomeController {
	
	@Autowired
	BookServiceImpl bookServiceImpl;
	
	@GetMapping("/home")
	public String home(Model m) {
		List<Book> list = bookServiceImpl.getAllBooks();
		m.addAttribute("list", list);
		
		return "home";
	}
	
	@GetMapping("/books")
	public List<Book> getAllBooks() {
		return bookServiceImpl.getAllBooks();
	}
	
	@GetMapping("/books/{bookCode}")
	public void deleteBook(@PathVariable long bookCode) {
		bookServiceImpl.deleteBook(bookCode);
	}
	
	@RequestMapping(value = "/deleteBook", method = RequestMethod.POST)
	public String deleteBooks(@RequestParam("srno") long bookId) {
		bookServiceImpl.deleteBook(bookId);
		
		//System.out.print(bcode);
		
		return "redirect:home";
	}
	
	@RequestMapping(value = "/editBook", method = RequestMethod.POST)
	public String editBook(@ModelAttribute("book") Book b, @RequestParam("srno") long bookId, Model m) {
		m.addAttribute("page", "edit");
		Book bk = bookServiceImpl.getBook(bookId);
		
		m.addAttribute("oneBook", bk);
		return "bookDetails";
	}
	
	@RequestMapping(value = "/addBook", method = RequestMethod.POST)
	public String addBook(@ModelAttribute("book") Book b, Model m) {
		m.addAttribute("page", "add");
		
		return "bookDetails";
	}
	
	
	@RequestMapping(value = "/saveBook", method = RequestMethod.POST)
	public String saveBooks(@ModelAttribute("book") Book b, Model m) {
		bookServiceImpl.addBook(b.getBookCode(), b.getBookName(), b.getAuthName());
		m.addAttribute("book", b);
		
		return "redirect:home";
	}
}
