package com.sist.dao;

import java.io.*;
import java.util.*;
import java.sql.*;

import com.sist.vo.*;
import com.sist.dbcp.CreateDBCPConnection;

public class ReviewDAO {
	private Connection conn;
    private PreparedStatement ps; 
    private static ReviewDAO dao;
    private CreateDBCPConnection dbconn=new CreateDBCPConnection();
   
    public static ReviewDAO newInstance() {
       if (dao==null) {
    	   dao=new ReviewDAO();
       }
       return dao;
    }
    
    private final int rowSize=10;
    
    // 리뷰 목록 출력
    public List<ReviewVO> reviewListData(int page){
       List<ReviewVO> list=new ArrayList<ReviewVO>();
       try{
          // 1. 연결
          conn=dbconn.getConnection();
          // 2. SQL문장 전송 
          String sql="SELECT rno, score, cateno, id, cont, password, img, TO_CHAR(regdate,'YYYY-MM-DD'), num "
                  +"FROM (SELECT rno, score, cateno, id, cont, password, img, regdate, rownum as num "
                  +"FROM (SELECT rno, score, cateno, id, cont, password, img, regdate "
                  +"FROM review ORDER BY rno DESC)) "
                  +"WHERE num BETWEEN ? AND ?";
          // 3. 미리 전송 
          ps=conn.prepareStatement(sql);
          // 4. 실행 요청전에 ?에 값을 채운다 
          int start=(rowSize*page)-(rowSize-1); // 오라클 => 1번  
          int end=rowSize*page;
          
          ps.setInt(1, start);
          ps.setInt(2, end);
          
          // 5. 실행후에 결과값을 받는다 
          ResultSet rs=ps.executeQuery();
          while(rs.next()) { // 출력 1번째 위치부터 읽기 시작 
        	 ReviewVO vo=new ReviewVO();
             vo.setRno(rs.getInt(1));
             vo.setScore(rs.getInt(2));
             vo.setCateno(rs.getInt(3));
             vo.getMvo().setId(rs.getString(4));
             vo.setCont(rs.getString(5));
             vo.setPassword(rs.getString(6));
             vo.setImg(rs.getString(7));
             vo.setRegdate(rs.getDate(8));
             list.add(vo);
          }
          rs.close();
       }catch(Exception ex){
         // 에러 출력 
          ex.printStackTrace();
       }
       finally{
          // 반환 => 재사용 
          dbconn.disConnection(conn, ps);
       }
       return list;
    }
    
    
    // 총페이지
    public int ReviewRowCount(){
 	   int total=0;
 	   try{
 		   conn=dbconn.getConnection();
 		   String sql="SELECT COUNT(*) FROM review";
 		   ps=conn.prepareStatement(sql);
 		   ResultSet rs=ps.executeQuery();
 		   rs.next();
 		   total=rs.getInt(1);
 		   rs.close();
 	   }catch(Exception ex){
 		   ex.printStackTrace();
 	   }
 	   finally{
 		   dbconn.disConnection(conn, ps);
 	   }
 	   return total;
    }
    
    
    // 리뷰 작성
    public void reviewInsert(ReviewVO vo) {
    	try {
    		conn=dbconn.getConnection();
    		String sql="INSERT INTO review(rno, score, cateno, id, cont, password, img) "
    				 + "VALUES(review_rno_seq.nextval,?,?,?,?,?,?)";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, vo.getRno());
    		ps.setInt(2, vo.getScore());
    		ps.setInt(3, vo.getCateno());
			ps.setString(4, vo.getMvo().getId());
    		ps.setString(5, vo.getCont());
    		ps.setString(6, vo.getPassword());
    		ps.setString(7, vo.getImg());
    		ps.executeUpdate();
    	}catch(Exception ex) {
    		ex.printStackTrace();
    	}finally {
    		dbconn.disConnection(conn, ps);
    	}
    }
    
    
    // 리뷰 삭제
    public String reviewDeleteData(int rno, String pwd) {
    	String result="";
    	try {
      		conn=dbconn.getConnection();
      		String sql="SELECT password FROM review "
      				 + "WHERE rno="+rno; 
      		ps=conn.prepareStatement(sql);
      		ResultSet rs=ps.executeQuery();
      		rs.next();
      		String db_pwd=rs.getString(1);
      		rs.close();
      		ps.close();
      		
      		if(db_pwd.equals(pwd)){
      			result="yes";
      			sql="DELETE FROM review "
      			   +"WHERE rno="+rno;
      			ps=conn.prepareStatement(sql);
      			ps.executeUpdate();
      			ps.close();
      			
//      			sql="DELETE FROM review "
//      			   +"WHERE rno="+rno;
//      			ps=conn.prepareStatement(sql);
//      			ps.executeUpdate();
//      			ps.close();
      		}else {
      			result="no";
      		}
      	}catch(Exception ex) {
      		ex.printStackTrace();
      	}
      	finally {
      		dbconn.disConnection(conn, ps);
      	}
    	return result;
    }
    
    
    // 리뷰 수정
    public String reviewUpdateData(ReviewVO vo) {
    	String res="no";
    	try {
      		conn=dbconn.getConnection();
      		String sql="SELECT password FROM review "
      				  +"WHERE no="+vo.getRno();
      		ps=conn.prepareStatement(sql);
      		ResultSet rs=ps.executeQuery();
      		rs.next();
      		String db_pwd=rs.getString(1);
      		rs.close();
      		ps.close();
      		
      		if(db_pwd.equals(vo.getPassword())) {
      			res="yes";
      			sql="UPDATE review SET "
      			   +"score=?, cont=?, img=? "
      			   +"WHERE rno=?";
      		}
      		ps=conn.prepareStatement(sql);
      		ps.setInt(1, vo.getScore());
      		ps.setString(2, vo.getCont());
      		ps.setString(3, vo.getImg());
      		ps.setInt(4, vo.getRno());
      		ps.executeUpdate();
      		ps.close();
      	}catch(Exception ex) {
      		ex.printStackTrace();
      	}
      	finally {
      		dbconn.disConnection(conn, ps);
      	}
    	return res;
    }
}
