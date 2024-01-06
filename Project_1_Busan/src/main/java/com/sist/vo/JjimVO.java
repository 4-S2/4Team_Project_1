package com.sist.vo;

public class JjimVO {
	private int jno,no,cateno;
	private MemberVO mvo = new MemberVO();
	private BusanListVO bvo = new BusanListVO();
	private ExVO evo = new ExVO();
	
	public ExVO getEvo() {
		return evo;
	}
	public BusanListVO getBvo() {
		return bvo;
	}
	public int getJno() {
		return jno;
	}
	public void setJno(int jno) {
		this.jno = jno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCateno() {
		return cateno;
	}
	public void setCateno(int cateno) {
		this.cateno = cateno;
	}
	public MemberVO getMvo() {
		return mvo;
	}
	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}
	
	
}
