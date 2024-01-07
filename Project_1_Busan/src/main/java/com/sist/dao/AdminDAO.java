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
	   
		//회원 리스트
		public List<MemberVO> memberListData(){
			List<MemberVO> list = new ArrayList<MemberVO>();
			
			try {
				conn=dbconn.getConnection();
				String sql = "SELECT id, name, email, phone, addr "
						   + "FROM user_ "
						   + "WHERE admin ='n' ";
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
		//회원 정보 
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
}
