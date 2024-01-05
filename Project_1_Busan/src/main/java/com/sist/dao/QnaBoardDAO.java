package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.QnaBoardVO;

public class QnaBoardDAO {
	   private Connection conn; //데이터베이스 연결
	   private PreparedStatement ps;//SQL전송 , 결과값 
	   private static QnaBoardDAO dao;
	   private final int rowSize=10;
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
	   //묻고 답하기 list
	   public List<QnaBoardVO> QnaListData(int page)
	   {
	         List<QnaBoardVO> list=new ArrayList<>();
	         try
	         {
	            // 1. 연결 
	            conn=dbconn.getConnection();
	            // 2. SQL문장 전송 
	            String sql="SELECT qno,name,subject,TO_CHAR(regdate,'yyyy-mm-dd'),hit,group_step,num "
	                    +"FROM (SELECT qno,name,subject,regdate,hit,group_step,rownum as num "
	                    +"FROM (SELECT qno,name,subject,regdate,hit,group_step "
	                    +"FROM qnaBoard ORDER BY group_id DESC, group_step ASC)) "
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
	               QnaBoardVO vo=new QnaBoardVO();
	               vo.setQno(rs.getInt(1));
	               vo.setName(rs.getString(2));
	               vo.setSubject(rs.getString(3));
	               vo.setDbday(rs.getString(4));
	               vo.setHit(rs.getInt(5));
	               vo.setGroup_step(rs.getInt(6));
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
	   public List<QnaBoardVO> QnaFindListData(int page, String keyword) {
		    List<QnaBoardVO> list = new ArrayList<>();
		    List<Integer> groupIds = new ArrayList<>(); // 여러 개의 group_id를 저장할 리스트 추가

		    try {
		        // 1. 연결
		        conn = dbconn.getConnection();

		        String sql = "SELECT group_id FROM qnaBoard "
		                + "WHERE subject LIKE '%'||?||'%'";
		        ps = conn.prepareStatement(sql);
		        ps.setString(1, keyword);
		        ResultSet rs = ps.executeQuery();

		        // 여러 개의 group_id를 리스트에 추가
		        while (rs.next()) {
		            int groupId = rs.getInt(1);
		            groupIds.add(groupId);
		            System.out.println(groupId);
		        }

		        rs.close();
		        ps.close();

		        // 2. 각 group_id에 대한 데이터 조회
		        for (int groupId : groupIds) {
		            sql = "SELECT qno, name, subject, TO_CHAR(regdate,'yyyy-mm-dd'), hit, group_step, num "
		                    + "FROM (SELECT qno, name, subject, regdate, hit, group_step, rownum as num "
		                    + "FROM (SELECT qno, name, subject, regdate, hit, group_step "
		                    + "FROM qnaBoard WHERE group_id=? ORDER BY group_id DESC, group_step ASC)) "
		                    + "WHERE num BETWEEN ? AND ?";

		            // 3. 미리 전송
		            ps = conn.prepareStatement(sql);

		            // 4. 실행 요청 전에 ?에 값을 채운다
		            int start = (rowSize * page) - (rowSize - 1); // 오라클 => 1번
		            int end = rowSize * page;
		            ps.setInt(1, groupId);
		            ps.setInt(2, start);
		            ps.setInt(3, end);

		            rs = ps.executeQuery();

		            while (rs.next()) {
		                QnaBoardVO vo = new QnaBoardVO();
		                vo.setQno(rs.getInt(1));
		                vo.setName(rs.getString(2));
		                vo.setSubject(rs.getString(3));
		                vo.setDbday(rs.getString(4));
		                vo.setHit(rs.getInt(5));
		                vo.setGroup_step(rs.getInt(6));
		                list.add(vo);
		            }

		            rs.close();
		            ps.close();
		        }

		    } catch (Exception ex) {
		        // 에러 출력
		        ex.printStackTrace();
		    } finally {
		        // 반환 => 재사용
		        dbconn.disConnection(conn, ps);
		    }

		    return list;
		}

	   public int qnaboardRowCount()
		{
			int count=0;
			try {
				conn=dbconn.getConnection();
				String sql="SELECT COUNT(*) FROM qnaBoard";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				count=rs.getInt(1);
				rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return count;
		}
	 //묻고 답하기 detail
	   public QnaBoardVO QnaDetailData(int qno)
	   {
		     QnaBoardVO vo=new QnaBoardVO();
	         try
	         {
	            conn=dbconn.getConnection();
	            String sql="UPDATE qnaBoard SET hit=hit+1 "
	                    +"WHERE qno="+qno;
	            ps=conn.prepareStatement(sql);
	            ps.executeUpdate();
	            ps.close();
	            
	            sql="SELECT qno,name,subject,cont,TO_CHAR(regdate,'yyyy-mm-dd'),hit,filename,filesize,TO_CHAR(filesize, '999,999,999,999') "
	                    +"FROM qnaBoard "
	                    +"WHERE qno="+qno;
	            ps=conn.prepareStatement(sql);
	            ResultSet rs=ps.executeQuery();
	            if (rs.next()) {
	                vo.setQno(rs.getInt(1));
	                vo.setName(rs.getString(2));
	                vo.setSubject(rs.getString(3));
	                vo.setCont(rs.getString(4));
	                vo.setDbday(rs.getString(5));
	                vo.setHit(rs.getInt(6));
	                vo.setFilename(rs.getString(7));
	                vo.setFilesize(rs.getInt(8));
	                vo.setFilesize2(rs.getString(9));
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
	 //묻고 답하기 detail
	   public void QnaInsertData(QnaBoardVO vo)
	   {
	         try
	         {
	            if(vo.getId()==null)
	            {
	            	try {
	            		conn=dbconn.getConnection();
			            String sql="INSERT INTO qnaBoard(qno,name,subject,cont,pwd,filename,filesize,group_id) "
			            		+ "VALUES(qb_no_seq.nextval,?,?,?,?,?,?,(SELECT MAX(group_id) FROM qnaBoard)+1)";
			            ps=conn.prepareStatement(sql);
			            ps.setString(1, vo.getName());
			            ps.setString(2, vo.getSubject());
			            ps.setString(3, vo.getCont());
			            ps.setString(4, vo.getPwd());
			            ps.setString(5, vo.getFilename());
			            ps.setInt(6, vo.getFilesize());
			            ps.executeUpdate();
			            ps.close();
	            	}catch(Exception e) {}
	            	
	            }
	            else {
	            	try {
	            	conn=dbconn.getConnection();
		            String sql="INSERT INTO qnaBoard(qno,name,subject,cont,pwd,filename,filesize,id,group_id) "
		            		+ "VALUES(qb_no_seq.nextval,?,?,?,?,?,?,?,(SELECT MAX(group_id) FROM qnaBoard)+1)";
		            ps=conn.prepareStatement(sql);
		            ps.setString(1, vo.getName());
		            ps.setString(2, vo.getSubject());
		            ps.setString(3, vo.getCont());
		            ps.setString(4, vo.getPwd());
		            ps.setString(5, vo.getFilename());
		            ps.setInt(6, vo.getFilesize());
		            ps.setString(7, vo.getId());
		            ps.executeUpdate();
		            ps.close();
	            	}catch(Exception e) {}
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
	  }
	 //묻고 답하기 delete
	   public String QnaDeleteData(int qno,String pwd)
	   {
	         String result="no";
		   try
	         {
	            
			    conn=dbconn.getConnection();
			    String sql="SELECT pwd FROM qnaboard WHERE qno="+qno;
			    ps=conn.prepareStatement(sql);
	            ResultSet rs=ps.executeQuery();
	            rs.next();
	            String db_pwd=rs.getString(1);
	            rs.close();
	            ps.close();
	            
	            if(db_pwd.equals(pwd))
	            {
	            	result="yes";
	            	sql="SELECT group_id FROM qnaBoard "
		            		+ "WHERE qno="+qno;
		            ps=conn.prepareStatement(sql);
		            rs=ps.executeQuery();
		            rs.next();
		            int group_id=rs.getInt(1);
		            rs.close();
		            
		            sql="DELETE FROM qnaBoard "
		            		+ "WHERE group_id="+group_id;
		            ps=conn.prepareStatement(sql);
		            ps.executeUpdate();
	            }
	            else {
	            	result="no";
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
		   return result;
	  }
	//  수정하기 
	   public String boardUpdate(QnaBoardVO vo)
	   {
		   String res="no";
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT pwd FROM qnaboard "
					     +"WHERE qno="+vo.getQno();
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   String db_pwd=rs.getString(1);
			   rs.close();
			   ps.close();
			   
			   if(db_pwd.equals(vo.getPwd()))
			   {
				   res="yes";
				   sql="UPDATE qnaboard SET "
					  +"name=?,subject=?,cont=? "
					  +"WHERE qno=?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, vo.getName());
				   ps.setString(2, vo.getSubject());
				   ps.setString(3, vo.getCont());
				   ps.setInt(4, vo.getQno());
				   ps.executeUpdate();
				   ps.close();
			   }
			   
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbconn.disConnection(conn, ps);
		   }
		   return res;
	   }

	   
}
