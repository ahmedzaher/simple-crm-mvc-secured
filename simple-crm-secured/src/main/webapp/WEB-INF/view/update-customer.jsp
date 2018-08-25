<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customers</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" >
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2  >CRM - Customer Relationship Manager</h2>
		</div>

	</div> 
	<div id="container">
		<h3 class="heading">Update Customer</h3> 
		<br>
		 <form:form action="process-add" method="POST" modelAttribute="customer" >
		 <form:hidden path="id"/>
		 	<table>
		 		<tr>
		 			<td>
		 				<form:label path="firstName">First Name</form:label>
		 			</td>
		 			<td><form:input path="firstName" /> </td>
		 			<td><form:errors cssClass="error" path="firstName"></form:errors></td>
		 		</tr>
		 		<tr>
		 			<td><form:label path="lastName" >Last Name</form:label></td>
		 			<td><form:input path="lastName" />  </td>
		 			<td><form:errors cssClass="error" path="lastName"></form:errors></td>
		 		</tr>
		 		<tr>
		 			<td><form:label path="email" >Email</form:label></td>
		 			<td><form:input path="email" /> </td>
		 			<td><form:errors cssClass="error" path="email"></form:errors></td>
		 		</tr>
		 		<tr>
		 			<td></td>
		 			<td><input type="submit" class="btn" value="Update" /> </td> 
		 		</tr>
		 	</table>
		 	
		 	
		 	 
		 	
		 	
		 	
		 </form:form>
		 <a href="list">Back To List</a>
	</div>


</body>
</html>