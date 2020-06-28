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

	}

	public static Patient getPatient(Long patient_id) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.getPatient(patient_id);
	}

	public static boolean updatePatient(Patient patient) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.updatePatient(patient);	

	}

	public static boolean deletePatient(Long patient_id) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.deletePatient(patient_id);	
	}

}
