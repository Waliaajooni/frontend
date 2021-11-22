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

<title>Login Page</title>
</head>
<body>

	<div class="container mt-5">
		<div class="card mx-auto vcenter ">
			<div class="card-header">
				<h2 class="card-title">Login</h2>
			</div>
			<div class="card-body">
				<c:if test="${param.error != null}">
					<div class="alert alert-danger" role="alert">Invalid User</div>
				</c:if>

				<form:form action="perform_login" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">Username</label> <input
							name="username" required type="text" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp"
							placeholder="Enter username">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							required name="password" type="password" class="form-control"
							id="exampleInputPassword1" placeholder="Password">
					</div>
					<button type="submit" class="btn btn-primary">Login</button>
				</form:form>
			</div>
		</div>
	</div>

</body>
</html>