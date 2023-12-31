package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.BusanListVO;
import com.sist.vo.NoticeVO;

public class NoticeDAO {
      private Connection conn; //데이터베이스 연결
      private PreparedStatement ps;//SQL전송 , 결과값 
      private static NoticeDAO dao;
      // DBCP라이브러리 
      private CreateDBCPConnection dbconn=
                 new CreateDBCPConnection();
      private final int rowSize=10;
      public static NoticeDAO newInstance() {
         if (dao==null)
            dao = new NoticeDAO();
         return dao;         
      }
   
   // 공지사항 메인 4개 출력
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
      public List<NoticeVO> noticeFindData(int page,String keyword)
      {
         List<NoticeVO> list=new ArrayList<>();
         try
         {
            // 1. 연결 
            conn=dbconn.getConnection();
            // 2. SQL문장 전송 
            String sql="SELECT nno,ntitle,TO_CHAR(ndate,'yyyy-mm-dd'),num "
                    +"FROM (SELECT nno,ntitle,ndate,rownum as num "
                    +"FROM (SELECT nno,ntitle,ndate "
                    +"FROM notice WHERE ntitle LIKE '%'||?||'%' ORDER BY nno DESC)) "
                    +"WHERE num BETWEEN ? AND ?";
            // 3. 미리 전송 
            ps=conn.prepareStatement(sql);
            // 4. 실행 요청전에 ?에 값을 채운다 
            int start=(rowSize*page)-(rowSize-1); // 오라클 => 1번  
            int end=rowSize*page;
            ps.setString(1, keyword);
            ps.setInt(2, start);
            ps.setInt(3, end);
            
            // 5. 실행후에 결과값을 받는다 
            ResultSet rs=ps.executeQuery();
            while(rs.next()) // 출력 1번째 위치부터 읽기 시작 
            {
               NoticeVO vo=new NoticeVO();
               vo.setNno(rs.getInt(1));
               vo.setNtitle(rs.getString(2));
               vo.setDbday(rs.getString(3));
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
      public List<NoticeVO> noticeListData(int page)
      {
         List<NoticeVO> list=new ArrayList<>();
         try
         {
            // 1. 연결 
            conn=dbconn.getConnection();
            // 2. SQL문장 전송 
            String sql="SELECT nno,ntitle,TO_CHAR(ndate,'yyyy-mm-dd'),num "
                    +"FROM (SELECT nno,ntitle,ndate,rownum as num "
                    +"FROM (SELECT nno,ntitle,ndate "
                    +"FROM notice ORDER BY nno DESC)) "
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
            while(rs.next()) // 출력 1번째 위치부터 읽기 시작 
            {
               NoticeVO vo=new NoticeVO();
               vo.setNno(rs.getInt(1));
               vo.setNtitle(rs.getString(2));
               vo.setDbday(rs.getString(3));
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
      
      public int noticeListRowCount()
      {
         int count=0;
         try
         {
            conn=dbconn.getConnection();
            String sql="SELECT COUNT(*) FROM notice";
            ps=conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            rs.next();
            count=rs.getInt(1);
            rs.close();
         }catch(Exception ex)
         {
            ex.printStackTrace();
         }
         finally
         {
            dbconn.disConnection(conn, ps);
         }
         return count;
      }
      public int noticeListFindRowCount(String keyword)
      {
         int count=0;
         try
         {
            conn=dbconn.getConnection();
            String sql="SELECT COUNT(*) FROM notice "
            		+ "WHERE ntitle LIKE '%'||?||'%'";
            ps=conn.prepareStatement(sql);
            ps.setString(1, keyword);
            ResultSet rs=ps.executeQuery();
            rs.next();
            count=rs.getInt(1);
            rs.close();
         }catch(Exception ex)
         {
            ex.printStackTrace();
         }
         finally
         {
            dbconn.disConnection(conn, ps);
         }
         return count;
      }
      public NoticeVO noticeDetailData(int nno)
      {
         NoticeVO vo=new NoticeVO();
         try
         {
            // 1. 연결 
            conn=dbconn.getConnection();
            // 2. SQL문장 전송 
            String sql="SELECT nno,ntitle,TO_CHAR(ndate,'yyyy-mm-dd'),ncont "
                    +"FROM notice "
                    +"WHERE nno="+nno;
            // 3. 미리 전송 
            ps=conn.prepareStatement(sql);
            // 5. 실행후에 결과값을 받는다 
            ResultSet rs=ps.executeQuery();
            rs.next(); // 출력 1번째 위치부터 읽기 시작 
            
               vo.setNno(rs.getInt(1));
               vo.setNtitle(rs.getString(2));
               vo.setDbday(rs.getString(3));
               vo.setNcont(rs.getString(4));
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
      // 글쓰기
      public void noticeInsert(NoticeVO vo)
      {
      	try {
      		conn=dbconn.getConnection();
      		String sql="INSERT INTO notice(nno,ntitle,ncont) "
      				+ "VALUES(notice_nno_seq.nextval,?,?)";  
      		ps=conn.prepareStatement(sql);
      		ps.setString(1,vo.getNtitle());
      		ps.setString(2,vo.getNcont());
      		ps.executeUpdate();
      	}catch(Exception e) {
      		e.printStackTrace();
      	}
      	finally {
      		dbconn.disConnection(conn, ps);
      	}
      }
      public void noticeDeleteData(int nno)
      {
      	try {
      		conn=dbconn.getConnection();
      		String sql="DELETE FROM notice "
      				+ "WHERE nno="+nno;  
      		ps=conn.prepareStatement(sql);
      		ps.executeUpdate();
      	}catch(Exception e) {
      		e.printStackTrace();
      	}
      	finally {
      		dbconn.disConnection(conn, ps);
      	}
      }
      
      public void noticeUpdateData(NoticeVO vo)
      {
      	try {
      		conn=dbconn.getConnection();
      		String sql="UPDATE notice SET ntitle=?, ncont=? "
      				+ "WHERE nno="+vo.getNno();  
      		ps=conn.prepareStatement(sql);
      		ps.setString(1, vo.getNtitle());
      		ps.setString(2, vo.getNcont());
      		ps.executeUpdate();
      	}catch(Exception e) {
      		e.printStackTrace();
      	}
      	finally {
      		dbconn.disConnection(conn, ps);
      	}
      }
}