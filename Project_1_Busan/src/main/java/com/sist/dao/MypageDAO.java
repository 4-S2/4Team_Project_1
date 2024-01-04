package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.GoodsVO;
import com.sist.vo.MemberVO;
import com.sist.vo.QnaBoardVO;

public class MypageDAO {
	   private Connection conn; //데이터베이스 연결
	   private PreparedStatement ps;//SQL전송 , 결과값 
	   private static MypageDAO dao;
	   // DBCP라이브러리 
	   private CreateDBCPConnection dbconn=
			        new CreateDBCPConnection();
	   
	   public static MypageDAO newInstance() {
		   if (dao==null)
			   dao = new MypageDAO();
			return dao;		   
	   }

		
		// 로그인 된 내정보 찾기
		public MemberVO myprofile(String id)
		{
			MemberVO vo=new MemberVO();
			try
			{
				conn=dbconn.getConnection();
				String sql="SELECT id,name, password,email,phone, postcode, addr, detail_addr "
						+"FROM user_ WHERE id=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				
				ResultSet rs = ps.executeQuery();
				rs=ps.executeQuery();
				rs.next();
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setPwd(rs.getString(3));
				vo.setEmail(rs.getString(4));
				vo.setPhone(rs.getString(5));
				vo.setPostcode(rs.getString(6));
				vo.setAddr(rs.getString(7));
				vo.setDetail_addr(rs.getString(8));
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
		
		// 회원정보 수정
		public int editProfile(MemberVO vo)
		{
			int cnt = 0;
			try
			{
				conn=dbconn.getConnection();
				String sql="SELECT password "
						+ "FROM member "
						+ "WHERE user_id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getId());
				ResultSet rs=ps.executeQuery();
				rs.next();
				String pwd_ck=rs.getString(1);
				rs.close();
				
				if(pwd_ck.equals(vo.getPwd()))
				{
					// 수정
					sql="UPDATE USER_ SET "
							+ "user_name=?, "
							+ "email=?, "
							+ "phone=?, "
							+ "postcode=?, "
							+ "addr=?, "
							+ "detail_addr=? "
							+ "WHERE user_id=?";
					ps=conn.prepareStatement(sql);
					ps.setString(1, vo.getName());
					ps.setString(2, vo.getEmail());
					ps.setString(3, vo.getPhone());
					ps.setString(4, vo.getPostcode());
					ps.setString(5, vo.getAddr());
					ps.setString(6, vo.getDetail_addr());
					ps.setString(7, vo.getId());
					cnt = ps.executeUpdate();
				}
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
			finally
			{
				dbconn.disConnection(conn, ps);
			}
			return cnt;
		}

		/*
		 * private int qno; private String subject; private Date regdate;
		 */
	    // 나의 문의내역
	    public List<QnaBoardVO> getAllQnas(String id) {
	        List<QnaBoardVO> list = new ArrayList<>();
			try
			{
				conn=dbconn.getConnection();
				String sql="SELECT qno,subject,regdate "
						+ "FROM QnaBoard "
						+ "WHERE id="+id;
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
		         while(rs.next()) // 출력 1번째 위치부터 읽기 시작 
		         {
		        	 QnaBoardVO vo=new QnaBoardVO();
		            vo.setQno(rs.getInt(1));
		            vo.setSubject(rs.getString(2));
		            vo.setRegdate(rs.getDate(3));
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
}
