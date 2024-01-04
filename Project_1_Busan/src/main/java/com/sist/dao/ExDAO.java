package com.sist.dao;
import java.util.*;
import java.text.*;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.ExVO;

import java.sql.*;
public class ExDAO {
   private Connection conn; //데이터베이스 연결
   private PreparedStatement ps;//SQL전송 , 결과값 
   private static ExDAO dao;
   // DBCP라이브러리 
   private CreateDBCPConnection dbconn=
		        new CreateDBCPConnection();
   public static ExDAO newInstance() {
	   if (dao==null)
		   dao = new ExDAO();
		return dao;		   
   }
   
   // 1. 기능 : 명소 => seoul_location
   public List<ExVO> exListData(int page)
   {
	   List<ExVO> list=new ArrayList<ExVO>();
	   try
	   {
		   // 1. 연결 
		   conn=dbconn.getConnection();
		   // 2. SQL문장 전송 
		   String sql="SELECT eno, ename, poster, TO_CHAR(s_date, 'YYYY-MM-DD') AS s_date, TO_CHAR(e_date, 'YYYY-MM-DD') AS e_date "
				     +"FROM (SELECT eno, ename, poster, s_date, e_date , rownum as num "
				     +"FROM (SELECT eno, ename, poster, s_date, e_date "
				     +"FROM exhibition ORDER BY eno DESC)) "
				     +"WHERE num BETWEEN ? AND ?";
		   // 3. 미리 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. 실행 요청전에 ?에 값을 채운다 
		   int rowSize=12;
		   int start=(rowSize*page)-(rowSize-1); // 오라클 => 1번 
		   int end=rowSize*page;
		   
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   
		   // 5. 실행후에 결과값을 받는다 
		   ResultSet rs=ps.executeQuery();
		   while(rs.next()) // 출력 1번째 위치부터 읽기 시작 
		   {
			   ExVO vo=new ExVO();
			   vo.setEno(rs.getInt(1));
			   vo.setEname(rs.getString(2));
			   vo.setPoster(rs.getString(3));
			   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	            vo.setS_date(dateFormat.format(rs.getDate(4)));
		        vo.setE_date(dateFormat.format(rs.getDate(5)));
			   
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		  // 에러 출력 
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // 반환 => 재사용 
		   dbconn.disConnection(conn, ps);
	   }
	   return list;
   }
   public int exTotalPage()
   {
	   int total=0;
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT CEIL(COUNT(*)/12.0) FROM exhibition";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   total=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   }
	   return total;
   }
   public List<ExVO> mainpage_exData() {
	    List<ExVO> list = new ArrayList<ExVO>();
	    Connection conn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;

	    try {
	        // 1. 연결
	        conn = dbconn.getConnection();
	        // 2. SQL dictionary
	        String sql = "SELECT eno, ename, poster, TO_CHAR(s_date, 'YYYY-MM-DD') AS s_date, TO_CHAR(e_date, 'YYYY-MM-DD') AS e_date "
	                + "FROM (SELECT eno, ename, poster, s_date, e_date , rownum as num "
	                + "FROM (SELECT eno, ename, poster,s_date, e_date   "
	                + "FROM exhibition ORDER BY elike DESC) "
	                + "WHERE rownum <= 5)";

	        ps = conn.prepareStatement(sql);
	        rs = ps.executeQuery();
	        
	        while (rs.next()) {
	            ExVO vo = new ExVO();
	            vo.setEno(rs.getInt(1));
	            vo.setEname(rs.getString(2));
	            vo.setPoster(rs.getString(3));
	            
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	            vo.setS_date(dateFormat.format(rs.getDate(4)));
		        vo.setE_date(dateFormat.format(rs.getDate(5)));
	            list.add(vo);
	        }
	    } catch (Exception ex) {
	        // 에러 출력
	        ex.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        // 반환 => 재사용
	        dbconn.disConnection(conn, null);
	    }

	    return list;
	}
   
   public ExVO exDetailData(int eno)
   {
	   ExVO vo=new ExVO();
	   try
	   {
		   // 1. 연결 
		   conn=dbconn.getConnection();
		   // 2. SQL문장 전송 
		   String sql = "SELECT eno, ename, eename, efield, eitem, cate, homepage, " +
                   "TO_CHAR(s_date, 'YYYY-MM-DD') AS s_date, TO_CHAR(e_date, 'YYYY-MM-DD') AS e_date, " +
                   "loc, loc_detail, host, poster, elike, jjim, score, price, hit " +
                   "FROM exhibition " +
                   "WHERE eno ="+eno;
				     
		   // 3. 미리 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. 실행 요청전에 ?에 값을 채운다 
		  
		   // 5. 실행후에 결과값을 받는다 
		   ResultSet rs=ps.executeQuery();
		   while(rs.next()) // 출력 1번째 위치부터 읽기 시작 
		   {
			   
			   vo.setEno(rs.getInt(1));
			   vo.setEname(rs.getString(2));
			   vo.setEename(rs.getString(3));
			   vo.setEfield(rs.getString(4));
			   vo.setEitem(rs.getString(5));
			   vo.setCate(rs.getString(6));
			   vo.setHomepage(rs.getString(7));
			   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			   vo.setS_date(dateFormat.format(rs.getDate(8)));
	           vo.setE_date(dateFormat.format(rs.getDate(9)));
			   vo.setLoc(rs.getString(10));
			   vo.setLoc_detail(rs.getString(11));
			   vo.setHost(rs.getString(12));
			   vo.setPoster(rs.getString(13));
			   vo.setElike(rs.getInt(14));
			   vo.setJjim(rs.getInt(15));
			   vo.setScore(rs.getDouble(16));
			   vo.setPrice(rs.getInt(17));
			   vo.setHit(rs.getInt(18));
			   
			   
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		  // 에러 출력 
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // 반환 => 재사용 
		   dbconn.disConnection(conn, ps);
	   }
	   return vo;
   }
   
   public List<ExVO> exRecomendListData()
   {
	   List<ExVO> list=new ArrayList<ExVO>();
	   try
	   {
		   // 1. 연결 
		   conn=dbconn.getConnection();
		   // 2. SQL문장 전송 
		   String sql="SELECT eno, ename, poster, TO_CHAR(s_date, 'YYYY-MM-DD') AS s_date, TO_CHAR(e_date, 'YYYY-MM-DD') AS e_date "
				     +"FROM (SELECT eno, ename, poster, s_date, e_date , rownum as num "
				     +"FROM (SELECT eno, ename, poster, s_date, e_date "
				     +"FROM exhibition ORDER BY eno DESC)) "
				     +"WHERE num BETWEEN ? AND ?";
		   // 3. 미리 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. 실행 요청전에 ?에 값을 채운다 
		  
		   
		  
		   
		   // 5. 실행후에 결과값을 받는다 
		   ResultSet rs=ps.executeQuery();
		   while(rs.next()) // 출력 1번째 위치부터 읽기 시작 
		   {
			   ExVO vo=new ExVO();
			   vo.setEno(rs.getInt(1));
			   vo.setEname(rs.getString(2));
			   vo.setPoster(rs.getString(3));
			   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	            vo.setS_date(dateFormat.format(rs.getDate(4)));
		        vo.setE_date(dateFormat.format(rs.getDate(5)));
			   
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		  // 에러 출력 
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // 반환 => 재사용 
		   dbconn.disConnection(conn, ps);
	   }
	   return list;
   }

   
}






