package com.abc.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.mysql.jdbc.Connection;
import com.abc.beans.Patient;
import com.abc.beans.User;
import com.abc.utils.DBConnection;

public class HospitalDAO {
	public User isValidUser(User user) throws Exception {
		User new_User = null;
		Connection con = (Connection) DBConnection.getConnection();
		String query = "call is_user(?, ?);";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setString(1, user.getUserName());
		ps.setString(2, user.getPassword());
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			if(rs.getInt(1)!=0)
			new_User = new User(rs.getString(2), null, rs.getString(4), rs.getInt(1));
		}
		DBConnection.closeConnection();
		ps.close();
		return new_User;
	}
	
	public String createPatient(Patient patient) throws Exception {
		String patient_id=null;
		Connection con = (Connection) DBConnection.getConnection();
		String query = "SELECT * FROM patient WHERE `patient_SSN`= ?;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setLong(1, patient.getPatient_SSN());
		ResultSet rs = ps.executeQuery();
		if (rs.next())
			return null;
		query = "INSERT INTO patient(patient_SSN,patient_name, patient_age, type_of_room, address, city, state) VALUES (?, ?, ?, ?, ?, ?, ?);";
		ps = (PreparedStatement) con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
		ps.setLong(1, patient.getPatient_SSN());
		ps.setString(2, patient.getPatient_name());
		ps.setInt(3, patient.getPatient_age());
		ps.setString(4, patient.getType_of_room());	
		ps.setString(5, patient.getAddress());
		ps.setString(6, patient.getCity());
		ps.setString(7, patient.getState());
		ps.executeUpdate();
		rs = ps.getGeneratedKeys();
		if (rs.next())
			patient_id = rs.getLong(1) + "";
		DBConnection.closeConnection();
		ps.close();
		return patient_id;
		
	}

	public Patient getPatient(Long patient_id) throws Exception {
		Patient patient=null;
		Connection con = (Connection) DBConnection.getConnection();
		String query = "SELECT * FROM patient WHERE `patient_id`= ?;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setLong(1, patient_id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			patient=new Patient();
			patient.setPatient_id(patient_id);
			patient.setPatient_name(rs.getString(3));
			patient.setPatient_age(rs.getInt(4));
			patient.setPatient_date_of_admission(rs.getString(5));
			patient.setType_of_room(rs.getString(6));
			patient.setAddress(rs.getString(7));
			patient.setCity(rs.getString(8));
			patient.setState(rs.getString(9));			
		}		
		return patient;
	}

	public boolean updatePatient(Patient patient) throws Exception {
		Connection con = (Connection) DBConnection.getConnection();
		String query = "UPDATE patient SET patient_name = ?, patient_age=?, type_of_room=?,address =?, city=?, state=? WHERE patient_id = ?;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setString(1, patient.getPatient_name());
		ps.setInt(2,patient.getPatient_age());
		ps.setString(3, patient.getType_of_room());
		ps.setString(4, patient.getAddress());
		ps.setString(5, patient.getCity());
		ps.setString(6, patient.getState());
		ps.setLong(7, patient.getPatient_id());
		int row = ps.executeUpdate();
		if(row==1) {
			return true;
		}
		return false;
	}

	public boolean deletePatient(Long patient_id) {
		// TODO Auto-generated method stub
		return false;
	}
}
