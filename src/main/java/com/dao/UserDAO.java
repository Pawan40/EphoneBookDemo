package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAO {
	private Connection con;

	public UserDAO(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean userRegister(User u) {
		boolean f=false;
		
		try {
			
			String sql="insert into euser(name,email,password) values(?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			
			int i =ps.executeUpdate();
			if(i == 1)
			{
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
				
	}
	
	public User loginUser(String e,String p)
	{
		User user= null; 
		try {
			String sql="select * from euser where email=? and password=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, e);
			ps.setString(2, p);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				user= new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
				
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return user;
	}
}
