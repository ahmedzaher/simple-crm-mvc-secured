<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customers</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" >
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>

	</div>
	<div id="container">
		<a href="show-add"><button class="btn btn-add">New Customer</button></a>
		<form:form action="process-search" method="GET">
			<input type="text" name="query" placeholder="Customer Name" class="input-search"/> &nbsp; &nbsp;
			<button  class="btn" > Search </button>
		</form:form>
		<br/><br>
		<table border="0" class="customers-wrapper">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				
				<c:forEach items="${customers}" var="customer">
					<c:url var="updateLink" value="show-update">
						<c:param name="customer-id" value="${customer.id}"/>
					</c:url>
					<c:url var="deleteLink" value="process-delete">
						<c:param name="customer-id">${customer.id}</c:param>
					</c:url>
					<tr>
						<td>${ customer.firstName }</td>
						<td>${ customer.lastName }</td>
						<td>${ customer.email }</td>
						<td>
							<a href="${updateLink}"  >Update</a>|
							<a href="${deleteLink}" onclick="return deleteCustomer()"  >Delete</a>
						</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
		function deleteCustomer() {
			return confirm("Sure ?");  
		}
	</script>

</body>
</html>