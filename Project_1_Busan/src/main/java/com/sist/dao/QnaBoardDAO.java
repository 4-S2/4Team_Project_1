package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.NoticeVO;
import com.sist.vo.QnaBoardVO;

public class QnaBoardDAO {
	   private Connection conn; //데이터베이스 연결
	   private PreparedStatement ps;//SQL전송 , 결과값 
	   private static QnaBoardDAO dao;
	   // DBCP라이브러리 
	   private CreateDBCPConnection dbconn=
			        new CreateDBCPConnection();
	   
	   public static QnaBoardDAO newInstance() {
		   if (dao==null)
			   dao = new QnaBoardDAO();
			return dao;		   
	   }
	
	// TOP 3 특산물 리스트 출력
	   public List<QnaBoardVO> Qnafind4()
	   {
	      List<QnaBoardVO> list=new ArrayList<>();
	      try
	      {
	         // 1. 연결 
	         conn=dbconn.getConnection();
	         // 2. SQL문장 전송 
	         String sql="SELECT qno,subject FROM qnaboard "
	                 +"WHERE qno IN(6,8,10,7)";
	         // 3. 미리 전송 
	         ps=conn.prepareStatement(sql);
	         // 4. 실행 요청전에 ?에 값을 채운다 
	         
	         // 5. 실행후에 결과값을 받는다 
	         ResultSet rs=ps.executeQuery();
	         while(rs.next()) // 출력 1번째 위치부터 읽기 시작 
	         {
	        	QnaBoardVO vo=new QnaBoardVO();
	            vo.setQno(rs.getInt(1));
	            vo.setSubject(rs.getString(2));
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
