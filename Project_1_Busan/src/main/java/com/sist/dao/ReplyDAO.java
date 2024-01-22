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
			   String sql = "SELECT rrno, rno, id, cont, " +
			             "TO_CHAR(regdate, 'YYYY-MM-DD \"(\"HH24:MI\")\"'), group_id, group_tab " +
			             "FROM review_reply WHERE rno=? " +
			             "ORDER BY group_id DESC, group_step ASC";

			   		     
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
	   public void reReplyInsertData(ReviewReplyVO vo)
	   {
		   try
		   {
			   
			   conn=dbconn.getConnection();
			   String sql="SELECT group_step,group_tab FROM review_reply WHERE rrno="+vo.getRoot();
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   int groupStep=rs.getInt(1);
			   int groupTab=rs.getInt(2);
			   rs.close();
			   ps.close();
			   

			   sql="UPDATE review_reply SET group_step=group_step+1 WHERE group_id="+vo.getGroup_id()+" AND group_step>"+groupStep;
			   ps=conn.prepareStatement(sql);
			   ps.executeUpdate();
			   ps.close();
			   
			   
			   sql="INSERT INTO review_reply(rrno,rno,id,cont,group_id,group_step,group_tab,root) "
			   		+ "VALUES((SELECT NVL(MAX(rrno)+1,1) FROM review_reply),?,?,?,?,?,?,?)";
			   		     
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, vo.getRno());
			   ps.setString(2, vo.getId());
			   ps.setString(3, vo.getCont());
			   ps.setInt(4, vo.getGroup_id());
			   ps.setInt(5, groupStep+1);
			   ps.setInt(6, groupTab+1);
			   ps.setInt(7, vo.getRoot());
			   ps.executeUpdate();
			   ps.close();
			   
			   sql="UPDATE review_reply SET depth=depth+1 WHERE rrno="+vo.getRoot();
			   ps=conn.prepareStatement(sql);
			   ps.executeUpdate();
			   ps.close();
			   
		   }catch(Exception ex) 
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   dbconn.disConnection(conn, ps);
		   }
	   }
	   public void replyInsertData(ReviewReplyVO vo)
	   {
		   try
		   {
			   conn=dbconn.getConnection();
			   String sql = "INSERT INTO review_reply(rrno, rno, id, cont, group_id, group_step, group_tab) " +
			             "VALUES((SELECT NVL(MAX(rrno)+1,1) FROM review_reply), ?, ?, ?, (SELECT NVL(MAX(group_id) + 1, 1) FROM review_reply WHERE rno=?), 0, 0)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getRno());
			ps.setString(2, vo.getId());
			ps.setString(3, vo.getCont());
			ps.setInt(4,vo.getRno());
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
	  public void replyDeleteData(int rrno)
	  {
		  try
		   {
			   conn=dbconn.getConnection();
			   String sql = "SELECT root,depth FROM review_reply WHERE rrno="+rrno;
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   int db_root=rs.getInt(1);
			   int db_depth=rs.getInt(2);
			   rs.close();
			   ps.close();
			   
			   
				    sql = "DELETE FROM review_reply WHERE rrno=?";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, rrno);
					ps.executeUpdate();
					ps.close();
					
					
					if(db_root!=0)
					{
						sql="UPDATE review_reply SET depth=depth-1 WHERE rrno="+db_root;
						ps = conn.prepareStatement(sql);
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
	  }
	  public String replyDeleteDataCheck(int rrno)
	  {
		  String res="";
		  try
		   {
			   conn=dbconn.getConnection();
			   String sql = "SELECT root,depth FROM review_reply WHERE rrno="+rrno;
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   int db_root=rs.getInt(1);
			   int db_depth=rs.getInt(2);
			   rs.close();
			   ps.close();
			   
			   if(db_depth>0)
			   {
				   res="no";
			   }
			   else {
				    res="yes";
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
