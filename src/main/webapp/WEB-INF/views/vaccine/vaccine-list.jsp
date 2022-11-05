<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vaccine List</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/reseter.css/1.0.8/reseter.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
	 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Open+Sans|Sofia|Trirong">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/VaccineList.css">

</head>
<body>
	<div class="container-fluid ">
		<nav class="row topnavbar py-1">
			<a href="index.html" class="navbar-brand ml-3 mr-auto"><img
				class="img" src="../../asserts/img/logo.png"></a>
		</nav>
		<div class="row">
			<div class="col-sm-3 border-right left" id="accordion">
				<div class="list-group list-group-flush">
					<div class="list-group-item text-white profile">
						<div>
							<img class="img-admin" src="../../asserts/img/admin.png">
						</div>
						<div class="mt-1">Admin</div>
						<div class="mt-1">admin@fsoft.com.vn</div>
					</div>
					<div class="menu">
						<div class="list-group-item text font-weight-bold act">Home</div>
						<div class="list-group-item">
							<div class="row text act" data-toggle="collapse"
								data-target="#employee">
								<div class="col-sm-10 font-weight-bold ">Employee
									Management</div>
								<div class="col-sm-2">
									<i class="fa-solid fa-plus"></i>
								</div>
							</div>
							<div class="mt-3 collapse" id="employee" data-parent="#accordion">
								<div class="ml-4 text-sub">
									<a class="text-reset text-decoration-none " href="#"> <span
										class="ml-2">Employee List</span>
									</a>
								</div>
								<div class="ml-4 mt-2 text-sub">
									<a class="text-reset text-decoration-none " href="#"> <span
										class="ml-2">Create Employee</span>
									</a>
								</div>
							</div>
						</div>
						<div class="list-group-item">
							<div class="row text act" data-toggle="collapse"
								data-target="#customer">
								<div class="col-sm-10 font-weight-bold ">Customer
									Management</div>
								<div class="col-sm-2">
									<i class="fa-solid fa-plus"></i>
								</div>
							</div>
							<div class="mt-3 collapse" id="customer" data-parent="#accordion">
								<div class="ml-4 text-sub">
									<a class="text-reset text-decoration-none " href="#"> <span
										class="ml-2">Customer List</span>
									</a>
								</div>
								<div class="ml-4 mt-2 text-sub">
									<a class="text-reset text-decoration-none " href="#"> <span
										class="ml-2">Create Customer</span>
									</a>
								</div>
							</div>
						</div>
						<div class="list-group-item">
							<div class="row text act" data-toggle="collapse"
								data-target="#vaccineType">
								<div class="col-sm-10 font-weight-bold ">Vaccine Type
									Management</div>
								<div class="col-sm-2">
									<i class="fa-solid fa-plus"></i>
								</div>
							</div>
							<div class="mt-3 collapse" id="vaccineType"
								data-parent="#accordion">
								<div class="ml-4 text-sub">
									<a class="text-reset text-decoration-none" href="#"> <span
										class="ml-2">Vaccine Type List</span>
									</a>
								</div>
								<div class="ml-4 mt-2 text-sub">
									<a class="text-reset text-decoration-none" href="#"> <span
										class="ml-2">Vaccine Type Employee</span>
									</a>
								</div>
							</div>
						</div>
						<div class="list-group-item">
							<div class="row text act" data-toggle="collapse"
								data-target="#vaccine">
								<div class="col-sm-10 font-weight-bold ">Vaccine
									Management</div>
								<div class="col-sm-2">
									<i class="fa-solid fa-plus"></i>
								</div>
							</div>
							<div class="mt-3 collapse" id="vaccine" data-parent="#accordion">
								<div class="ml-4 text-sub">
									<a class="text-reset text-decoration-none"
										href="${pageContext.request.contextPath}/vaccine/list"> <span
										class="ml-2">Vaccine List</span>
									</a>
								</div>
								<div class="ml-4 mt-2 text-sub">
									<a class="text-reset text-decoration-none " href="${pageContext.request.contextPath}/vaccine/add"> <span
										class="ml-2">Create Vaccine</span>
									</a>
								</div>
							</div>
						</div>
						<div class="list-group-item">
							<div class="row text act" data-toggle="collapse"
								data-target="#inject">
								<div class="col-sm-10 font-weight-bold ">Injection
									Schedule</div>
								<div class="col-sm-2">
									<i class="fa-solid fa-plus"></i>
								</div>
							</div>
							<div class="mt-3 collapse" id="inject" data-parent="#accordion">
								<div class="ml-4 text-sub">
									<a class="text-reset text-decoration-none " href="#"> <span
										class="ml-2">Injection Schedule List</span>
									</a>
								</div>
								<div class="ml-4 mt-2 text-sub">
									<a class="text-reset text-decoration-none " href="#"> <span
										class="ml-2">Create Injection Schedule</span>
									</a>
								</div>
							</div>
						</div>
						<div class="list-group-item">
							<div class="row text act" data-toggle="collapse"
								data-target="#injectResult">
								<div class="col-sm-10 font-weight-bold ">Injection Result</div>
								<div class="col-sm-2">
									<i class="fa-solid fa-plus"></i>
								</div>
							</div>
							<div class="mt-3 collapse" id="injectResult"
								data-parent="#accordion">
								<div class="ml-4 text-sub">
									<a class="text-reset text-decoration-none" href="#"> <span
										class="ml-2">Injection Result List</span>
									</a>
								</div>
								<div class="ml-4 mt-2 text-sub">
									<a class="text-reset text-decoration-none " href="#"> <span
										class="ml-2">Create Injection Result</span>
									</a>
								</div>
							</div>
						</div>
						<div class="list-group-item">
							<div class="row text act" data-toggle="collapse"
								data-target="#news">
								<div class="col-sm-10 font-weight-bold ">News</div>
								<div class="col-sm-2">
									<i class="fa-solid fa-plus"></i>
								</div>
							</div>
							<div class="mt-3 collapse" id="news" data-parent="#accordion">
								<div class="ml-4 text-sub">
									<a class="text-reset text-decoration-none " href="#"> <span
										class="ml-2">News List</span>
									</a>
								</div>
								<div class="ml-4 mt-2 text-sub">
									<a class="text-reset text-decoration-none " href="#"> <span
										class="ml-2">Create News</span>
									</a>
								</div>
							</div>
						</div>
						<div class="list-group-item">
							<div class="row text act" data-toggle="collapse"
								data-target="#report">
								<div class="col-sm-10 font-weight-bold ">Report</div>
								<div class="col-sm-2">
									<i class="fa-solid fa-plus"></i>
								</div>
							</div>
							<div class="mt-3 collapse" id="report" data-parent="#accordion">
								<div class="ml-4 text-sub">
									<a class="text-reset text-decoration-none " href="#"> <span
										class="ml-2">Report Customer</span>
									</a>
								</div>
								<div class="ml-4 mt-2 text-sub">
									<a class="text-reset text-decoration-none" href="#"> <span
										class="ml-2">Report Vaccine</span>
									</a>
								</div>
							</div>
						</div>
					</div>



				</div>

			</div>
			<div class="col-sm-9 bg-light right">
			<div
					class="h5 mt-3 text-center text-secondary font-weight-bold mb-3">LIST
					VACCINE</div>
					<span class="msg">${msg}</span>
					
				<div class="card-body">
					<div class="row">
						<div class="col-sm-3 form-inline">
							<span>Show</span> <select
								class="form-select mx-2 border-right-0 border-top-0 border-left-0"
								id="inlineFormCustomSelect" name="showNumberList" onchange="location = this.value;">
								<option selected></option>
								<option value="${pageContext.request.contextPath}/vaccine/list?size=5&search=${nameSearch}">5</option>
								<option value="${pageContext.request.contextPath}/vaccine/list?size=10&search=${nameSearch}">10</option>
								<option value="${pageContext.request.contextPath}/vaccine/list?size=15&search=${nameSearch}">15</option>
							</select> <span>entities</span>
						</div>
						<div class="col-sm-6"></div>
						<div class="col-sm-3">
							<form action="${pageContext.request.contextPath}/vaccine/search/" method="post">
								<div class="input-group ">
									<input type="search"
										class="form-control border-right-0 border-top-0 border-left-0 form-select"
										placeholder="Search" aria-label="Search"
										aria-describedby="search-addon" / name="searchVaccine">
									<button type="submit"
										class="input-group-text border-0 bg-white" id="search-addon">
										<i class="fas fa-search"></i>
									</button>
								</div>
							</form>
						</div>
					</div>
					<table class="table table-striped table-bordered text-center"
						id="table-IR">
						<thead class="table-thead">
							<tr>
								<th><input type="checkbox" id="checkAll"></th>
								<th>Vaccine Id</th>
								<th>Vaccine Name</th>
								<th>Vaccine Type</th>
								<th>Number of Injection</th>
								<th>Origin</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${vaccineList.content}" var="result">
								<tr>
									<td><input type="checkbox" value="${result.id}" name="id"></td>
									<td><a href="${pageContext.request.contextPath}/vaccine/update/${result.id}">${result.id}</td>
									<td>${result.vaccineName}</td>
									<td>${result.vaccineType.vaccineTypeName}</td>
									<td>${result.numberOfInjection}</td>
									<td>${result.origin}</td>
									<c:if test="${result.status=='true'}">
									<td id="status" class="status" value="Active">Active</td>
									</c:if>
									<c:if test="${result.status=='false'}">
									<td id="status" class="status" value="In-Active">In-Active</td>
									</c:if>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row mt-4">
						<div class="col-sm-3">
						
							<span>Showing ${firstElement} to ${lastElement} of ${vaccineList.totalElements} entities</span>
						</div>
						<div class="col-sm-6"></div>
						<div class="col-sm-3">
							<nav aria-label="Page">
								<ul class="pagination">
									<li class="page-item"><a class="page-link"
										href="/vaccine/list?p=${vaccineList.number - 1}&size=${vaccineList.size}&search=${nameSearch}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											<span class="sr-only">Previous</span>
									</a></li>
									<li class="page-item"><a class="page-link"
										href="/vaccine/list?p=0&size=${vaccineList.size}&search=${nameSearch}">1</a></li>
									<li class="page-item"><a class="page-link"
										href="/vaccine/list?p=1&size=${vaccineList.size}&search=${nameSearch}">2</a></li>
									<li class="page-item"><a class="page-link"
										href="/vaccine/list?p=${vaccineList.number + 1}&size=${vaccineList.size}&search=${nameSearch}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											<span class="sr-only">Next</span>
									</a></li>
								</ul>
							</nav>
						</div>
					</div>
					
					<div class="list-button">
						<button class="btn btn-success" type="submit">
							<a href="${pageContext.request.contextPath}/vaccine/add"
								class="text-white">Create Vaccine</a>
						</button>
						<button class="btn btn-warning" type="submit" onclick="updateButton()">
							Update Vaccine
						</button>
						<button class="btn btn-danger" type="submit" id="make-in-active-button">Make In-Active</button>
					</div>
				</div>

			</div>
		</div>

		<script src="${pageContext.request.contextPath}/js/ListVaccine.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
			integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
			crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>