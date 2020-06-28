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
}
