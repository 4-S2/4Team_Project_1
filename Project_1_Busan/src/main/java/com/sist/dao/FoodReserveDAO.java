package com.sist.dao;

import java.sql.*;
import java.util.*;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.BusanListVO;
import com.sist.vo.FoodReserveDateVO;
import com.sist.vo.FoodReserveVO;
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
	   public String reserveDays(int no)
	   {
		   String day="";
		   try {
			   conn=dbconn.getConnection();
			   String sql="SELECT rdate FROM food WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   day=rs.getString(1);
			   rs.close();
			   
		   } catch (Exception e) {
			   // TODO: handle exception
		   }
		   finally {
			   dbconn.disConnection(conn, ps);
		   }
		   return day;
	   }
	   public String reserveDateTime(int fdno)
	   {
		   String time="";
		   try {
			   conn=dbconn.getConnection();
			   String sql="SELECT rtime FROM food_date WHERE fdno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, fdno);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   time=rs.getString(1);
			   rs.close();
			   
		   } catch (Exception e) {
			   // TODO: handle exception
		   }
		   finally {
			   dbconn.disConnection(conn, ps);
		   }
		   return time;
	   }
	   public String reserveTime(int ftno)
	   {
		   String time="";
		   try {
			   conn=dbconn.getConnection();
			   String sql="SELECT time FROM food_time WHERE ftno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, ftno);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   time=rs.getString(1);
			   rs.close();
			   
		   } catch (Exception e) {
			   // TODO: handle exception
		   }
		   finally {
			   dbconn.disConnection(conn, ps);
		   }
		   return time;
	   }public void reserveInsertData(FoodReserveVO vo)
	   { 
		   try {
			   conn=dbconn.getConnection();
			   String sql="INSERT INTO reservation "
			   		+ "VALUES((SELECT NVL(MAX(frno)+1,1) FROM reservation),"
			   		+ "?,?,?,?,?,0,SYSDATE)";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getId());
			   ps.setInt(2, vo.getFno());
			   ps.setString(3, vo.getDay());
			   ps.setString(4, vo.getTime());
			   ps.setInt(5, vo.getInwon());
			   ps.executeUpdate();
			   
		   } catch (Exception e) {
			   // TODO: handle exception
		   }
		   finally {
			   dbconn.disConnection(conn, ps);
		   }
	   }
	   
}
