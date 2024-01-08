package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.*;

public class AdminDAO {
	   private Connection conn; //데이터베이스 연결
	   private PreparedStatement ps;//SQL전송 , 결과값 
	   private static AdminDAO dao;
	   // DBCP라이브러리 
	   private CreateDBCPConnection dbconn=
			        new CreateDBCPConnection();
	   
	   public static AdminDAO newInstance() {
		   if (dao==null)
			   dao = new AdminDAO();
			return dao;		   
	   }
	   
//----------------------- 회원관리(member)
		//회원 리스트
		public List<MemberVO> memberListData(){
			List<MemberVO> list = new ArrayList<MemberVO>();
			
			try {
				conn=dbconn.getConnection();
				String sql = "SELECT id, name, email, phone, addr "
						   + "FROM user_ "
						   + "WHERE admin ='n' "
						   + "ORDER BY id ASC";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					MemberVO vo=new MemberVO();
					vo.setId(rs.getString(1));
					vo.setName(rs.getString(2));
					vo.setEmail(rs.getString(3));
					vo.setPhone(rs.getString(4));
					vo.setAddr(rs.getString(5));
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
		//회원 상세
		public MemberVO memberDetailData(String id){
			MemberVO vo = new MemberVO();
			
			try {
				conn=dbconn.getConnection();
				String sql = "SELECT id,password, email, name, phone, postcode, addr, detail_addr, admin "
						   + "FROM member "
						   + "WHERE id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {
				vo.setId(rs.getString(1));
				vo.setPwd(rs.getString(2));
				vo.setEmail(rs.getString(3));
				vo.setName(rs.getString(4));
				vo.setPhone(rs.getString(5));
				vo.setPostcode(rs.getString(6));
				vo.setAddr(rs.getString(7));
				vo.setDetail_addr(rs.getString(8));
				vo.setAdmin(rs.getString(9));
				}
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbconn.disConnection(conn, ps);
			}
			
			return vo;
		}
		
		// 회원 수정 => 마이페이지랑 메소드 겹치면 거기꺼 쓸까??
		public int editProfile(MemberVO vo)
		{
			int success = 0;
			try
			{
				// 수정
				conn=dbconn.getConnection();
				String sql="UPDATE USER_ SET "
							+ "name=?, "
							+ "email=?, "
							+ "phone=?, "
							+ "postcode=?, "
							+ "addr=?, "
							+ "detail_addr=?, "
							+ "password=? "
							+ "WHERE id=?";
					ps=conn.prepareStatement(sql);
					ps.setString(1, vo.getName());
					ps.setString(2, vo.getEmail());
					ps.setString(3, vo.getPhone());
					ps.setString(4, vo.getPostcode());
					ps.setString(5, vo.getAddr());
					ps.setString(6, vo.getDetail_addr());
					ps.setString(7, vo.getPwd());
					ps.setString(8, vo.getId());
					success = ps.executeUpdate();
				
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
			finally
			{
				dbconn.disConnection(conn, ps);
			}
			return success;
		}
		
		 public String memberDeleteOk(String id)
		   {
			   String result="fail";
			   try
			   {
				   conn=dbconn.getConnection();
				   
				   String sql="SELECT password FROM user_ "
						     +"WHERE id=?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, id);
				   ResultSet rs=ps.executeQuery();
				   rs.next();
				   String db_pwd=rs.getString(1);
				   rs.close();
					   conn.setAutoCommit(false);
						   sql="DELETE FROM reservation "
							  +"WHERE id=?";
						   ps=conn.prepareStatement(sql);
						   ps.setString(1, id);
						   ps.executeUpdate();
						   
						   sql="DELETE FROM jjim  "
								   +"WHERE id=?";
						   ps=conn.prepareStatement(sql);
						   ps.setString(1, id);
						   ps.executeUpdate();
						   
						   sql="DELETE FROM heart  "
								   +"WHERE id=?";
						   ps=conn.prepareStatement(sql);
						   ps.setString(1, id);
						   ps.executeUpdate();
						   
						   sql="DELETE FROM qnaboard "
								   +"WHERE id=?";
						   ps=conn.prepareStatement(sql);
						   ps.setString(1, id);
						   ps.executeUpdate();
						   
						   sql="DELETE FROM review "
								   +"WHERE id=?";
						   ps=conn.prepareStatement(sql);
						   ps.setString(1, id);
						   ps.executeUpdate();

						   sql="DELETE FROM review "
							  +"WHERE id=?";
						   ps=conn.prepareStatement(sql);
						   ps.setString(1, id);
						   ps.executeUpdate();
						   
						   sql="DELETE FROM review_reply "
							  +"WHERE id=?";
						   ps=conn.prepareStatement(sql);
						   ps.setString(1, id);
						   ps.executeUpdate();
						   
						   sql="DELETE FROM order "
							  +"WHERE id=?";
						   ps=conn.prepareStatement(sql);
						   ps.setString(1, id);
						   ps.executeUpdate();
						   
						   sql="DELETE FROM uesr_ "
								   +"WHERE id=?";
						   ps=conn.prepareStatement(sql);
						   ps.setString(1, id);
						   ps.executeUpdate();
						   
						   result="OK";
						   conn.commit();
			   }catch(Exception ex){
				   ex.printStackTrace();
				   try{
					   conn.rollback();
				   }catch(Exception e) {}
				   
			   	}finally{
				   dbconn.disConnection(conn, ps);
				   try{
					   conn.setAutoCommit(true);
				   }catch(Exception ex) {}
			   }
			   return result;
		   }
//----------------------- END OF 회원관리

//----------------------- 특산물 관리(goods)
		//특산물 리스트 (검색기능 추가)
		public List<GoodsVO> adGoodsListData(int page, String search){
			List<GoodsVO> list = new ArrayList<GoodsVO>();
			
			try {
				conn=dbconn.getConnection();
				String sql="SELECT gno, gname, poster, price, num "
						  +"FROM (SELECT gno, gname, poster, price, rownum as num "
						  +"FROM (SELECT gno, gname, poster, price "
						  +"FROM goods WHERE gname LIKE '%'||?||'%' ORDER BY gno ASC)) "
						  +"WHERE num BETWEEN ? AND ?";
				ps=conn.prepareStatement(sql);
				
				int rowSize=8;
				int start=(rowSize*page)-(rowSize-1);
				int end=rowSize*page;
				
				ps.setString(1, search);
				ps.setInt(2, start);
				ps.setInt(3, end);
				
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					GoodsVO vo=new GoodsVO();
					vo.setGno(rs.getInt(1));
					vo.setGname(rs.getString(2));
					vo.setPoster(rs.getString(3));
					vo.setPrice(rs.getString(4));
					list.add(vo);
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
		
		//특산물 총페이지
		public int adGoodsTotalPage(String search) {
			int totalpage=0;
			
			try {
				conn=dbconn.getConnection();
				String sql="SELECT CEIL(COUNT(*)/8.0) FROM goods WHERE gname LIKE '%'||?||'%'";
				ps=conn.prepareStatement(sql);
				ps.setString(1, search);
				ResultSet rs=ps.executeQuery();
				rs.next();
				totalpage=rs.getInt(1);
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbconn.disConnection(conn, ps);
			}
			return totalpage;
		}
		
		//특산물 상세 
		public GoodsVO adGoodsDetailData(int gno) {
			GoodsVO vo=new GoodsVO();
			
			try {
				conn=dbconn.getConnection();
				String sql="SELECT * FROM goods "
		                  +"WHERE gno=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, gno);
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
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbconn.disConnection(conn, ps);
			}
			return vo;
		}
		
		//특산물 수정
		public int adGoodsUpdate(GoodsVO vo) {
			int success = 0;
			try {
				conn=dbconn.getConnection();
				conn.setAutoCommit(false);
				String sql="UPDATE goods SET "
						 + "gname=?,poster=?,origin=?,manufacturer=?,price=?,dimage=? "
						 + "WHERE gno=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getGname());
				ps.setString(2, vo.getPoster());
				ps.setString(3, vo.getOrigin());
				ps.setString(4, vo.getManufacturer());
				ps.setString(5, vo.getPrice());
				ps.setString(6, vo.getDimage());
				ps.setInt(7, vo.getGno());;
				ps.executeUpdate();
				
				conn.commit();
				success = ps.executeUpdate();
			} catch (Exception e) {
				try {
					conn.rollback();
				} catch (Exception ex) {}
				e.printStackTrace();
			} finally {
				try {
				   conn.setAutoCommit(true);
				} catch(Exception ex) {}
				dbconn.disConnection(conn, ps);
			}
			return success;
		}
		
		//특산물 삭제
		public int adGoodsDelete(int gno) {
			int success = 0;
			try {
				conn=dbconn.getConnection();
				conn.setAutoCommit(false);
				String sql="DELETE FROM oreder WHERE gno=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, gno);
				success = ps.executeUpdate();
				
				sql="DELETE FROM goods WHERE gno=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, gno);
				success += ps.executeUpdate();
				
				conn.commit();
			} catch (Exception e) {
				try {
					conn.rollback();
				} catch (Exception e2) {}
				e.printStackTrace();
			} finally {
				try {
					conn.setAutoCommit(true);
				} catch (Exception e2) {}
				dbconn.disConnection(conn, ps);
			}
			return success;
		}
		//----------------------- END OF 특산물 관리 
}
