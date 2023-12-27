package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
import com.sist.dbcp.*;
public class MemberDAO {
   private Connection conn;
   private PreparedStatement ps;
   private CreateDBCPConnection dbconn=
		     new CreateDBCPConnection();
   private static MemberDAO dao;
   
   public static MemberDAO newInstance()
   {
	   if(dao==null)
		   dao=new MemberDAO();
	   return dao;
   }
   // ID중복체크 
   public int memberIdCheck(String id)
   {
	   int count=0;
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT COUNT(*) FROM user_ "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
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
   public void memberInsert(MemberVO vo)
   {
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="INSERT INTO user_ VALUES("
				     +"?,?,?,?,?,?,?,?,?,'n')";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getId());
		   ps.setString(2, vo.getPwd());
		   ps.setString(3, vo.getEmail());
		   ps.setString(4, vo.getName());
		   ps.setString(5, vo.getPhone());
		   ps.setString(6, vo.getPostcode());
		   ps.setString(7, vo.getAddr());
		   ps.setString(8, vo.getDetail_addr());
		   ps.setString(9, vo.getAdmin());
		
		   ps.executeUpdate();
		   // save(vo)
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   } 
   }
   public MemberVO memberLogin(String id,String pwd)
   {
	   MemberVO vo=new MemberVO();
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT COUNT(*) "
				     +"FROM user_ "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   int count=rs.getInt(1);
		   rs.close();
		   
		   if(count==0)
		   {
			   vo.setMsg("NOID");
		   }
		   else
		   {
			  sql="SELECT id,name,pwd,admin "
				 +"FROM user_ "
				 +"WHERE id=?";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, id);
			  rs=ps.executeQuery();
			  rs.next();
			  String db_id=rs.getString(1);
			  String name=rs.getString(2);
			  String db_pwd=rs.getString(3);
			  String admin=rs.getString(4);
			  rs.close();
			  
			  if(db_pwd.equals(pwd))
			  {
				  vo.setId(db_id);
				  vo.setName(name);
				  vo.setAdmin(admin);
				  vo.setMsg("OK");
			  }
			  else
			  {
				  vo.setMsg("NOPWD");
			  }
		   }
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   }
	   return vo;
   }
}
   
