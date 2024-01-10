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
		//회원 목록
		public List<MemberVO> memberListData(int page){
			List<MemberVO> list = new ArrayList<MemberVO>();
			try {
				conn=dbconn.getConnection();
				String sql = "SELECT id, name, email, phone, addr, num "
							+"FROM (SELECT id, name, email, phone, addr, rownum AS num "
							+"FROM (SELECT id, name, email, phone, addr "
							+"FROM user_ WHERE admin ='n' ORDER BY id ASC)) " 
							+"WHERE num BETWEEN ? AND ?";
				ps=conn.prepareStatement(sql);
				   int rowSize=5;
				   int start=(rowSize*page)-(rowSize-1); // 오라클 => 1번 
				   int end=rowSize*page;
				   
				   ps.setInt(1, start);
				   ps.setInt(2, end);
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
		// 회원 목록 총페이지
		public int memberListTotalPage() {
			int total=0;
			try {
				conn=dbconn.getConnection();
				String sql="SELECT CEIL(COUNT(*) / 5.0) FROM user_ WHERE ADMIN ='n'";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				total=rs.getInt(1);
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return total;
		}
		//회원 상세
		public MemberVO memberDetailData(String id){
			MemberVO vo = new MemberVO();
			
			try {
				conn=dbconn.getConnection();
				String sql = "SELECT id,password, email, name, phone, postcode, addr, detail_addr, admin "
						   + "FROM user_ "
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
		
		// 회원 수정
		public int adEditProfile(MemberVO vo)
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
							+ "admin=? "
							+ "WHERE id=?";
					ps=conn.prepareStatement(sql);
					ps.setString(1, vo.getName());
					ps.setString(2, vo.getEmail());
					ps.setString(3, vo.getPhone());
					ps.setString(4, vo.getPostcode());
					ps.setString(5, vo.getAddr());
					ps.setString(6, vo.getDetail_addr());
					ps.setString(7, vo.getAdmin());
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
		// 회원 삭제
		 public int memberDeleteOk(String id)
		   {
			 int success = 0;
			   try
			   {
				   conn=dbconn.getConnection();
				   
					   conn.setAutoCommit(false);
					   String sql="DELETE FROM reservation "
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
						   
						   sql="DELETE FROM cart "
							  +"WHERE id=?";
						   ps=conn.prepareStatement(sql);
						   ps.setString(1, id);
						   ps.executeUpdate();
						   
						   sql="DELETE FROM user_ "
								   +"WHERE id=?";
						   ps=conn.prepareStatement(sql);
						   ps.setString(1, id);
						   ps.executeUpdate();
						   
						   success=1;
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
			   return success;
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

//----------------------- 맛집 예약 관리(reservation)
		// 맛집예약 목록 => 맛집번호,맛집명,예약일,예약시간,인원,승인상태,아이디,이름,예약번호
		public List<FoodReserveVO> adFdReserveList(int page){
			List<FoodReserveVO> list=new ArrayList<>();
			try {
				conn=dbconn.getConnection();
				String sql="SELECT f.no, f.title, r.day, r.time, r.inwon, r.ok, r.id,u.name,r.frno "
						+ "FROM food f "
						+ "JOIN (SELECT res.*, ROWNUM AS num "
						+ "FROM reservation res) "
						+ "r ON f.no = r.fno "
						+ "JOIN user_ u ON r.id = u.id "
						+ "WHERE r.num BETWEEN ? AND ?"
						+ "ORDER BY r.frno DESC";
				ps=conn.prepareStatement(sql);
				int rowSize=5;
				int start=(rowSize*page)-(rowSize-1);
				int end=rowSize*page;
				ps.setInt(1, start);
				ps.setInt(2, end);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {			   	
					FoodReserveVO vo=new FoodReserveVO();
					vo.setFno(rs.getInt(1));
					vo.getFvo().setTitle(rs.getString(2));
					vo.setDay(rs.getString(3));
					vo.setTime(rs.getString(4));
					vo.setInwon(rs.getInt(5));
					vo.setOk(rs.getInt(6));
					vo.setId(rs.getString(7));
					vo.getMvo().setName(rs.getString(8));
					vo.setRno(rs.getInt(9));
					list.add(vo);
				}
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return list;
		}
		// 맛집예약 총페이지
		public int adfdreservationRowCount() {
			int total=0;
			try {
				conn=dbconn.getConnection();
				String sql="SELECT CEIL(COUNT(*)/5.0) FROM reservation";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				total=rs.getInt(1);
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return total;
		}
		
		// 관리자 맛집예약 상태 변경
		public void admin_fdReserve_ok(int frno, int ok)
		{
			try
			{
				conn=dbconn.getConnection();
				String sql="UPDATE reservation SET ok=? WHERE frno=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, ok);
				ps.setInt(2, frno);
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
		// 관리자 전시회예약 상태 변경		
		public void admin_exReserve_ok(int no, int rok)
		{
			try
			{
				conn=dbconn.getConnection();
				String sql="UPDATE reserve_info SET rok=? WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, rok);
				ps.setInt(2, no);
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
		
		//전시회,맛집 총 예약수
		public int adTotalresCount() {
			int total=0;
			try {
				conn=dbconn.getConnection();
				String sql="SELECT "
						+ "(SELECT COUNT(*) FROM reservation WHERE ok = 0) + "
						+ "(SELECT COUNT(*) FROM reserve_Info WHERE rok = 0) AS combined_count "
						+ "FROM dual";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				total=rs.getInt(1);
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return total;
		}
//----------------------- 맛집 예약 관리(reservation)		
		
//----------------------- 전시회 예약 관리(reserveInfo)		
		// 전시예약 목록( => 전시번호,전시회명,예약일,인원,승인상태,아이디,이름,예약번호
		public List<ReserveInfoVO> adExReserveList(int page){
			List<ReserveInfoVO> list=new ArrayList<ReserveInfoVO>();
			try {
				conn=dbconn.getConnection();
				String sql="SELECT e.eno, e.ename, ri.day, ri.inwon, ri.rok, ri.id,u.name, ri.no  "
						+ "FROM exhibition e "
						+ "JOIN (SELECT ri.*, ROWNUM AS num "
						+ "FROM reserve_info ri) ri "
						+  "ON e.eno = ri.eno "
						+ "JOIN user_ u ON ri.id = u.id "
						+ "WHERE ri.num BETWEEN ? AND ? "
						+ "ORDER BY ri.no DESC";
				ps=conn.prepareStatement(sql);
				int rowSize=5;
				int start=(rowSize*page)-(rowSize-1);
				int end=rowSize*page;
				ps.setInt(1, start);
				ps.setInt(2, end);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					ReserveInfoVO vo=new ReserveInfoVO();
					vo.getEvo().setEno(rs.getInt(1));
					vo.getEvo().setEname(rs.getString(2));
					vo.setDay(rs.getString(3));
					vo.setInwon(rs.getString(4));
					vo.setRok(rs.getInt(5));
					vo.getMvo().setId(rs.getString(6));
					vo.getMvo().setName(rs.getString(7));
					vo.setNo(rs.getInt(8));
					list.add(vo);
				}
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return list;
		}
		// 전시회예약 총페이지
		public int adreservationRowCount() {
			int total=0;
			try {
				conn=dbconn.getConnection();
				String sql="SELECT CEIL(COUNT(*)/5.0) FROM reserve_info";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				total=rs.getInt(1);
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return total;
		}
		
//--------------------- End of 전시회 예약 
		
//--------------------- 문의내역 관리
		/*
		 * private int qno; private String subject; private Date regdate;
		 * user id,name,
		 * + "WHERE ri.num BETWEEN ? AND ? "
						+ "ORDER BY ri.no DESC";
				ps=conn.prepareStatement(sql);
				int rowSize=5;
				int start=(rowSize*page)-(rowSize-1);
				int end=rowSize*page;
				ps.setInt(1, start);
				ps.setInt(2, end);
				
				ps
		 */
	    // 문의내역 목록
	    public List<QnaBoardVO> adGetAllQnas(int page) {
	        List<QnaBoardVO> list = new ArrayList<>();
			try
			{
				conn=dbconn.getConnection();
				String sql="SELECT qno,subject,regdate,status,name, id, num "
						+ "FROM (SELECT qno,subject,regdate,status,name, id,rownum as num "
						+ "FROM (SELECT qno,subject,regdate,status,name, id "
						+ "FROM QnaBoard "
						+ "WHERE group_step=0 "
						+ "ORDER BY qno DESC)) "
						+ "WHERE num BETWEEN ? AND ?";
				ps=conn.prepareStatement(sql);
				int rowSize=5;
				int start=(rowSize*page)-(rowSize-1);
				int end=rowSize*page;
				ps.setInt(1, start);
				ps.setInt(2, end);
				ResultSet rs=ps.executeQuery();
		         while(rs.next())
		         {
		        	QnaBoardVO vo=new QnaBoardVO();
		            vo.setQno(rs.getInt(1));
		            vo.setSubject(rs.getString(2));
		            vo.setRegdate(rs.getDate(3));
		            vo.setStatus(rs.getInt(4));
		            vo.setName(rs.getString(5));
		            vo.setId(rs.getString(6));
		            vo.setNum(rs.getInt(7));
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
		
		// 문의내역 총페이지
		public int adQnasTotalPage() {
			int total=0;
			try {
				conn=dbconn.getConnection();
				String sql="SELECT CEIL(COUNT(*)/5.0) FROM QnaBoard "
						+ "WHERE group_step=0";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				total=rs.getInt(1);
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return total;
		}
		
		// 문의 내역 총 갯수
		public int adQnasTotal() {
			int total=0;
			try {
				conn=dbconn.getConnection();
				String sql="SELECT COUNT(*) AS total FROM QnaBoard "
						+ "WHERE group_step=0";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				total=rs.getInt(1);
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbconn.disConnection(conn, ps);
			}
			return total;
		}
		
		//문의내역 답변 불러오기
		   public QnaBoardVO adQnaDetailData(int qno)
		   {
			     QnaBoardVO vo=new QnaBoardVO();
		         try
		         {
		        	conn=dbconn.getConnection();
		            String sql="SELECT qno,name,subject,cont,id,group_id "
		                    +"FROM qnaBoard "
		                    +"WHERE qno="+qno;
		            ps=conn.prepareStatement(sql);
		            ResultSet rs=ps.executeQuery();
		            if (rs.next()) {
		                vo.setQno(rs.getInt(1));
		                vo.setName(rs.getString(2));
		                vo.setSubject(rs.getString(3));
		                vo.setCont(rs.getString(4));
		                vo.setId(rs.getString(5));
		                vo.setGroup_id(rs.getInt(6));
		            }
		            rs.close();
		         }catch(Exception ex)
		         {
		           // 에러 출력 
		            ex.printStackTrace();
		         }
		         finally
		         {
		            // 반환 => 재사용 
		            dbconn.disConnection(conn, ps);
		         }
		         return vo;
		  }
		   
		//문의내역 답변하기
		   public void adQnaInsertData(QnaBoardVO vo)
		   {		
			   try {
				   conn=dbconn.getConnection();
					/*
					 * String sql =
					 * "SELECT MAX(group_step) FROM qnaBoard WHERE group_id="+vo.getGroup_id();
					 * ps=conn.prepareStatement(sql); ResultSet rs=ps.executeQuery(); rs.next(); int
					 * maxGId = rs.getInt(1);
					 */
				    
		           String sql="INSERT INTO qnaBoard(qno,name,subject,cont,pwd,filename,filesize,id,group_id,"
		            		+ "group_step) "
		            		+ "VALUES(qb_no_seq.nextval,?,?,?,?,?,?,?,?,?)";
		            ps=conn.prepareStatement(sql);
		            ps.setString(1, vo.getName());
		            ps.setString(2, vo.getSubject());
		            ps.setString(3, vo.getCont());
		            ps.setString(4, vo.getPwd());
		            ps.setString(5, vo.getFilename());
		            ps.setInt(6, vo.getFilesize());
		            ps.setString(7, vo.getId());
		            ps.setInt(8, vo.getGroup_id());
		            ps.setInt(9, 1);
		            ps.executeUpdate();
		            ps.close();
		            
		            sql = "UPDATE qnaBoard "
		            		+ "SET status = 1 "
		            		+ "WHERE group_id = "+vo.getGroup_id();
		            ps=conn.prepareStatement(sql);
		            ps.executeUpdate();
		            ps.close();
			   }catch (Exception e) {
					e.printStackTrace();
				}finally {
					dbconn.disConnection(conn, ps);
				}
		   }
}
