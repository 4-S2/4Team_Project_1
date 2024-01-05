package com.sist.vo;

public class LikeVO {
	private int hno,cateno,eno;
	
	MemberVO dvo=new MemberVO();

	public int getHno() {
		return hno;
	}

	public void setHno(int hno) {
		this.hno = hno;
	}

	public int getCateno() {
		return cateno;
	}

	public void setCateno(int cateno) {
		this.cateno = cateno;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int no) {
		this.eno = no;
	}

	public MemberVO getDvo() {
		return dvo;
	}

	public void setDvo(MemberVO dvo) {
		this.dvo = dvo;
	}
	
	
}
