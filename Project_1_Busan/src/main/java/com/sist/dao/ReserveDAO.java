package com.sist.dao;

import java.sql.*;
import java.util.*;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.BusanListVO;
import com.sist.vo.FoodReserveDateVO;
import com.sist.vo.FoodReserveVO;
import com.sist.vo.ReserveInfoVO;
public class ReserveDAO {
	private Connection conn; //데이터베이스 연결
	   private PreparedStatement ps;//SQL전송 , 결과값 
	   private static ReserveDAO dao;
	   // DBCP라이브러리 
	   private CreateDBCPConnection dbconn=
			        new CreateDBCPConnection();
	   
	   public static ReserveDAO newInstance() {
		   if (dao==null)
			   dao = new ReserveDAO();
			return dao;		   
	   }
	   public String reserveDays(int eno)
	   {
		   String day="";
		   try {
			   conn=dbconn.getConnection();
			   String sql="SELECT rday FROM exhibition WHERE eno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, eno);
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
	   }public void reserveInsertData(ReserveInfoVO vo)
	   { 
		   try {
			   conn=dbconn.getConnection();
			   String sql="INSERT INTO Reserve_info "
			   		+ "VALUES((SELECT NVL(MAX(no)+1,1) FROM Reserve_info),"
			   		+ "?,?,?,?,0,SYSDATE)";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getMvo().getId());
			   ps.setInt(2, vo.getEvo().getEno());
			   ps.setString(3, vo.getDay());
			   ps.setString(4, vo.getInwon());
			   ps.setInt(5, vo.getRok());
			   ps.executeUpdate();
			   

			   
		   } catch (Exception e) {
			   // TODO: handle exception
		   }
		   finally {
			   dbconn.disConnection(conn, ps);
		   }
	   }
	   
	   public ReserveInfoVO reserveInfoData(int no)
	   {
		   ReserveInfoVO vo=new ReserveInfoVO();
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT no,day,inwon,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') "
					     +"FROM reserve_info "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setNo(rs.getInt(1));
			   vo.setRday(rs.getString(2));
			   vo.setInwon(rs.getString(4));
			   vo.setDay(rs.getString(5));
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbconn.disConnection(conn, ps);
		   }
		   return vo;
	   }
	   
	   public List<ReserveInfoVO> reserveAdminData()
	   {
		   List<ReserveInfoVO> list=new ArrayList<ReserveInfoVO>();
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT ri.no, e.eno, e.ename , e.eeName , e.poster, ri.day, ri.inwon , "
			   		   +"ri.rok, ri.id, "
			   		   +"TO_CHAR(ri.regdate, 'yyyy-MM-dd hh24:mi:ss') AS regdate "
					   +"FROM exhibition e"
					   +"JOIN reserve_info ri ON e.eno = ri.eno "
					   +"ORDER BY ri.no DESC";
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   ReserveInfoVO vo=new ReserveInfoVO();
				   
				   
				   vo.setNo(rs.getInt(1));
				   vo.setEno(rs.getInt(2));
				   vo.setEname(rs.getString(3));
				   vo.setEename(rs.getString(4));
				   vo.setPoster(rs.getString(5));
				   vo.setDay(rs.getString(6));
				   vo.setInwon(rs.getString(7));
				   vo.setRok(rs.getInt(8));
				   vo.getMvo().setId(rs.getString(9));
				   vo.setRegdate(rs.getString(10));
				   
				   
				   list.add(vo);
			   }
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbconn.disConnection(conn, ps);
		   }
		   return list;
	   }
	   public void reserveOk(int no)
	   {
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="UPDATE reserve_info SET "
					     +"rok='1' "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ps.executeUpdate();
		   }catch(Exception ex)
		   {
			  ex.printStackTrace();   
		   }
		   finally
		   {
			   dbconn.disConnection(conn, ps);
		   }
	   }
	  

	   
}
