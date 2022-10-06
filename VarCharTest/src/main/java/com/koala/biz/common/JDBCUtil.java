package com.koala.biz.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBCUtil {
	
	static final String driverName="com.mysql.cj.jdbc.Driver"; // mysql ����̹�
	static final String url="jdbc:mysql://localhost:3306/itbank"; // �� url
	static final String user="lee";
	static final String password="1234"; // ��й�ȣ
	public static Connection connect() {
		Connection conn=null;
		try {
			Class.forName(driverName); // �̸��� ã�� �Լ��� ���� �ڵ����� ����̹��� �����
			
			conn=DriverManager.getConnection(url, user, password); // �� mysql�� ��Ŭ���� ����
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	public static void disconnect(PreparedStatement pstmt, Connection conn) { // �Լ� ���� �޼���
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
