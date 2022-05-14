<%@page import="model.UserDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.UserDetailsServiceImpl"%>
<%@page import="service.IUserDetailsService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Details</title>
</head>
<body>
	<jsp:include page="/index.jsp"></jsp:include>

	<%
	IUserDetailsService userService = new UserDetailsServiceImpl();
			ArrayList<UserDetails> userList = userService.getUserDetails();
	%>

	<div class="container-fluid ml-2 mr-2">
		<div class="row mt-5">
			<div class="col-md-12 w-100">
				<div class="card text-dark bg-light w-100 h-100">
					<div class="card-header">
						<div class="row">
							<div class="col-md-5">
								<button type="button" id="btninsert" class="btn btn-primary">Add User</button>
								
							</div>
							
							<div class="col-md-5">
								<button type="search" id="btninsert" class="btn btn-primary">search</button>
								<input type="date" class="" placeholder="" aria-controls="dataTable">
								
							</div>
							<div class="col-md-7">
								<h5 class="card-title mt-1 fw-bold ml-5">User Details</h5>
							</div>
							
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							
							<table id="dataTable" class="display" style="width: 100%">
								<thead>
									<tr>
										<th>ID</th>
										<th>FullName</th>
										<th>Address</th>
										<th>PhoneNo</th>
										<th>Email</th>
										<th>AccNo</th>
										<th></th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>ID</th>
										<th>FullName</th>
										<th>Address</th>
										<th>PhoneNo</th>
										<th>Email</th>
										<th>AccNo</th>
										<th></th>
									</tr>
								</tfoot>
								<tbody>
									<%
									for(UserDetails user : userList){
									%>
									<tr>
										<td class="customer text-uppercase"><%= user.getId() %></td>
										<td class="text-uppercase"><%= user.getName() %></td>
										<td class="text-uppercase"><%= user.getAddress() %></td>
										<td class="text-uppercase"><%= user.getPhone() %></td>
										<td class="text-uppercase"><%= user.getEmail() %></td>
										<td class="text-uppercase"><%= user.getAcc() %></td>
										<td>
											
											<button type="button"
												class="btnupdate btn btn-success btn-circle">
												<i class="fas fa-edit"></i>
											</button>
											<button type="button"
												class="btndelete btn btn-danger btn-circle">
												<i class="fas fa-trash"></i>
											</button>
										</td>
									</tr>
									<% } %>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade bd-example-modal-lg" id="addAndUpdateModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">User Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
						<div class="alert alert-warning" role="alert" id="errorbox">
  							<span class="fw-bold" id="error_customer"></span>
						</div>
						<form id="userForm">
							<input type="text" id="id" hidden="true">
							<div class="row mt-2">
								<div class="col-md-12">
									<label for="name" class="form-label"> First Name</label> <input
										type="text" class="form-control text-uppercase" id="name"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="address" class="form-label">Address</label> <input
										type="text" class="form-control text-uppercase" id="address"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="phone" class="form-label">Phone number</label> <input
										type="text" class="form-control text-uppercase" id="phone" 
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="email" class="form-label">Email</label> <input
										type="text" class="form-control text-uppercase" id="email" 
										required pattern="\d{4}-\d{2}-\d{2}">
								</div>
							</div>
							
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="acc" class="form-label">Account number</label> <input
										type="text" class="form-control text-uppercase" id="acc" 
										required Pattern ="\d{4}">
								</div>
							</div>
							
							<div class="row mt-5 mb-2">
								<div class="col-md-12 d-flex justify-content-center">
									<button type="button" class="btn btn-success w-100"
										id="btnAddAndUpdateModal"></button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

		<div class="modal fade bd-example-modal-lg" id="addAndUpdateModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">User Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
						<div class="alert alert-warning" role="alert" id="errorbox">
  							<span class="fw-bold" id="error_user"></span>
						</div>
						<form id="userForm">
							<input type="text" id="id" hidden="true">
							<div class="row mt-2">
								<div class="col-md-12">
									<label for="name" class="form-label"> First Name</label> <input
										type="text" class="form-control text-uppercase" id="name"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="address" class="form-label">Address</label> <input
										type="text" class="form-control text-uppercase" id="address"
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="phone" class="form-label">Phone number</label> <input
										type="text" class="form-control text-uppercase" id="phone" 
										required>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="email" class="form-label">Email</label> <input
										type="text" class="form-control text-uppercase" id="email" 
										required pattern="\d{4}-\d{2}-\d{2}">
								</div>
							</div>
							
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="acc" class="form-label">Account number</label> <input
										type="text" class="form-control text-uppercase" id="acc" 
										required Pattern ="\d{4}">
								</div>
							</div>
							<div class="row mt-5 mb-2">
								<div class="col-md-12 d-flex justify-content-center">
									<button type="button" class="btn btn-success w-100"
										id="btnAddAndUpdateModal"></button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	


	<script type="text/javascript">
    
	    $(document).ready(function() {
	    	var formState = "";
	    	var table = $('#dataTable').DataTable();
	    	
	    	
	    	function clearError() {
	    		$("#errorbox").hide();
	    		$("#error_user").text("");
	    	}
	    	
	    	function setError(msg) {
    			$("#errorbox").show();
    			$("#error_user").text(msg);
	    	}
	    	
	    	function fnValidation(saveObj) { 
	    		clearError();
	    	
	    		if(!saveObj.name.length > 0) {
	    			setError("Please enter full name!")
	    			return false;
	    		} else if(!saveObj.address.length > 0) {
	    			setError("Please enter adress!")
	    			return false;
	    		} else if(!saveObj.phone.length > 0) {
	    			setError("Please enter phone number!")
	    			return false;
	    		} else if(!saveObj.phone.length != 10) {
	    			setError("Phone number should be 10. Please enter valid phone number!")
	    			return false;
	    		}else if(!saveObj.email.length > 0) {
	    			setError("Please enter email!")
	    			return false;
	    		} else if(!saveObj.acc.length > 0) {
	    			setError("Please enter account number !")
	    			return false;
	    		} else if(!saveObj.acc.length != 4) {
	    			setError("Account number should be 16. Please enter valid Account number!")
	    			return false;
	    		}
	    		
	    		return true;
	    	}
	    	
		    $("#btninsert").click(function() {
		    	clearError();
		    	formState = "NE";
		    	
		    	$('#id').val(""),
				$('#name').val(""),
		        $('#address').val(""),
				$('#phone').val(""),
				$('#email').val(""),
				$('#acc').val(""),
				
				
				$("#userForm :input").prop("disabled", false);
				
		    	$('#btnAddAndUpdateModal').html('Add New User Details');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
		    $('#btnAddAndUpdateModal').click(function() {
		    	if(formState == "NE") {
		    		$("#loader").show();
		    		var objUser = {
		    				id: $('#id').val(),
		    				name: $('#name').val(),
		    				address:$('#address').val(),
							phone:$('#phone').val(),
							email:$('#email').val(),
							acc:$('#acc').val(),
			        		
		    		}
		    	if(fnValidation(objUser)) {
		     	    $.ajax({
		     	        url      : 'http://localhost:8090/user/UserDetails?action=NE',
		     	        method   : 'POST', 
		     	        data     : objUser,
		     	        success  : function(response){
		     	        	formState = "";
		     	        	location.reload();
		     	        	$("#loader").hide();
		     	      	}
		     	    });
		    	}
		    }
		    	else if(formState == "UP") {
		    		$("#loader").show();
		    		var objUser = {
		    				id: $('#id').val(),
		    				name: $('#name').val(),
		    				address:$('#address').val(),
							phone:$('#phone').val(),
							email:$('#email').val(),
							acc:$('#acc').val(),
			        		
		    		}
		    		
		    	if(fnValidation(objUser)) {
		    		$("#loader").show();
		     	    $.ajax({
		     	        url      : 'http://localhost:8090/user/UserDetails?action=UP',
		     	        method   : 'POST', 
		     	        data     : objUser,
		     	        success  : function(response){
		     	        	formState = "";	     	        	
		     	        	location.reload();
		     	        	$("#loader").hide();
		     	      	}
		     	    });
		    	}
		    	}
		    	else if(formState == "DL") {
		    		$("#loader").show();
		    		var objUser = {
		    				id: $('#id').val(),
		    		}
		    		
		     	    $.ajax({
		     	        url      : 'http://localhost:8090/user/UserDetails?action=DL',
		     	        method   : 'POST', 
		     	        data     : objUser,
		     	        success  : function(response){
		     	        	formState = "";
		     	        	location.reload();
		     	        	$("#loader").hide();
		     	      	}
		     	    });
		    	}
		    });
		    
		    $('#dataTable tbody').on( 'click', '.btnupdate', function () {
		        var data = table.row( $(this).parents('tr') ).data();
		       
		        $('#id').val(data[0]),
				$('#name').val(data[1]),
				$('#address').val(data[2]),
				$('#phone').val(data[3]),
				$('#email').val(data[4]),
				$('#acc').val(data[5]),
				
				
				
				$("#userForm :input").prop("disabled", false);
				
		    	formState = "UP";
		    	$('#btnAddAndUpdateModal').html('Update User Details');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
		    $('#dataTable tbody').on( 'click', '.btndelete', function () {
		        var data = table.row( $(this).parents('tr') ).data();
		        

		        $('#id').val(data[0]),
				$('#name').val(data[1]),
				$('#address').val(data[2]),
				$('#phone').val(data[3]),
				$('#email').val(data[4]),
				$('#acc').val(data[5]),
				
				$("#userForm :input").prop("disabled", true);
				$("#btnAddAndUpdateModal").prop("disabled", false);
				
		    	formState = "DL";
		    	$('#btnAddAndUpdateModal').html('Delete User');
		    	$('#addAndUpdateModal').modal('toggle');
		    });
		    
	    });
	    
    </script>

</body>
</html>