package com.sist.vo;

public class FoodReserveVO {
	private int rno,fno,inwon,ok;
	private String day,time,id;
	private BusanListVO fvo=new BusanListVO();
	private MemberVO mvo = new MemberVO();
	
	
	public MemberVO getMvo() {
		return mvo;
	}
	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}
	public BusanListVO getFvo() {
		return fvo;
	}
	public void setFvo(BusanListVO fvo) {
		this.fvo = fvo;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getInwon() {
		return inwon;
	}
	public void setInwon(int inwon) {
		this.inwon = inwon;
	}
	public int getOk() {
		return ok;
	}
	public void setOk(int ok) {
		this.ok = ok;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return fno+" "+day+" "+time+" "+inwon+" "+id;
	}
	
	
}
