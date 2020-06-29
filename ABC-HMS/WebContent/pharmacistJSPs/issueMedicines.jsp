<%@page import="com.abc.beans.Patient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Issue Medicines</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="icon" type="image/png"
	href="CSS and JS/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="CSS and JS/vendor/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="CSS and JS/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="CSS and JS/fonts/iconic/css/material-design-iconic-font.min.css" />
<link rel="stylesheet" type="text/css" href="CSS and JS/css/util1.css" />
<link rel="stylesheet" type="text/css" href="CSS and JS/css/main1.css" />
<script type="text/javascript" src="CSS and JS/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="CSS and JS/js/sweetalert.min.js"></script>
<script type="text/javascript" src="CSS and JS/js/validation.js"></script>
<script type="text/javascript" src="CSS and JS/js/bootstrap.min.js"></script>
<script type="text/javascript" src="CSS and JS/js/tether.min.js"></script>
<script>
	$(document).ready(function() {

		$("#reset").click(function() {
			$("#id").val("");
		});
		
		"use strict";
		//   [ Focus input ]
		$('.input100').each(function() {
			$(this).on('blur', function() {
				if ($(this).val().trim() != "") {
					$(this).addClass('has-val');
				} else {
					$(this).removeClass('has-val');
				}
			})
		})
		
		var input = $('.validate-input .input100');

		$('#Form').on('submit', function(e) {
			var check = true;

			for (var i = 0; i < input.length; i++) {
				if (validate(input[i]) == false) {
					showValidate(input[i]);
					check = false;
				}
			}			
			return check;
		});

		$('.validate-form .input100').each(function() {
			$(this).focus(function() {
				hideValidate(this);
			});
		});

		function validate(input) {
			if ($(input).val().trim() == '')
				return false;			
		}

		function showValidate(input) {
			var thisAlert = $(input).parent();

			$(thisAlert).addClass('alert-validate');
		}

		function hideValidate(input) {
			var thisAlert = $(input).parent();

			$(thisAlert).removeClass('alert-validate');
		}

		function Validate() {
			var thisAlert = this.parent();

			$(thisAlert).addClass('alert-validate');
		}
	});
</script>
</head>
<body
	style="background-image: url('CSS and JS/images/other.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">
	<%@ include file="../pharmacistHeader.jsp"%>
	<div class="container-login100">
		<c:choose>
			<c:when test="${actionType !='show'}">
				<div class="container-login100">
					<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
						<form autocomplete="off" class="login100-form validate-form "
							id="Form" action="PharmacistController" method="post">
							<div class="wrap-input100 validate-input m-b-23"
								data-validate="Enter a Valid Patient Id">
								<span class="label-input100">Patient ID</span> <input
									autocomplete="off" class="input100 form-control" type="text"
									id="id" maxLength="9" name="patient_id"
									placeholder="Enter the ID..." /> <span class="focus-input100"></span>
							</div>
							<input type="hidden" name="action" value="issueMedicines">
							<input type="hidden" name="actionType" value="find">							
						</form>
						<div class="col-md-12 text-center after-id">
								<button class="btn btn-primary active" id="reset">Reset</button>
								&ensp;
								<button type="submit" form="Form" class="btn btn-primary active"
									id="patient_id">Find Patient</button>
							</div>
					</div>
				</div>

			</c:when>
			<c:otherwise>
				<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
					<span class="login100-form-title"
						style="font-size: 20px; color: crimson;">Viewing Patient
						ID: ${patient.getPatient_id()}</span><br />
					<form autocomplete="off" id="patientForm">
						<div class="form-group row">
							<div class="col-sm-6">
								<span class="label-input100">Patient ID</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the id..."
									value="${patient.getPatient_id()}" readonly />
							</div>
							<div class="col-sm-6">
								<span class="label-input100">Name</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the name..."
									value="${patient.getPatient_name()}" readonly />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6">
								<span class="label-input100">Date of Admission</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the Date of Admission"
									value="${patient.getPatient_date_of_admission()}" readonly />
							</div>
							<div class="col-sm-3">
								<span class="label-input100">Age</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the age..."
									value="${patient.getPatient_age()}" readonly />
							</div>
							<div class="col-sm-3">
								<span class="label-input100">Status</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the status..."
									value="${patient.getStatus()}" readonly />
							</div>
						</div>
						<div class="form-group row">

							<div class="col-sm-12">
								<span class="label-input100">Type of Room</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the type of room..."
									value="${patient.getType_of_room()}" readonly />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-12" data-validate="Enter a Valid Address">
								<span class="label-input100">Address</span>
								<textarea class="input100 form-control" form="patientForm"
									placeholder="Enter the address..." readonly>${patient.getAddress()}, ${patient.getCity()}, ${patient.getState()}</textarea>
							</div>
						</div>
						<div class="col-md-12 text-center">
							<a class="btn btn-primary active"
								href="AdminDeskController?action=viewAllPatients&currentPage=${currentPage}">Back</a>
						</div>
					</form>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<%@ include file="../footer.jsp"%>
	<script type="text/javascript" src="CSS and JS/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="CSS and JS/js/validation.js"></script>
	<script type="text/javascript" src="CSS and JS/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="CSS and JS/js/tether.min.js"></script>
</body>
</html>