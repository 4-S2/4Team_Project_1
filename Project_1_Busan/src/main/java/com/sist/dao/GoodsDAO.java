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
	
	   
	// TOP3 상품 리스트 출력
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
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally{
			// 반환 => 재사용
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	   
	// 상품 리스트 출력
	public List<GoodsVO> goodsListData(int page) {
		List<GoodsVO> list=new ArrayList<>();
		try {
			conn=dbconn.getConnection();
			
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1); // 오라클 => 1번 
			int end=rowSize*page;
			
			String sql="SELECT gno, gname, poster, price, num "
					  +"FROM (SELECT gno, gname, poster, price, rownum as num "
					  +"FROM (SELECT gno, gname, poster, price "
					  +"FROM goods ORDER BY gno ASC)) "
					  +"WHERE num BETWEEN ? AND ?";			
			
			// ?에 값 채움
			ps=conn.prepareStatement(sql);
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
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	// 상품 리스트 총 페이지
	public int goodsListTotalPage() {
		int total=0;
		try {
			conn=dbconn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM goods";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return total;
	}	
	
	
	// 상품 검색 리스트
	public List<GoodsVO> goodsFindList(String keyword, int page, String sort) {
		List<GoodsVO> list=new ArrayList<>();
		String sort_way="ASC";
		if(sort.equals("price")) {
			sort_way="DESC";
		}
			
		try {
			conn=dbconn.getConnection();
			
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			
			String sql="SELECT gno, gname, poster, price, num "
					  +"FROM (SELECT gno, gname, poster, price, rownum as num "
					  +"FROM (SELECT gno, gname, poster, price "
					  +"FROM goods WHERE gname LIKE '%'||?||'%' "
					  +"ORDER BY "+sort+" "+sort_way+")) "
					  +"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, keyword);
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
			}
			rs.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	   
	// 상품 검색 리스트 총 페이지
	public int goodsFindTotalPage(String keyword) {
		int total=0;
		try {
			conn=dbconn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) "
					  +"FROM goods "
					  +"WHERE gname LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, keyword);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return total;
	}
	
	
	// 상품 상세보기
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
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
	
	
	// 추천 상품
	public List<GoodsVO> goodsRandomList(){
		List<GoodsVO> list=new ArrayList<>();
		try {
			// 연결 
			conn=dbconn.getConnection();
			// SQL 
			String sql="SELECT gno, gname, poster, price "
					  +"FROM goods "
	                  +"ORDER BY DBMS_RANDOM.VALUE";
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
	
	
	
	// 존재하는 상품 확인
	/*
	 * public int cartGoodsCount(CartVO vo) { int count=0; try {
	 * conn=dbconn.getConnection();
	 * 
	 * String sql="SELECT COUNT(*) " +"FROM cart "
	 * +"WHERE gno=? AND issale!=1 AND id=?"; ps=conn.prepareStatement(sql);
	 * ps.setInt(1, vo.getGno()); ps.setString(2, vo.getId());
	 * 
	 * ResultSet rs=ps.executeQuery(); if(rs.next()) { count=rs.getInt(1); }
	 * rs.close(); } catch(Exception ex) { ex.printStackTrace(); } finally {
	 * dbconn.disConnection(conn, ps); } return count; }
	 */
	
	
	public void cartGoodsUpdate(CartVO vo) {
	    try {
	        conn=dbconn.getConnection();
	        String sql="UPDATE cart SET amount=amount+? "
	                  +"WHERE gno=? AND id=?";
	        ps=conn.prepareStatement(sql);
	        ps.setInt(1, vo.getAmount());
	        ps.setInt(2, vo.getGno());
	        ps.setString(3, vo.getId());

	        ps.executeUpdate();
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        dbconn.disConnection(conn, ps);
	    }
	}
	

	public String cartGoodsInsert(CartVO vo) {
	    String result="";
	    try {
	        conn=dbconn.getConnection();
	        String sql="SELECT COUNT(*) " +
	                     "FROM cart " +
	                     "WHERE gno=? AND id=? AND issale!=1";
	        ps=conn.prepareStatement(sql);
	        ps.setInt(1, vo.getGno());
	        ps.setString(2, vo.getId());

	        ResultSet rs=ps.executeQuery();
	        if (rs.next()) {
	            int count=rs.getInt(1);

	            // 구매가 안된 상품이 있는지 확인 
	            if (count!=0) {
	                // 존재한다면 => 수량만 증가 
	                sql="UPDATE cart SET " +
	                      "amount=amount+? " +
	                      "WHERE gno=? AND id=?";
	                ps=conn.prepareStatement(sql);
	                ps.setInt(1, vo.getAmount());
	                ps.setInt(2, vo.getGno());
	                ps.setString(3, vo.getId());
	                ps.executeUpdate();
	                result="yes";
	            } else {
	                // 없다면 => 추가 
	                sql="INSERT INTO cart VALUES(" +
	                      "(SELECT NVL(MAX(cart_no) + 1, 1) FROM cart), ?, ?, ?, ?, 0, 0, SYSDATE)";
	                ps=conn.prepareStatement(sql);
	                ps.setInt(1, vo.getGno());
	                ps.setInt(2, vo.getAmount());
	                ps.setInt(3, vo.getPrice());
	                ps.setString(4, vo.getId());
	                ps.executeUpdate();
	                result="yes";
	            }
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        dbconn.disConnection(conn, ps);
	    }
	    return result;
	}

	
	
	// mypageList(cart)
	public List<CartVO> myCartGoodsData(String id) {
		List<CartVO> list=new ArrayList<>();
		
		try {
	        conn=dbconn.getConnection();
	        String sql="SELECT cart_no, gno, amount, regdate, issale, ischeck, price, "
	        		  +"(SELECT poster FROM goods WHERE gno=cart.gno) as poster, "
	                  +"(SELECT gname FROM goods WHERE gno=cart.gno) as gname, "
	                  +"(SELECT price FROM goods WHERE gno=cart.gno) as price "
	                  +"FROM cart "
	                  +"WHERE id=? AND issale!=1 "
	                  +"ORDER BY cart_no DESC";
	        ps=conn.prepareStatement(sql);
	        ps.setString(1, id);

	        ResultSet rs=ps.executeQuery();
	        while (rs.next()) {
                CartVO vo=new CartVO();
                vo.setCart_no(rs.getInt(1));
                vo.setGno(rs.getInt(2));
                vo.setAmount(rs.getInt(3));
                vo.setRegdate(rs.getDate(4));
                vo.setIssale(rs.getInt(5));
                vo.setIscheck(rs.getInt(6));
                vo.setPrice(rs.getInt(7));
                
                GoodsVO gvo=new GoodsVO();
                gvo.setPoster(rs.getString(8));
                gvo.setGname(rs.getString(9));
                gvo.setPrice(rs.getString(10));
                vo.setGvo(gvo);
                
                list.add(vo);
            }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        dbconn.disConnection(conn, ps);
	    }
		
		return list;
	}

	
	public List<CartVO> myCartGoodsBuyData(String id) {
		List<CartVO> list=new ArrayList<>();
		
		try {
	        conn=dbconn.getConnection();
	        String sql="SELECT cart_no, gno, amount, regdate, issale, ischeck, price, "
	        		  +"(SELECT poster FROM goods WHERE gno=cart.gno) as poster, "
	                  +"(SELECT gname FROM goods WHERE gno=cart.gno) as gname, "
	                  +"(SELECT price FROM goods WHERE gno=cart.gno) as price "
	                  +"FROM cart "
	                  +"WHERE id=? AND issale!=1 "
	                  +"ORDER BY cart_no DESC";
	        ps=conn.prepareStatement(sql);
	        ps.setString(1, id);
	        ResultSet rs=ps.executeQuery();
	        while(rs.next()) {
	        	CartVO vo=new CartVO();
	            vo.setCart_no(rs.getInt(1));
	            vo.setGno(rs.getInt(2));
	            vo.setAmount(rs.getInt(3));
	            vo.setRegdate(rs.getDate(4));
	            vo.setIssale(rs.getInt(5));
	            vo.setIscheck(rs.getInt(6));
	            vo.setPrice(rs.getInt(7));
	            
	            GoodsVO gvo=new GoodsVO();
                gvo.setPoster(rs.getString(8));
                gvo.setGname(rs.getString(9));
                gvo.setPrice(rs.getString(10));
                vo.setGvo(gvo);
                
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

	
	public void cartGoodsBuyInsert(CartVO vo) {
		try {
			conn=dbconn.getConnection();
	        String sql="INSERT INTO cart VALUES( "
	        		  +"(SELECT NVL(MAX(cart_no)+1,1) FROM cart), "
	        		  +"?, ?, ?, ?, 0, 1, SYSDATE)";
	        ps=conn.prepareStatement(sql);
	        ps.setInt(1, vo.getGno());
	        ps.setInt(2, vo.getAmount());
	        ps.setInt(3, vo.getPrice());
	        ps.setString(4, vo.getId());
			ps.executeQuery();
		} catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        dbconn.disConnection(conn, ps);
	    }
	}
	
	
	public void cartGoodsDelete(int cart_no) {
		try {
			conn=dbconn.getConnection();
	        String sql="DELETE FROM cart "
	        		  +"WHERE cart_no=?";
	        ps=conn.prepareStatement(sql);
	        ps.setInt(1, cart_no);
	        ps.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
	        dbconn.disConnection(conn, ps);
	    }
	}
	
	
	public void cartGoodsBuyUpdate(int cart_no) {
		try {
			conn=dbconn.getConnection();
	        String sql="UPDATE cart SET "
	        		  +"issale=1 "
	        		  +"WHERE cart_no=?";
	        ps=conn.prepareStatement(sql);
	        ps.setInt(1, cart_no);
	        ps.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
	        dbconn.disConnection(conn, ps);
	    }
	}
}
