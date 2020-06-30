package com.abc.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.abc.beans.User;

@WebServlet("/DiagnosticianController")
public class DiagnosticianController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd;
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
		if (currentUser != null && !currentUser.getWorkGroup().contentEquals("diagnostician")) {
			rd = request.getRequestDispatcher("Dashboard.jsp");
			rd.forward(request, response);
		}
		String action = "";
		action = request.getParameter("action");
		switch (action) {
		case "addDiagnostic":
			rd = request.getRequestDispatcher("diagnosticianJSPs/addDiagnostic.jsp");
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
