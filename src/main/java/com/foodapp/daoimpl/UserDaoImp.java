package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.dao.UserDAO;
import com.foodapp.model.User;
import com.foodapp.utility.DBConnection;

public class UserDaoImp implements UserDAO {
	
	private static final String Insert_Query="Insert into user(name,email,password,address,role,login_time) values(?,?,?,?,?,?)";
	private static final String Update_Query="Update user set name=?,email=?,password=?,"
			+ "address=?,login_time=? where userid=?";
	private static final String Select_Query="Select * from user where userid= ?";
	private static final String Select_All_Query = "select *from user";
	private static final String Delete_Query = "delete from user where userid =?";
	
	
	
	@Override
	public void addUser(User u) {
		Connection connection=DBConnection.getConnection();
		
		try {
		PreparedStatement ptsmt=connection.prepareStatement(Insert_Query);
		ptsmt.setString(1, u.getUserName());
		ptsmt.setString(2, u.getEmail());
		ptsmt.setString(3, u.getPassword());
		ptsmt.setString(4, u.getAddress());
		ptsmt.setString(5, u.getRole());
		ptsmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
		
		int i=ptsmt.executeUpdate();
		System.out.println(i);
		
		
		}catch(SQLException e) {
			e.printStackTrace();
		}		
	}

	@Override
	public void updateUser(User u) {
		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement ptsmt = con.prepareStatement(Update_Query);
			ptsmt.setString(1, u.getUserName());
			ptsmt.setString(2, u.getEmail());
			ptsmt.setString(3, u.getPassword());
			ptsmt.setString(4, u.getAddress());
			ptsmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			ptsmt.setInt(6, u.getId());
			
			int i = ptsmt.executeUpdate();
			System.out.println(i);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteUser(int id) {
		Connection con = DBConnection.getConnection();
		User u=null;
		try {
			PreparedStatement pstmt = con.prepareStatement(Delete_Query);
			pstmt.setInt(1, id);
			int i = pstmt.executeUpdate();
			System.out.println(i);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public User getUser(int id) {
		Connection con = DBConnection.getConnection();
		User u=null;
		try {
			PreparedStatement pstmt = con.prepareStatement(Select_Query);
			
			pstmt.setInt(1, id);
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				u = printres(res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public List<User> getAllUser() {
		List<User> list = new ArrayList<User>();
		Connection con = DBConnection.getConnection();
		try {
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery(Select_All_Query);
			while(res.next()) {
				User u = printres(res);
				list.add(u);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	
	private static User printres(ResultSet res) throws SQLException{
		int userid=res.getInt("userId");
		String name = res.getString("name");
		String password = res.getString("password");
		String email = res.getString("email");
		String address = res.getString("address");
		String role =res.getString("role");
		Timestamp created_at=res.getTimestamp("created_at");
		Timestamp login_time=res.getTimestamp("login_time");
		
		 User u = new User(userid, name, password, email, address, role, null, null);
		return u;
	}
}
