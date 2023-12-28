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
		   String sql = "INSERT INTO user_ VALUES(?,?,?,?,?,?,?,?,'n')";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, vo.getId());
	        ps.setString(2, vo.getPwd());
	        ps.setString(3, vo.getEmail());
	        ps.setString(4, vo.getName());
	        ps.setString(5, vo.getPhone());
	        ps.setString(6, vo.getPostcode());
	        ps.setString(7, vo.getAddr());
	        ps.setString(8, vo.getDetail_addr());
	        
		
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
   public MemberVO memberLogin(String id, String pwd) {
	    MemberVO vo = new MemberVO();
	    try {
	        conn = dbconn.getConnection();
	        String sql = "SELECT id,password, email, name, phone, postcode, addr, detail_addr , admin "
	                   + "FROM user_ "
	                   + "WHERE id=?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, id);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            String db_id = rs.getString("id");
	            String db_pwd = rs.getString("password");
	            String db_email = rs.getString("email");
	            String name = rs.getString("name");
	            String phone = rs.getString("phone");
	            String postcode = rs.getString("postcode");
	            String addr = rs.getString("addr");
	            String detail_addr = rs.getString("detail_addr");
	            String admin =rs.getString("admin");

	            vo.setId(db_id);
	            vo.setEmail(db_email);
	            vo.setName(name);
	            vo.setPhone(phone);
	            vo.setPostcode(postcode);
	            vo.setAddr(addr);
	            vo.setDetail_addr(detail_addr);
	            vo.setAdmin(admin);

	            

	            if (db_pwd.equals(pwd)) {
	                vo.setMsg("OK");
	            } else {
	                vo.setMsg("NOPWD");
	            }
	        } else {
	            vo.setMsg("NOID");
	        }

	        rs.close();
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        dbconn.disConnection(conn, ps);
	    }
	    return vo;
	}
   

}
   
