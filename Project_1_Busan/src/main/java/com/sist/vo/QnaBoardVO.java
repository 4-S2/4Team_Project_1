package com.sist.vo;

import java.util.Date;

/*
 QNO                                       NOT NULL NUMBER
 NAME                                      NOT NULL VARCHAR2(51)
 SUBJECT                                   NOT NULL VARCHAR2(500)
 CONT                                      NOT NULL CLOB
 PWD                                       NOT NULL VARCHAR2(10)
 REGDATE                                   NOT NULL DATE
 HIT                                       NOT NULL NUMBER
 GROUP_ID                                           NUMBER
 GROUP_STEP                                         NUMBER
 */
public class QnaBoardVO {
	   private int qno;
	   private String name;
	   private String subject;
	   private String cont;
	   private String pwd;
	   private Date regdate;
	   private String dbday;
	   private int hit;
	   private int group_id;
	   private int group_step;
	   
	   
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getGroup_step() {
		return group_step;
	}
	public void setGroup_step(int group_step) {
		this.group_step = group_step;
	}
	   
}
