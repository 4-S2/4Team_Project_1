package com.sist.vo;
import com.sist.vo.*;
public class HeartVO {
	private int hno,no,cateno;
	
	private MemberVO mvo = new MemberVO();
	private ExVO evo=new ExVO();
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
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
	public ExVO getEvo() {
		return evo;
	}
	public void setEvo(ExVO evo) {
		this.evo = evo;
	}
	
	
}
