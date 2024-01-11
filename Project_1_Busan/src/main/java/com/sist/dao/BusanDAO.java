
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
   
   // 부산 리스트
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
   

   // 부산 상세보기
   public BusanListVO busanDetailData(int no,String tab)
   {  
	   BusanListVO vo=new BusanListVO();
	   try
	   {
		   if(tab.contains("food"))
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
		   // vo.setTag(rs.getString(11));
			   vo.setJjim(rs.getInt(12));
			   vo.setHeart(rs.getInt(13));
				String dimage = rs.getString(14);
				String[] dimgs = dimage.split("\\^");
			   vo.setDeimage(dimgs);
			// vo.setDeimage(rs.getString(14));
			   vo.setRdate(rs.getString(15));
			   rs.close();
		   }
		   else {
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
			   vo.setJjim(rs.getInt(10));
			   vo.setHeart(rs.getInt(11));
				String dimage = rs.getString(12);
				String[] dimgs = dimage.split("\\^");
			   vo.setDeimage(dimgs);
			 //vo.setDeimage(rs.getString(12));
				String tag = rs.getString(13);
				String[] tags = tag.split("#");
			   vo.setTag(tags);
			 //vo.setTag(rs.getString(13));
			   }
			   rs.close();
		   }
		   
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
   
   // 부산 검색 리스트
   public List<BusanListVO> BusanFindList(String keyword,int page,String tab,String sort)
   {
	   List<BusanListVO> list=new ArrayList<>();
	   String sort_way="ASC";
	   if(sort.equals("heart")||sort.contains("hit"))
		   sort_way="DESC";
	   try
	   {
		   // 1. 연결 
		   conn=dbconn.getConnection();
		   // 2. SQL문장 전송 
		   String sql="SELECT no,title,poster,num "
				     +"FROM (SELECT no,title,poster,rownum as num "
				     +"FROM (SELECT no,title,poster "
				     +"FROM "+tab+" WHERE title LIKE '%'||?||'%' "
				     +"ORDER BY " +sort+" "+sort_way+")) "
				     +"WHERE num BETWEEN ? AND ?";
		   // 3. 미리 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. 실행 요청전에 ?에 값을 채운다 
		   int rowSize=12;
		   int start=(rowSize*page)-(rowSize-1); // 오라클 => 1번 
		   int end=rowSize*page;
		   
		   ps.setString(1, keyword);
		   ps.setInt(2, start);
		   ps.setInt(3, end);
		   
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
   
// 부산 검색 리스트 총 페이지
   public int BusanFindTotalPage(String keyword,String tab)
   {
	   int total=0;
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT CEIL(COUNT(*)/12.0) FROM "+tab
				   +" WHERE title LIKE '%'||?||'%'";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, keyword);
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
   
   //food 검색 데이터
   public List<BusanListVO> foodFindList(String keyword,int page,String tag,String sort)
   {
	   List<BusanListVO> list=new ArrayList<>();
	   String sort_way="ASC";
	   if(sort.equals("heart")||sort.contains("hit"))
		   sort_way="DESC";
	   try
	   {
		   // 1. 연결 
		   conn=dbconn.getConnection();
		   // 2. SQL문장 전송 
		   String sql = "SELECT no, title, poster, tag, num " +
				   "FROM (SELECT no, title, poster, tag, rownum as num " +
				   "FROM (SELECT no, title, poster, tag, hit, heart " +
				   "FROM food " +
				   "WHERE title LIKE '%'||?||'%' AND tag LIKE '%'||?||'%' " +
				   "ORDER BY " + sort + " " + sort_way + ")) " +
				   "WHERE num BETWEEN ? AND ?";
		   // 3. 미리 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. 실행 요청전에 ?에 값을 채운다 
		   int rowSize=12;
		   int start=(rowSize*page)-(rowSize-1); // 오라클 => 1번 
		   int end=rowSize*page;
		   ps.setString(1, keyword);
		   ps.setString(2, tag);
		   ps.setInt(3, start);
		   ps.setInt(4, end);
		   
		   // 5. 실행후에 결과값을 받는다 
		   ResultSet rs=ps.executeQuery();
		   while(rs.next()) // 출력 1번째 위치부터 읽기 시작 
		   {
			   BusanListVO vo=new BusanListVO();
			   vo.setNo(rs.getInt(1));
			   vo.setTitle(rs.getString(2));
			   vo.setPoster(rs.getString(3));
			   vo.setTag1(rs.getString(4));
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
   //food 검색 리스트 총페이지
   public int foodFindTotalPage(String keyword,String tag)
   {
	   int total=0;
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT CEIL(COUNT(*)/12.0) FROM food"
				   +" WHERE title LIKE '%'||?||'%' AND tag LIKE '%'||?||'%'";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, keyword);
		   ps.setString(2, tag);
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
    // 추천 상품
	public List<BusanListVO> busanRandomList(String tab){
		List<BusanListVO> list=new ArrayList<>();
		try {
			// 연결 
			conn=dbconn.getConnection();
			// SQL 
			String sql="SELECT no,title,poster "
					  +"FROM "+tab
	                  +" ORDER BY DBMS_RANDOM.VALUE";
			// 전송
			ps=conn.prepareStatement(sql);
	         
			// 결과값
			ResultSet rs=ps.executeQuery();
			while(rs.next()) { // 출력 첫번째 위치부터 읽기 시작 
				BusanListVO vo=new BusanListVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
	            list.add(vo);
	         }
	         rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		finally{
			// 반환 => 재사용
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
}






