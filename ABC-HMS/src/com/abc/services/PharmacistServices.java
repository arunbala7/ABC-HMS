package com.abc.services;

import java.util.List;

import com.abc.beans.Patient;
import com.abc.beans.Medicine;
import com.abc.dao.HospitalDAO;

public class PharmacistServices {


	public static Patient getPatient(Long patient_id) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.getPatient(patient_id);
	}

	public static List<Medicine> getAllMedicinesIssued(Long patient_id) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.getAllMedicinesIssued(patient_id);
		
	}

}
