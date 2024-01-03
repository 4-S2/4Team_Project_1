package com.sist.dao;

import java.util.*;
import java.sql.*;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.model.BusanListModel;
import com.sist.vo.*;

public class GoodsDAO {
	private Connection conn; // 데이터베이스 연결
	private PreparedStatement ps;// SQL전송, 결과값 
	private static GoodsDAO dao;
	   
	// DBCP 라이브러리 
	private CreateDBCPConnection dbconn=new CreateDBCPConnection();
	   
	public static GoodsDAO newInstance() {
		if (dao==null) {
			dao=new GoodsDAO();
		}
		return dao;
	}
	
	   
	// TOP3 특산물 리스트 출력
	public List<GoodsVO> goodsfindTop3(){
		List<GoodsVO> list=new ArrayList<>(); // 여러 개를 출력하는 경우
		try {
			// 연결 
			conn=dbconn.getConnection();
			// SQL 
			String sql="SELECT gno, gname, poster, price "
					  +"FROM goods "
	                  +"WHERE gno IN(76,157,12)"; // 지정한 번호(gno)에 해당하는 상품 출력
			// 전송
			ps=conn.prepareStatement(sql);
	         
			// 결과값
			ResultSet rs=ps.executeQuery();
			while(rs.next()) { // 출력 첫번째 위치부터 읽기 시작 
				GoodsVO vo=new GoodsVO();
	            vo.setGno(rs.getInt(1));
	            vo.setGname(rs.getString(2));
	            vo.setPoster(rs.getString(3));
	            vo.setPrice(rs.getString(4));
	            list.add(vo);
	         }
	         rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		finally{
			// 반환 => 재사용
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	   
	 // 특산물 리스트 출력
	public List<GoodsVO> goodsListData(int page) {
		List<GoodsVO> list=new ArrayList<>();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT gno, gname, poster, price, num "
					  +"FROM (SELECT gno, gname, poster, price, rownum as num "
					  +"FROM (SELECT gno, gname, poster, price "
					  +"FROM goods ORDER BY gno ASC)) "
					  +"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			
			// ?에 값 채움
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1); // 오라클 => 1번 
			int end=rowSize*page;
			   
			ps.setInt(1, start);
			ps.setInt(2, end);
			   
			ResultSet rs=ps.executeQuery();
			while(rs.next()) { // 출력 1번째 위치부터 읽기 시작 
				GoodsVO vo=new GoodsVO();
				vo.setGno(rs.getInt(1));
				vo.setGname(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setPrice(rs.getString(4));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	
	public int goodsListTotalPage(){
		int total=0;
		try{
			conn=dbconn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM goods";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			
			total=rs.getInt(1);
			
			rs.close();
		   }catch(Exception ex) {
			   ex.printStackTrace();
		   }
		   finally {
			   dbconn.disConnection(conn, ps);
		   }
		   return total;
	   }	   
	   
	
	// 특산물 상세보기
	public GoodsVO goodsDetailData(int gno) {
		GoodsVO vo=new GoodsVO();
		try {
			conn=dbconn.getConnection();
			
			String sql="SELECT * FROM goods "
	                  +"WHERE gno="+gno;
	         
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				vo.setGno(rs.getInt(1));
	            vo.setGname(rs.getString(2));
	            vo.setPoster(rs.getString(3));
	            vo.setOrigin(rs.getString(4));
	            vo.setManufacturer(rs.getString(5));
	            vo.setPrice(rs.getString(6));
	            vo.setDimage(rs.getString(7));
			}
			rs.close();
	      }catch(Exception ex) {
	         ex.printStackTrace();
	      }
	      finally {
	         dbconn.disConnection(conn, ps);
	      }
	      return vo;
	   }
	   
}
