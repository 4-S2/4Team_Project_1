package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.NoticeVO;

public class NoticeDAO {
	   private Connection conn; //데이터베이스 연결
	   private PreparedStatement ps;//SQL전송 , 결과값 
	   private static NoticeDAO dao;
	   // DBCP라이브러리 
	   private CreateDBCPConnection dbconn=
			        new CreateDBCPConnection();
	   
	   public static NoticeDAO newInstance() {
		   if (dao==null)
			   dao = new NoticeDAO();
			return dao;		   
	   }
	
	// TOP 3 특산물 리스트 출력
	   public List<NoticeVO> noticefind4()
	   {
	      List<NoticeVO> list=new ArrayList<>();
	      try
	      {
	         // 1. 연결 
	         conn=dbconn.getConnection();
	         // 2. SQL문장 전송 
	         String sql="SELECT nno,ntitle FROM notice "
	                 +"WHERE nno IN(1,2,3,4)";
	         // 3. 미리 전송 
	         ps=conn.prepareStatement(sql);
	         // 4. 실행 요청전에 ?에 값을 채운다 
	         
	         // 5. 실행후에 결과값을 받는다 
	         ResultSet rs=ps.executeQuery();
	         while(rs.next()) // 출력 1번째 위치부터 읽기 시작 
	         {
	        	NoticeVO vo=new NoticeVO();
	            vo.setNno(rs.getInt(1));
	            vo.setNtitle(rs.getString(2));
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
