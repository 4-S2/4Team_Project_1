
package com.sist.dao;
import java.util.*;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.model.BusanListModel;
import com.sist.vo.*;

import java.sql.*;
public class BusanDAO {
   private Connection conn; //데이터베이스 연결
   private PreparedStatement ps;//SQL전송 , 결과값 
   private static BusanDAO dao;
   // DBCP라이브러리 
   private CreateDBCPConnection dbconn=
		        new CreateDBCPConnection();
   
   public static BusanDAO newInstance() {
	   if (dao==null)
		   dao = new BusanDAO();
		return dao;		   
   }
   
   // 1. 기능 : 명소 => seoul_location
   public List<BusanListVO> BusanListData(int page,String tab)
   {
	   List<BusanListVO> list=new ArrayList<>();
	   try
	   {
		   // 1. 연결 
		   conn=dbconn.getConnection();
		   // 2. SQL문장 전송 
		   String sql="SELECT no,title,poster,num "
				     +"FROM (SELECT no,title,poster,rownum as num "
				     +"FROM (SELECT no,title,poster "
				     +"FROM "+tab+" ORDER BY no ASC)) "
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
			   BusanListVO vo=new BusanListVO();
			   vo.setNo(rs.getInt(1));
			   vo.setTitle(rs.getString(2));
			   vo.setPoster(rs.getString(3));
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
   public int BusanListTotalPage(String tab)
   {
	   int total=0;
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT CEIL(COUNT(*)/12.0) FROM "+tab;
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
   // 2. 기능 : 자연 => seoul_nature
   // 3. 기능 : 쇼핑 => seoul_shop
   
   // TOP 6 리스트 출력
   public List<BusanListVO> findTop3(String tab)
   {
	   List<BusanListVO> list=new ArrayList<>();
	   try
	   {
		   // 1. 연결 
		   conn=dbconn.getConnection();
		   // 2. SQL문장 전송 
		   String sql="SELECT no,title,poster,num "
				     +"FROM (SELECT no,title,poster,rownum as num "
				     +"FROM (SELECT no,title,poster "
				     +"FROM "+tab+" ORDER BY heart DESC)) "
				     +"WHERE num <= 3";
		   // 3. 미리 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. 실행 요청전에 ?에 값을 채운다 
		   
		   // 5. 실행후에 결과값을 받는다 
		   ResultSet rs=ps.executeQuery();
		   while(rs.next()) // 출력 1번째 위치부터 읽기 시작 
		   {
			   BusanListVO vo=new BusanListVO();
			   vo.setNo(rs.getInt(1));
			   vo.setTitle(rs.getString(2));
			   vo.setPoster(rs.getString(3));
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
   

   // 푸드 상세보기
   public BusanListVO foodDetailData(int no)
   {
	   /*
	    * private int no;
		   private String title;
		   private String poster;
		   private int hit;
		   private String cont;
		   private String menu;
		   private String addr;
		   private String phone,restday,bhour,tag;
		   private char jjim;
		   private int heart;
		   private String deimage;
		   private String rdate;
	    */
	   BusanListVO vo=new BusanListVO();
	   try
	   {
		   // 1. 연결 
		   conn=dbconn.getConnection();
		   // 2. SQL문장 전송 
		   String sql="SELECT no,title,poster,hit,cont,menu,addr,phone,Restday,bhour,tag,jjim,heart,deimage,rdate "
		   		+ "FROM food WHERE no="+no;
		   // 3. 미리 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. 실행후에 결과값을 받는다 
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   
		   vo.setNo(rs.getInt(1));
	       vo.setTitle(rs.getString(2));
		   vo.setPoster(rs.getString(3));
		   vo.setHit(rs.getInt(4));
		   vo.setCont(rs.getString(5));
		   vo.setMenu(rs.getString(6));
		   vo.setAddr(rs.getString(7));
		   vo.setPhone(rs.getString(8));
		   vo.setRestday(rs.getString(9));
		   vo.setBhour(rs.getString(10));
			String tag = rs.getString(11);
			String[] tags = tag.split("#");
		   vo.setTag(tags);
		   vo.setJjim(rs.getString(12));
		   vo.setHeart(rs.getInt(13));
			String dimage = rs.getString(14);
			String[] dimgs = dimage.split("\\^");
		   vo.setDeimage(dimgs);
		   vo.setRdate(rs.getString(15));
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
   //부산 상세보기
   public BusanListVO busanDetailData(int no,String tab)
   {  
	   BusanListVO vo=new BusanListVO();
	   try
	   {
		   // 1. 연결 
		   conn=dbconn.getConnection();
		   // 2. SQL문장 전송 
		   String sql="SELECT no,title,poster,hit,cont,addr,phone,rate,bhour,jjim,heart,deimage,tag "
		   		+ "FROM "+tab+" WHERE no="+no;
		   // 3. 미리 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. 실행후에 결과값을 받는다 
		   ResultSet rs=ps.executeQuery();
		   if(rs.next()) {
		   vo.setNo(rs.getInt(1));
	       vo.setTitle(rs.getString(2));
		   vo.setPoster(rs.getString(3));
		   vo.setHit(rs.getInt(4));
		   vo.setCont(rs.getString(5));
		   vo.setAddr(rs.getString(6));
		   vo.setPhone(rs.getString(7));
		   vo.setRate(rs.getString(8));
		   vo.setBhour(rs.getString(9));
		   vo.setJjim(rs.getString(10));
		   vo.setHeart(rs.getInt(11));
			String dimage = rs.getString(12);
			String[] dimgs = dimage.split("\\^");
		   vo.setDeimage(dimgs);
			String tag = rs.getString(13);
			String[] tags = tag.split("#");
		   vo.setTag(tags);
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
   
}






