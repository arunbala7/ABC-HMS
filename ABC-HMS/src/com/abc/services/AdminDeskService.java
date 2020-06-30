package com.abc.services;

import java.util.List;

import com.abc.beans.Medicine;
import com.abc.beans.Patient;
import com.abc.beans.Test;
import com.abc.dao.HospitalDAO;

public class AdminDeskService {

	public static List<Patient> getPatients(int currentPage, int recordsPerPage) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		int start = currentPage * recordsPerPage - recordsPerPage;
		return dao.getPatients(start, recordsPerPage);

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

	public static int getNoOfRows(String tableName) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.getNoOfRows(tableName);
	}

	public static int calculateDays(String patient_date_of_admission) {
		// TODO Auto-generated method stub
		return 0;
	}

	public static long calculateRoom(int numberOfDays, String type_of_room) {
		// TODO Auto-generated method stub
		return 0;
	}

	public static long calculateMedicine(List<Medicine> medicines_issued) {
		// TODO Auto-generated method stub
		return 0;
	}

	public static long calculateTest(List<Test> tests) {
		// TODO Auto-generated method stub
		return 0;
	}

}
