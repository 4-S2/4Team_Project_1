package com.sist.vo;

/*
 RNO                                       NOT NULL NUMBER
 ID                                        NOT NULL VARCHAR2(100)
 SCORE                                     NOT NULL NUMBER
 CONT                                      NOT NULL CLOB
 PASSWORD                                  NOT NULL VARCHAR2(100)
 REGDATE                                   NOT NULL DATE
 IMG                                                VARCHAR2(3000)
 CATENO                                    NOT NULL NUMBER
 */
import java.util.*;

public class ReviewVO {
	private int rno, score, cateno;
	private String id, cont, password, img;
	private Date regdate;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getCateno() {
		return cateno;
	}
	public void setCateno(int cateno) {
		this.cateno = cateno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
