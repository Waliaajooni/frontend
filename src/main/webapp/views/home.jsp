<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.nagarro.models.Book"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title>Home Page</title>
</head>
<body>
<div class = "container mt-4">
	<h1 class = "text-center">Library Management</h1>

	<form:form action = "perform_logout">
		<button type="submit" class="btn btn-danger">Logout</button>
	</form:form>
	
	<div align="right">
		<form:form action = "addBook" method = "post">
			<input type="hidden" name="srno" value = 0>
			<button type="submit" class="btn btn-primary">Add Book</button>
		</form:form>
	</div>

	<h1 class="text-center">Books Listing</h1>
	<!-- List of books -->
	<div align="center">
		<table class="table table-bordered">

			<tr>
				<th scope="col">Book Code</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Date Added</th>
				<th scope="col">Actions</th>

			</tr>
			<%
				String bname, aname;
				long bcode;
				Date date;
			
				List<Book> books = (List<Book>) request.getAttribute("list");
				for (Book book : books) {
					bname = book.getBookName();
					bcode = book.getBookCode();
					aname = book.getAuthName();
					date = book.getDate();
			%>
			<tr>
				<td><%= bcode%></td>
				<td><%= bname%></td>
				<td><%= aname%></td>
				<td><%= date%></td>
				<td>
					<div class="">
						<form:form action = "editBook" method="post" modelAttribute = "book">
							<input type="hidden" name="srno" value = <%= bcode%> >
							<button type="submit" class="m-4 btn btn-warning">Edit</button>
						</form:form>
						
						<form:form action = "deleteBook" method="post">
							<input type="hidden" name="srno" value = <%= bcode%> >
							<button type="submit" class="m-4 btn btn-danger">Delete</button>
						</form:form>

					</div>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	</div>

</body>
</html>