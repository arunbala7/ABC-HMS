package com.abc.services;

import java.util.List;

import com.abc.beans.Patient;
import com.abc.dao.HospitalDAO;

public class AdminDeskService {

	public static List<Patient> getPatients(int currentPage, int recordsPerPage) {
		return null;
	
	}


	public static String createPatient(Patient newPatient) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.createPatient(newPatient);
		
		// TODO Auto-generated method stub
		
	}

}
