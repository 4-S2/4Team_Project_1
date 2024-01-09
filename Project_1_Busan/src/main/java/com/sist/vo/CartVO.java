package com.sist.vo;
/*
 * cart_no NUMBER,
   goods_no NUMBER,
   TYPE NUMBER,
   amount NUMBER,
   price NUMBER,
   id VARCHAR2(20),
   ischeck NUMBER DEFAULT 0,
   issale NUMBER DEFAULT 0,
   regdate DATE DEFAULT SYSDATE
 */
import java.util.*;
public class CartVO {
    private int cart_no,gno,type,amount,price,ischeck,issale;
    private String id;
    private Date regdate;
    
    private MemberVO mvo=new MemberVO();
    private GoodsVO gvo=new GoodsVO();
    
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getIscheck() {
		return ischeck;
	}
	public void setIscheck(int ischeck) {
		this.ischeck = ischeck;
	}
	public int getIssale() {
		return issale;
	}
	public void setIssale(int issale) {
		this.issale = issale;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public MemberVO getMvo() {
		return mvo;
	}
	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}
	public GoodsVO getGvo() {
		return gvo;
	}
	public void setGvo(GoodsVO gvo) {
		this.gvo = gvo;
	}
	   
}