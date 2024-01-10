package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.sist.dbcp.CreateDBCPConnection;
import java.util.*;
import com.sist.model.BusanListModel;
import com.sist.vo.*;

import java.sql.*;
public class HeartDAO {
	   private Connection conn; //데이터베이스 연결
	   private PreparedStatement ps;//SQL전송 , 결과값 
	   private static HeartDAO dao;
	   // DBCP라이브러리 
	   private CreateDBCPConnection dbconn=
			        new CreateDBCPConnection();
	   
	   public static HeartDAO newInstance() {
		   if (dao==null)
			   dao = new HeartDAO();
			return dao;		   
	   }
	   
	   /*
			SELECT j.jno, tour.poster, tour.TITLE, j.no 
			FROM user_ u 
			JOIN Heart j ON u.id = j.id 
			JOIN tour ON j.no = tour.NO 
			WHERE u.id = 'yeon' 
			ORDER BY j.jno DESC;
	    * 
	    */
	// 찜한 명소,축제,맛집,체험 목록 -> 마이페이지
	public List<HeartVO> busanHeartListData(String id,String tab,int cateno) {
		List<HeartVO> list = new ArrayList<>();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT h.hno, "+tab+".poster, "+tab+".TITLE, h.no "
					+ "FROM user_ u "
					+ "JOIN Heart h ON u.id = h.id "
					+ "JOIN "+tab+" ON h.no = "+tab+".NO "
					+ "WHERE u.id=? AND h.CATENO = "+cateno
					+ " ORDER BY h.hno DESC";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				HeartVO vo = new HeartVO();
				vo.setHno(rs.getInt(1));
				vo.getBvo().setPoster(rs.getString(2));
				vo.getBvo().setTitle(rs.getString(3));
				vo.setNo(rs.getInt(4));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	// 찜한 전시회 목록 -> 마이페이지
	public List<HeartVO> exHeartListData(String id) {
		List<HeartVO> list = new ArrayList<>();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT h.jno, e.poster, e.ename, h.eno "
					+ "FROM user_ u "
					+ "JOIN Heart h ON u.id = h.id "
					+ "JOIN EXHIBITION e ON h.no = e.eNO "
					+ "WHERE u.id=? AND h.CATENO = 5 "
					+ "ORDER BY h.hno DESC";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				HeartVO vo = new HeartVO();
				vo.setHno(rs.getInt(1));
				vo.getEvo().setPoster(rs.getString(2));
				vo.getEvo().setEname(rs.getString(3));
				vo.setNo(rs.getInt(4));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	public String HeartUpdate(String id,int cateno,int no)
	{
		String result="";
		try {
			conn=dbconn.getConnection();
			String sql="SELECT count(*) FROM Heart"
					+ " WHERE id=? AND cateno=? AND no=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, cateno);
			ps.setInt(3, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			ps.close();
			
			if(count!=1)
			{
				sql="INSERT INTO Heart "
						+ "VALUES((SELECT NVL(MAX(jno)+1,1) FROM Heart),"
						+ "?,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setInt(2, cateno);
				ps.setInt(3, no);
				ps.executeUpdate();
				result="ok";			
			}
			else {
				sql="DELETE FROM Heart "
						+ "WHERE id=? AND CATENO=? AND NO=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setInt(2, cateno);
				ps.setInt(3, no);
				ps.executeUpdate();
				result="no";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return result;
	}
	
	public String ex_HeartUpdate(String id,int cateno,int eno)
	{
		String result="";
		try {
			conn=dbconn.getConnection();
			String sql="SELECT count(*) FROM Heart"
					+ " WHERE id=? AND cateno=? AND eno=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, 5);
			ps.setInt(3, eno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			ps.close();
			
			if(count!=1)
			{
				sql="INSERT INTO Heart "
						+ "VALUES((SELECT NVL(MAX(hno)+1,1) FROM Heart),"
						+ "?,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setInt(2, 5);
				ps.setInt(3, eno);
				ps.executeUpdate();
				result="ok";			
			}
			else {
				sql="DELETE FROM Heart "
						+ "WHERE id=? AND CATENO=? AND NO=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setInt(2, 5);
				ps.setInt(3, eno);
				ps.executeUpdate();
				result="no";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return result;
	}
}
