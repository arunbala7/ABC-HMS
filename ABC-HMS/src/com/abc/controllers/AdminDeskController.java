package com.abc.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.abc.beans.Patient;
import com.abc.beans.User;
import com.abc.services.AdminDeskService;


@WebServlet(description = "admin desk executive controller", urlPatterns = { "/AdminDesk" })
public class AdminDeskController extends HttpServlet {
	private static final long serialVersionUID = 1L;

  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd;
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
		if(!currentUser.getWorkGroup().contentEquals("adminDesk")) {
			rd = request.getRequestDispatcher("Dashboard.jsp");
			rd.forward(request, response);
		}
		String action ="";
		action = request.getParameter("action");
		
		switch (action) {
		case "createPatient":
			rd = request.getRequestDispatcher("admindeskJSPs/createPatient.jsp");
			rd.forward(request, response);
			break;
		case "updatePatient":
			rd = request.getRequestDispatcher("admindeskJSPs/updatePatient.jsp");
			rd.forward(request, response);
			break;
		case "deletePatient":
			rd = request.getRequestDispatcher("admindeskJSPs/deletePatient.jsp");
			rd.forward(request, response);
			break;
		case "viewAllPatients":
			// pagination
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			int recordsPerPage = 5;
			List<Patient> patients = null;
			patients = (List<Patient>) AdminDeskService.getPatients(currentPage, recordsPerPage);
			
			
			
			rd = request.getRequestDispatcher("admindeskJSPs/viewAllPatients.jsp");
			rd.forward(request, response);
			break;
		case "searchPatient":
			rd = request.getRequestDispatcher("admindeskJSPs/searchPatient.jsp");
			rd.forward(request, response);
			break;

		case "findBilling":
			rd = request.getRequestDispatcher("admindeskJSPs/findBilling.jsp");
			rd.forward(request, response);
			break;
		case "about":
			rd = request.getRequestDispatcher("about.jsp");
			rd.forward(request, response);
			break;

		default:
			rd = request.getRequestDispatcher("Dashboard.jsp");
			rd.forward(request, response);
			break;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
