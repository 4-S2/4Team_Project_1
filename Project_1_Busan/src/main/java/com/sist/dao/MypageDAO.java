package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.*;


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
				String sql="SELECT id,name, password,email,phone, postcode, addr, detail_addr,email "
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
				vo.setEmail(rs.getString(9));
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
			int success = 0;
			try
			{
//				conn=dbconn.getConnection();
//				String sql="SELECT password "
//						+ "FROM member "
//						+ "WHERE user_id=?";
//				ps=conn.prepareStatement(sql);
//				ps.setString(1, vo.getId());
//				ResultSet rs=ps.executeQuery();
//				rs.next();
//				String pwd_ck=rs.getString(1);
//				rs.close();
//				
//				if(pwd_ck.equals(vo.getPwd()))
//				{
				
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

		// 회원 탈퇴하기
		// 연결된 테이블: reservation, jjim, heart, review, review_reply,order => cart, reserve_info
		 public String memberDeleteOk(String id,String pwd)
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
				   if(db_pwd.equals(pwd))
				   {
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

						   sql="DELETE FROM reserve_info "
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
						   
						   result="OK";
						   conn.commit();
				   }else {
					   result="NO";
				   }
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

//----------------------- 나의 예약내역
	    /*
	     * SELECT e.eno, e.ename , ri.day, ri.rok, ri.id, 
			FROM exhibition e
			JOIN reserve_info ri ON e.eno = ri.eno
			ORDER BY ri.eno;
	     */
		// 전시예약 목록 => 전시번호,전회명,예약일,인원,승인상태,아이디
		public List<ReserveInfoVO> myExReserveList(String id, int page){
			List<ReserveInfoVO> list=new ArrayList<ReserveInfoVO>();
			try {
				conn=dbconn.getConnection();
				String sql="SELECT e.eno, e.ename, ri.day, ri.inwon, ri.rok, ri.id,ri.no "
						+ "FROM exhibition e "
						+ "JOIN (SELECT ri.*, ROWNUM AS num "
						+ "FROM reserve_info ri "
						+  "WHERE ri.id = ?) ri ON e.eno = ri.eno "
						+ "WHERE ri.num BETWEEN ? AND ? "
						+ "ORDER BY ri.no DESC";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				int rowSize=5;
				int start=(rowSize*page)-(rowSize-1);
				int end=rowSize*page;
				ps.setInt(2, start);
				ps.setInt(3, end);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					ReserveInfoVO vo=new ReserveInfoVO();
					vo.getEvo().setEno(rs.getInt(1));
					vo.getEvo().setEname(rs.getString(2));
					vo.setDay(rs.getString(3));
					vo.setInwon(rs.getString(4));
					vo.setRok(rs.getInt(5));
					vo.getMvo().setId(rs.getString(6));
					vo.setNo(rs.getInt(7));
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
		public int reservationRowCount(String id) {
			int total=0;
			try {
				conn=dbconn.getConnection();
				String sql="SELECT CEIL(COUNT(*)/5.0) FROM reserve_info WHERE id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
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
		
		// 전시예약 상세 => 예약번호,전시번호,전시명,전시부제목,포스터,예약일,인원,승인상태,아이디,예약신청일
		   public ReserveInfoVO myExReserveDetail(String no)
		   {	ReserveInfoVO vo=new ReserveInfoVO();
			   try
			   {
				   conn=dbconn.getConnection();
				   String sql="SELECT ri.no, e.eno, e.ename , e.eeName , e.poster, ri.day, ri.inwon , "
				   		   +"ri.rok, ri.id, "
				   		   +"TO_CHAR(ri.regdate, 'yyyy-MM-dd hh24:mi:ss') AS regdate, "
				   		   + "e.loc, e.loc_detail "
						   +"FROM exhibition e "
						   +"JOIN reserve_info ri ON e.eno = ri.eno "
						   +"WHERE no=?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, no);
				   ResultSet rs=ps.executeQuery();
				   if(rs.next())
				   {
					   vo.setNo(rs.getInt(1));
					   vo.getEvo().setEno(rs.getInt(2));
					   vo.getEvo().setEname(rs.getString(3));
					   vo.getEvo().setEename(rs.getString(4));
					   vo.getEvo().setPoster(rs.getString(5));
					   vo.setDay(rs.getString(6));
					   vo.setInwon(rs.getString(7));
					   vo.setRok(rs.getInt(8));
					   vo.getMvo().setId(rs.getString(9));
					   vo.setRegdate(rs.getString(10));
					   vo.getEvo().setLoc(rs.getString(11));
					   vo.getEvo().setLoc_detail(rs.getString(12));
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
			   return vo;
		   }

		// 전시예약 취소
		public void delete_booking(int no) {
			try {
				conn = dbconn.getConnection();
				String sql = "DELETE FROM reserve_info where no=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				dbconn.disConnection(conn, ps);
			}
		}
		
		// 전시회예약 취소		
		public void exReserve_cc(int no)
		{
			try
			{
				conn=dbconn.getConnection();
				String sql="UPDATE reserve_info SET rok=2 WHERE no=?";
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
		
		/*
		 * SELECT f.no, f.title, r.day, r.time, r.inwon, r.ok, r.id
FROM food f
JOIN (
    SELECT res.*, ROWNUM AS num
    FROM reservation res
    WHERE res.id = :1
) r ON f.no = r.fno
WHERE r.num BETWEEN :2 AND :3
ORDER BY r.frno DESC;


		 */
		// 맛집예약 목록 => 맛집번호,맛집명,예약일,예약시간,인원,승인상태,아이디
		public List<FoodReserveVO> myFdReserveList(String id, int page){
			List<FoodReserveVO> list=new ArrayList<>();
			try {
				conn=dbconn.getConnection();
				String sql="SELECT f.no, f.title, r.day, r.time, r.inwon, r.ok, r.id,r.frno "
						+ "FROM food f "
						+ "JOIN (SELECT res.*, ROWNUM AS num "
						+ "FROM reservation res "
						+ "WHERE res.id = ?) r ON f.no = r.fno "
						+ "WHERE r.num BETWEEN ? AND ?"
						+ "ORDER BY r.frno DESC";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				int rowSize=5;
				int start=(rowSize*page)-(rowSize-1);
				int end=rowSize*page;
				ps.setInt(2, start);
				ps.setInt(3, end);
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
					vo.setRno(rs.getInt(8));
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
		
		// 맛집 예약 상세보기 => 예약번호 맛집번호 맛집명 예약일시 예약인원 예약신청일 승인상태 주소 전화번호 운영시간, 아이디
		public FoodReserveVO myFdReserveDetail(String frno){
			FoodReserveVO vo=new FoodReserveVO();
			try {
				conn=dbconn.getConnection();
				String sql="SELECT f.no, f.title, r.day, r.time, r.inwon, r.ok, r.id, r.frno, "
						+ "f.title, f.poster, f.addr, f.phone, "
						+ "TO_CHAR(r.regdate, 'yyyy-MM-dd hh24:mi:ss') AS regdate "
						+ "FROM food f "
						+ "JOIN reservation r ON f.no = r.fno "
						+ "WHERE frno = ?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, frno);
				   ResultSet rs=ps.executeQuery();
				   if(rs.next())
				   {
						vo.setFno(rs.getInt(1));
						vo.getFvo().setTitle(rs.getString(2));
						vo.setDay(rs.getString(3));
						vo.setTime(rs.getString(4));
						vo.setInwon(rs.getInt(5));
						vo.setOk(rs.getInt(6));
						vo.setId(rs.getString(7));
						vo.setRno(rs.getInt(8));
						vo.getFvo().setTitle(rs.getString(9));
						vo.getFvo().setPoster(rs.getString(10));
						vo.getFvo().setAddr(rs.getString(11));
						vo.getFvo().setPhone(rs.getString(12));
						vo.setRegdate(rs.getString(13));
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
			   return vo;
		   }
		// 맛집예약 총페이지
		public int fdreservationRowCount(String id) {
			int total=0;
			try {
				conn=dbconn.getConnection();
				String sql="SELECT CEIL(COUNT(*)/5.0) FROM reservation WHERE id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
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
		
		//전시회,맛집 총 예약수
		public int TotalresCount(String id) {
			int total=0;
			try {
				conn=dbconn.getConnection();
				String sql="SELECT COUNT(*) AS total_count FROM( "
						+ "SELECT id FROM reservation WHERE id = ? "
						+ "UNION ALL "
						+ "SELECT id FROM reserve_info WHERE id = ?) combined_data";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, id);
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
		
		// 맛집예약 취소
		public void fdReserve_cc(int frno)
		{
			try
			{
				conn=dbconn.getConnection();
				String sql="UPDATE reservation SET ok=2 WHERE frno=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, frno);
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

		
//------------------------ End of 예약 

		
//------------------------ 문의내역
			/*
			 * private int qno; private String subject; private Date regdate;
			 */
		    // 나의 문의내역
		    public List<QnaBoardVO> getAllQnas(String id) {
		        List<QnaBoardVO> list = new ArrayList<>();
				try
				{
					conn=dbconn.getConnection();
					String sql="SELECT qno,subject,regdate,status "
							+ "FROM QnaBoard "
							+ "WHERE id=? "
							+ "ORDER BY qno DESC";
					ps=conn.prepareStatement(sql);
					ps.setString(1, id);
					ResultSet rs=ps.executeQuery();
			         while(rs.next())
			         {
			        	 QnaBoardVO vo=new QnaBoardVO();
			            vo.setQno(rs.getInt(1));
			            vo.setSubject(rs.getString(2));
			            vo.setRegdate(rs.getDate(3));
			            vo.setStatus(rs.getInt(4));
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
			public int QnasTotalPage(String id) {
				int total=0;
				try {
					conn=dbconn.getConnection();
					String sql="SELECT CEIL(COUNT(*)/5.0) FROM QnaBoard "
							+ "WHERE id=?";
					ps=conn.prepareStatement(sql);
					ps.setString(1, id);
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
			
//------------------------ End of 문의내역

//------------------------ 장바구니/구매내역
			//특산물 리스트 (검색기능 추가)
			public List<GoodsVO> adGoodsListData(int page){
				List<GoodsVO> list = new ArrayList<GoodsVO>();
				try {
					conn=dbconn.getConnection();
					String sql="SELECT gno, gname, price, amount, num "
							  +"FROM (SELECT gno, gname, amount, price, rownum as num "
							  +"FROM (SELECT gno, gname, amount, price "
							  +"FROM goods ORDER BY gno ASC)) "
							  +"WHERE num BETWEEN ? AND ?";
					ps=conn.prepareStatement(sql);
					
					int rowSize=8;
					int start=(rowSize*page)-(rowSize-1);
					int end=rowSize*page;
					
					ps.setInt(1, page);
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
			
			// 나의 구매내역
			public List<CartVO> myBuyData(String id, int page) {
				List<CartVO> list=new ArrayList<>();
				
				try {
			        conn=dbconn.getConnection();
			        String sql="SELECT cart_no,GNO, amount, price, id, regdate, GNAME, poster,issale,ischeck, num "
			        		+ "FROM (SELECT cart_no,GNO, amount, price, id, regdate, GNAME, poster,issale,ischeck, rownum AS num "
			        		+ "FROM (SELECT cart_no,c.GNO, amount, c.price, c.id, regdate, g.GNAME, g.poster,issale,ischeck "
			        		+ "FROM cart c,goods g "
			        		+ "WHERE c.gno=g.gno AND id=? AND issale=1 ORDER BY cart_no DESC)) "
			        		+ "WHERE num BETWEEN ? AND ?";
			        ps=conn.prepareStatement(sql);
			        ps.setString(1, id);
					int rowSize=5;
					int start=(rowSize*page)-(rowSize-1);
					int end=rowSize*page;
					ps.setInt(2, start);
					ps.setInt(3, end);
					ResultSet rs=ps.executeQuery();
			        while(rs.next()) {
			        	CartVO vo=new CartVO();
			            vo.setCart_no(rs.getInt(1));
			            vo.setGno(rs.getInt(2));
			            vo.setAmount(rs.getInt(3));
			            vo.getGvo().setPrice(rs.getString(4));
			            vo.setId(rs.getString(5));
			            vo.setRegdate(rs.getDate(6));
			            vo.getGvo().setGname(rs.getString(7));
			            vo.getGvo().setPoster(rs.getString(8));
			            vo.setIssale(rs.getInt(9));
			            vo.setIscheck(rs.getInt(10));
			            vo.setNum(rs.getInt(11));
			            list.add(vo);
			        }
			        rs.close();
			    } catch (Exception ex) {
			        ex.printStackTrace();
			    } finally {
			        dbconn.disConnection(conn, ps);
			    }
				return list;
			}
			
			// 총 구매내역 숫자
			public int myBuyTotal(String id) {
				int total=0;
				try {
					conn=dbconn.getConnection();
					String sql="SELECT COUNT(*) FROM cart WHERE id=? AND issale=1";
					ps=conn.prepareStatement(sql);
					ps.setString(1, id);
					ResultSet rs=ps.executeQuery();
					rs.next();
					total=rs.getInt(1);
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					dbconn.disConnection(conn, ps);
				}
				return total;
			}
			
			//구매내역 총페이지
			public int myBuyTotalPage(String id) {
				int totalpage=0;
				
				try {
					conn=dbconn.getConnection();
					String sql="SELECT CEIL(COUNT(*)/5.0) FROM cart WHERE id=? AND issale=1";
					ps=conn.prepareStatement(sql);
					ps.setString(1, id);
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
}
