package com.abc.beans;

public class Medicine {
	private String medicineName;
	private int medicineId, quantityIssued, medicinePrice,quantityAvailable;
	private long patient_id;

	

	@Override
	public String toString() {
		return "Medicine [medicineName=" + medicineName + ", medicineId=" + medicineId + ", quantityIssued="
				+ quantityIssued + ", medicinePrice=" + medicinePrice + ", quantityAvailable=" + quantityAvailable
				+ ", patient_id=" + patient_id + "]";
	}

	/**
	 * @return the medicineName
	 */
	public String getMedicineName() {
		return medicineName;
	}

	/**
	 * @param medicineName the medicineName to set
	 */
	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}

	/**
	 * @return the medicineId
	 */
	public int getMedicineId() {
		return medicineId;
	}

	/**
	 * @param medicineId the medicineId to set
	 */
	public void setMedicineId(int medicineId) {
		this.medicineId = medicineId;
	}

	/**
	 * @return the quantityIssued
	 */
	public int getQuantityIssued() {
		return quantityIssued;
	}

	/**
	 * @param quantityIssued the quantityIssued to set
	 */
	public void setQuantityIssued(int quantityIssued) {
		this.quantityIssued = quantityIssued;
	}

	/**
	 * @return the medicinePrice
	 */
	public int getMedicinePrice() {
		return medicinePrice;
	}

	/**
	 * @param medicinePrice the medicinePrice to set
	 */
	public void setMedicinePrice(int medicinePrice) {
		this.medicinePrice = medicinePrice;
	}

	/**
	 * @return the patient_id
	 */
	public long getPatient_id() {
		return patient_id;
	}

	/**
	 * @param patient_id the patient_id to set
	 */
	public void setPatient_id(long patient_id) {
		this.patient_id = patient_id;
	}

	/**
	 * @return the quantityAvailable
	 */
	public int getQuantityAvailable() {
		return quantityAvailable;
	}

	/**
	 * @param quantityAvailable the quantityAvailable to set
	 */
	public void setQuantityAvailable(int quantityAvailable) {
		this.quantityAvailable = quantityAvailable;
	}
	
	

}
