<%@page import="com.nagarro.models.Book"%>
<%@page import="java.util.Date"%>
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

<title>Book Details</title>
</head>
<body>
	<%
		if (request.getAttribute("page").equals("add")) {
	%>
	<div class="container  mt-5">
		<div class="card mx-auto vcenter ">
			<div class="card-header">
				<h2 class="card-title text-center">ADD A BOOK</h2>
			</div>
			<div class="card-body">
				<form:form action="saveBook" method="post" modelAttribute="book">
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 col-form-label">Book
							Code</label>
						<div class="col-sm-10">
							<form:input path="bookCode" cssClass="form-control"
								id="inputEmail3" placeholder="Enter Book Code" />
						</div>
					</div>

					<div class="form-group row">
						<label for="inputPassword3" class="col-sm-2 col-form-label">Book
							Name</label>
						<div class="col-sm-10">
							<form:input path="bookName" cssClass="form-control"
								id="inputPassword3" placeholder="Enter Book Name" />
						</div>
					</div>

					<fieldset class="form-group row">
						<label for="authorsList" class="col-sm-2 col-form-label">Author
							Name</label>
						<div class="col-sm-10">
							<div class="form-group">
								<form:select path="authName" id="authorsList">
									<option value="Andy Hunt">Andy Hunt</option>
									<option value="Charles Darvin">Charles Darvin</option>
									<option value="Elon Musk">Elon Musk</option>
									<option value="Barbara Liskov">Barbara Liskov</option>
									<option value="HC Verma">HC Verma</option>
								</form:select>
							</div>
						</div>

					</fieldset>

					<div class="form-group row">
						<label for="staticEmail" class="col-sm-2 col-form-label">Added
							On</label>
						<div class="col-sm-10">
							<input type="text" readonly class="form-control-plaintext"
								id="staticEmail" value="<%=new Date()%>">
						</div>
					</div>

					<div class="form-group row">
						<div class="col-sm-10">
							<button type="submit" class="btn btn-success">Submit</button>

							<button type="reset" class="btn btn-danger">Cancel</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<%
		}
	%>
	
	<%
		if (request.getAttribute("page").equals("edit")) {
			Book bk = (Book) request.getAttribute("oneBook");
	%>
	<div class="container  mt-5">
		<div class="card mx-auto vcenter ">
			<div class="card-header">
				<h2 class="card-title text-center">EDIT BOOK</h2>
			</div>
			<div class="card-body">
				<form:form action="saveBook" method="post" modelAttribute="book">
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 col-form-label">Book
							Code</label>
						<div class="col-sm-10">
							<form:input id="inputEmail3" path="bookCode" cssClass="form-control-plaintext" value= "<%= bk.getBookCode()%>"/>
								
							<%--form:input path="bookCode" cssClass="form-control"
								id="inputEmail3" placeholder="Enter Book Code" --%>
						</div>
					</div>

					<div class="form-group row">
						<label for="inputPassword3" class="col-sm-2 col-form-label">Book
							Name</label>
						<div class="col-sm-10">
							<form:input path="bookName" cssClass="form-control"
								id="inputPassword3" value= "<%= bk.getBookName()%>" />
						</div>
					</div>

					<fieldset class="form-group row">
						<label for="authorsList" class="col-sm-2 col-form-label">Author
							Name</label>
						<div class="col-sm-10">
							<div class="form-group">
								<form:select path="authName" id="authorsList">
									<option value="Andy Hunt">Andy Hunt</option>
									<option value="Charles Darvin">Charles Darvin</option>
									<option value="Elon Musk">Elon Musk</option>
									<option value="Barbara Liskov">Barbara Liskov</option>
									<option value="HC Verma">HC Verma</option>
								</form:select>
							</div>
						</div>

					</fieldset>

					<div class="form-group row">
						<label for="staticEmail" class="col-sm-2 col-form-label">Added
							On</label>
						<div class="col-sm-10">
							<input type="text" readonly class="form-control-plaintext"
								id="staticEmail" value= "<%=new Date()%>" >
						</div>
					</div>

					<div class="form-group row">
						<div class="col-sm-10">
							<button type="submit" class="btn btn-success">Submit</button>

							<button type="reset" class="btn btn-danger">Cancel</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>	
	
	
	<%
		}
	%>
</body>
</html>