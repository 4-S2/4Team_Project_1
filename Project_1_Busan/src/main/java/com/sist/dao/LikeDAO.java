package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;
import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.LikeVO;

	public class LikeDAO {
		   private Connection conn; //데이터베이스 연결
		   private PreparedStatement ps;//SQL전송 , 결과값 
		   private static LikeDAO dao;
		   // DBCP라이브러리 
		   private CreateDBCPConnection dbconn=
				        new CreateDBCPConnection();
		   
		   public static LikeDAO newInstance() {
			   if (dao==null)
				   dao = new LikeDAO();
				return dao;		   
		   }
		   
		   public void LikeInsert(LikeVO vo) {
				try {
					conn=dbconn.getConnection();
					String sql="INSERT INTO heart VALUES("
							+ "heart_eno_seq.nextval,?,?)";
					ps=conn.prepareStatement(sql);
					ps.setString(1, vo.getDvo().getId()); 
					ps.setInt(2, vo.getEno());
					ps.executeUpdate();
				} catch (Exception ex) {
					ex.printStackTrace();
				} finally {
					dbconn.disConnection(conn, ps);
				}
			}
		   
		   public int LikeOk(int eno,String id) {
				int like_ok=0;
				try {
					conn=dbconn.getConnection();
					String sql="SELECT COUNT(*) FROM heart "
							+ "WHERE eno=? AND id=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, eno);
					ps.setString(2, id);
					ResultSet rs=ps.executeQuery();
					rs.next();
					like_ok=rs.getInt(1);
					rs.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				} finally {
					dbconn.disConnection(conn, ps);
				}
				return like_ok;
			}
		   
		// like취소
			public void LikeCancle(String id, int eno) {
				try {
					conn=dbconn.getConnection();
					String sql="DELETE FROM heart WHERE id=? AND eno=?";
					
					ps=conn.prepareStatement(sql);
					ps.setString(1, id);
					ps.setInt(2, eno);
					ps.executeUpdate();
				} catch (Exception ex) {
					ex.printStackTrace();
				} finally {
					dbconn.disConnection(conn, ps);
				}
			}
		   
}
