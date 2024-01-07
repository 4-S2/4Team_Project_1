package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.*;
public class ReplyDAO {
	 private Connection conn; //데이터베이스 연결
	   private PreparedStatement ps;//SQL전송 , 결과값 
	   private static ReplyDAO dao;
	   // DBCP라이브러리 
	   private CreateDBCPConnection dbconn=
			        new CreateDBCPConnection();
	   
	   public static ReplyDAO newInstance() {
		   if (dao==null)
			   dao = new ReplyDAO();
			return dao;		   
	   }
	   
	   public List<ReviewReplyVO> replyListData(int rno)
	   {
		   List<ReviewReplyVO> list=new ArrayList<ReviewReplyVO>();
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="SELECT rrno,rno,id,cont,"
			   		     +"TO_CHAR(regdate,'YYYY-MM-DD'),group_id,group_tab "
					     +"FROM review_reply WHERE rno=?"
					     + "ORDER BY group_id DESC,group_step ASC";
			   		     
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, rno);
	
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   ReviewReplyVO vo=new ReviewReplyVO();
				   vo.setRrno(rs.getInt(1));
				   vo.setRno(rs.getInt(2));
				   vo.setId(rs.getString(3));
				   vo.setCont(rs.getString(4));
				   vo.setDbday(rs.getString(5));
				   vo.setGroup_id(rs.getInt(6));
				   vo.setGroup_tab(rs.getInt(7));
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
	   public void replyupdateData(ReviewReplyVO vo)
	   {
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="UPDATE review_reply SET cont=? "
			   		+ "WHERE rrno=?";
			   		     
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getCont());
			   ps.setInt(2, vo.getRrno());
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
	   public void replyInertData(ReviewReplyVO vo)
	   {
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql="INSERT INTO review_reply(rrno,rno,id,cont,group_id,group_step,group_tab,root) "
			   		+ "VALUES(rr_rrno_seq.nextval,?,?,?,?,?,?,?)";
			   		     
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getCont());
			   ps.setInt(2, vo.getRrno());
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
