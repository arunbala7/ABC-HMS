package com.abc.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.mysql.jdbc.Connection;
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
}
