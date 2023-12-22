package com.sist.vo;

import java.util.Date;

/*
 NNO                                       NOT NULL NUMBER
 NTITLE                                    NOT NULL VARCHAR2(100)
 NDATE                                     NOT NULL DATE
 NCONT                                     NOT NULL CLOB
 */
public class NoticeVO {
	   private int nno;
	   private String ntitle;
	   private Date ndate;
	   private String ncont;
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public Date getNdate() {
		return ndate;
	}
	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}
	public String getNcont() {
		return ncont;
	}
	public void setNcont(String ncont) {
		this.ncont = ncont;
	}
	   
	   
}
