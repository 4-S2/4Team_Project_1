package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.dbcp.*;
import com.sist.vo.*;
public class ReserveDAO {
   private Connection conn;
   private PreparedStatement ps;
   private CreateDBCPConnection dbconn=new CreateDBCPConnection();
   private static ReserveDAO dao;
   
   // 싱글턴 
   public static ReserveDAO newInstance()
   {
	   if(dao==null)
		   dao=new ReserveDAO();
	   return dao;
   }
   // 맛집 읽기 
   public List<ExVO> exReserveData()
   {
	   List<ExVO> list=new ArrayList<ExVO>();
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT poster,ename,Homepage,rday,eno "
				     +"FROM exhibition";
				     
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   ExVO vo=new ExVO();
			   
			   vo.setPoster(rs.getString(1));
			   vo.setEname(rs.getString(2));
			   vo.setHomepage(rs.getString(3));
			   vo.setRday(rs.getString(4));
			   vo.setEno(rs.getInt(5));
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
   // 예약 => 맛집마다 가능한 날을 읽어 온다 
   public String exReserveDay(int eno)
   {
	   String result="";
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT rday FROM exhibition "
				     +"WHERE eno=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, eno);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   result=rs.getString(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   }
	   return result;
   }
   
   // 예약 등록 
   /*
    *   no NUMBER,
	   id VARCHAR2(20),
	   eno NUMBER,
	   rday VARCHAR2(30) CONSTRAINT ri_day_nn NOT NULL,
	   rtime VARCHAR2(30) CONSTRAINT ri_time_nn NOT NULL,
	   inwon VARCHAR2(30) CONSTRAINT ri_inwon_nn NOT NULL,
	   ok CHAR(1) DEFAULT 'n',
	   regdate DATE DEFAULT SYSDATE,
    */
   //JDBC => 성공(commit) => 실패 (rollback)
   public void reserve_ok(ReserveVO vo)
   {
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="INSERT INTO reserve_info VALUES("
				     +"SEQ_NO_eres.nextval,?,?,?,?,?,'n',SYSDATE)";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getId());
		   ps.setInt(2, vo.getEno());
		   ps.setString(3, vo.getRday());
		   ps.setString(4, vo.getInwon());
		   ps.setDate(5, null);
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
   // 예약현황 출력 
   public List<ReserveVO> reserveInfoData(String id)
   {
	   List<ReserveVO> list=new ArrayList<ReserveVO>();
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT no,eno,rday,rtime,inwon,TO_CHAR(regdate,'yyyy-MM-dd hh24:mi:ss'),"
				     +"exGetPoster(eno),exGetName(eno),exGetPhone(eno),ok,id "
				     +"FROM reserve_info "
				     +"WHERE id=? "
				     +"ORDER BY no DESC";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   ReserveVO vo=new ReserveVO();
			   vo.setNo(rs.getInt(1));
			   vo.setEno(rs.getInt(2));
			   vo.setRday(rs.getString(3));
			   vo.setRtime(rs.getString(4));
			   vo.setInwon(rs.getString(5));
			   vo.setDbday(rs.getString(6));
			   vo.setPoster(rs.getString(7));
			   vo.setName(rs.getString(8));
			   vo.setHomepage(rs.getString(9));
			   vo.setRok(rs.getString(10));
			   vo.setId(rs.getString(11));
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
   public List<ReserveVO> reserveAdminData()
   {
	   List<ReserveVO> list=new ArrayList<ReserveVO>();
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT no,eno,rday,rtime,inwon,TO_CHAR(regdate,'yyyy-MM-dd hh24:mi:ss'),"
				     +"exGetPoster(eno),exGetName(eno),exGetHomepage(eno),ok,id "
				     +"FROM reserve_info "
				     +"ORDER BY no DESC";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   ReserveVO vo=new ReserveVO();
			   vo.setNo(rs.getInt(1));
			   vo.setEno(rs.getInt(2));
			   vo.setRday(rs.getString(3));
			   vo.setRtime(rs.getString(4));
			   vo.setInwon(rs.getString(5));
			   vo.setDbday(rs.getString(6));
			   vo.setPoster(rs.getString(7));
			   vo.setName(rs.getString(8));
			   vo.setHomepage(rs.getString(9));
			   vo.setRok(rs.getString(10));
			   vo.setId(rs.getString(11));
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
   public void reserveOk(int no)
   {
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="UPDATE reserve_info SET "
				     +"ok='y' "
				     +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
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
   // 예약 정보 
   public ReserveVO reserveInfoData(int no)
   {
	   ReserveVO vo=new ReserveVO();
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT no,day,time,inwon,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') "
				     +"FROM reserve_info "
				     +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   vo.setNo(rs.getInt(1));
		   vo.setRday(rs.getString(2));
		   vo.setRtime(rs.getString(3));
		   vo.setInwon(rs.getString(4));
		   vo.setDbday(rs.getString(5));
		   rs.close();
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
   // 맛집 정보 
   // public ExVO findByeno(int eno);
   public ExVO reserveexInfoData(int eno)
   {
	   ExVO vo=new ExVO();
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT ename,poster,loc,homepage,cate,price, "
				     +"FROM exhibition "
				     +"WHERE eno=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, eno);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   vo.setEname(rs.getString(1));
		   vo.setPoster(rs.getString(2));
		   vo.setLoc(rs.getString(3));
		   vo.setHomepage(rs.getString(4));
		   vo.setCate(rs.getString(5));
		   vo.setPrice(rs.getInt(6));
		
		   rs.close();
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







