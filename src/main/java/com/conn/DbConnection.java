package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	public static Connection con;
	public static Connection getConnection() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system", "system");
			
			System.out.println("Connection Success...");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
