package com.abc.beans;

public class medicine {
	private int issue_id,medicine_id,quantity_issued;
	private long patient_id;
	
	
	
	@Override
	public String toString() {
		return "medicines_issued [issue_id=" + issue_id + ", medicine_id=" + medicine_id + ", quantity_issued="
				+ quantity_issued + ", patient_id=" + patient_id + "]";
	}
	
	public int getIssue_id() {
		return issue_id;
	}
	public void setIssue_id(int issue_id) {
		this.issue_id = issue_id;
	}
	public int getMedicine_id() {
		return medicine_id;
	}
	public void setMedicine_id(int medicine_id) {
		this.medicine_id = medicine_id;
	}
	public int getQuantity_issued() {
		return quantity_issued;
	}
	public void setQuantity_issued(int quantity_issued) {
		this.quantity_issued = quantity_issued;
	}
	public long getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(long patient_id) {
		this.patient_id = patient_id;
	}

}
