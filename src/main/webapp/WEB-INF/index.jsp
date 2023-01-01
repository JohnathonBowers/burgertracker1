<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Burger Tracker</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container col-lg-6 mt-4">
		<div class="row">
			<h1 class="text-primary">Burger Tracker</h1>
			<table class="table table-striped table-hover table-bordered my-4">
				<thead>
					<tr class="text-center">
						<th>Burger Name</th>
						<th>Restaurant Name</th>
						<th>Rating (out of 5)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="burger" items="${allBurgers}">
						<tr class="text-center">
							<td><c:out value="${burger.burgerName}"></c:out></td>
							<td><c:out value="${burger.restaurantName}"></c:out></td>
							<td><c:out value="${burger.rating}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="container col-lg-5 mt-4">
		<div class="row">
			<h2 class="text-primary">Add a Burger</h2>
		</div>
		<div class="row mt-4 mb-4">
			<form:form action="/burgers/add" method="POST" modelAttribute="burger">
				<div class="row mb-4">
					<form:label path="burgerName" class="col-sm-3 col-form-label">Burger Name:</form:label>
					<div class="col-sm-9">
						<form:input type="text" class="form-control" path="burgerName"/>
					</div>
					<div class="row">
						<form:errors class="my-4 text-danger" path="burgerName"/>
					</div>
				</div>
				<div class="row mb-4">
					<form:label path="restaurantName" class="col-sm-3 col-form-label">Restaurant Name:</form:label>
					<div class="col-sm-9">
						<form:input type="text" class="form-control" path="restaurantName"/>
					</div>
					<div class="row">
						<form:errors class="my-4 text-danger" path="restaurantName"/>
					</div>
				</div>
				<div class="row mb-4">
					<form:label path="rating" class="col-sm-3 col-form-label">Rating:</form:label>
					<div class="col-sm-9">
						<form:input type="number" class="form-control" path="rating"/>
					</div>
					<div class="row">
						<form:errors class="my-4 text-danger" path="rating"/>
					</div>
				</div>
				<div class="row mb-4">
					<form:label path="notes" class="col-sm-3 col-form-label">Notes:</form:label>
					<div class="col-sm-9">
						<form:textarea class="form-control" path="notes" rows="4"/>
					</div>
					<div class="row">
						<form:errors class="my-4 text-danger" path="notes"/>
					</div>
				</div>
				<div class="row mb-4 justify-content-end">
					<input type="submit" class="btn btn-primary col-sm-2" value="Submit"/>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>