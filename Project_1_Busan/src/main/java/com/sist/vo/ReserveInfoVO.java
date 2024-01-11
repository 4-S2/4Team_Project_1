package com.sist.vo;

public class ReserveInfoVO {
	private int no;
	private int eno;
	private int rok;
	private String ename;
	private String eename;
	private String poster;
	private String day;
	private String regdate;
	private String inwon;
	private String rday;
	private String time;
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getRday() {
		return rday;
	}
	public void setRday(String rday) {
		this.rday = rday;
	}
	private MemberVO mvo = new MemberVO();
	private ExVO evo = new ExVO();
	public String getInwon() {
		return inwon;
	}
	public void setInwon(String inwon) {
		this.inwon = inwon;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public int getRok() {
		return rok;
	}
	public void setRok(int rok) {
		this.rok = rok;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getEename() {
		return eename;
	}
	public void setEename(String eename) {
		this.eename = eename;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
