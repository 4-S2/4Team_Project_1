package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.sist.dbcp.CreateDBCPConnection;

public class ExReserveDAO {
	private Connection conn; //데이터베이스 연결
	   private PreparedStatement ps;//SQL전송 , 결과값 
	   private static ExReserveDAO dao;
	   // DBCP라이브러리 
	   private CreateDBCPConnection dbconn=
			        new CreateDBCPConnection();
	   
	   public static ExReserveDAO newInstance() {
		   if (dao==null)
			   dao = new ExReserveDAO();
			return dao;		   
	   }
}
