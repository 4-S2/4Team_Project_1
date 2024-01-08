package com.sist.dao;

import java.sql.*;
import java.util.*;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.BusanListVO;
import com.sist.vo.FoodReserveDateVO;
public class FoodReserveDAO {
	private Connection conn; //데이터베이스 연결
	   private PreparedStatement ps;//SQL전송 , 결과값 
	   private static FoodReserveDAO dao;
	   // DBCP라이브러리 
	   private CreateDBCPConnection dbconn=
			        new CreateDBCPConnection();
	   
	   public static FoodReserveDAO newInstance() {
		   if (dao==null)
			   dao = new FoodReserveDAO();
			return dao;		   
	   }
	   
}
