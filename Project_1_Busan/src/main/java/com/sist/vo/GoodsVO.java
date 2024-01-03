package com.sist.vo;
// 데이터베이스의 데이터를 모아서 한번에 전송할 목적
/*
 GNO                                       NOT NULL NUMBER
 GNAME                                     NOT NULL VARCHAR2(1000)
 POSTER                                    NOT NULL VARCHAR2(1000)
 ORIGIN                                             VARCHAR2(300)
 MANUFACTURER                                       VARCHAR2(300)
 PRICE                                     NOT NULL VARCHAR2(100)
 DIMAGE                                             VARCHAR2(2000)

 */
public class GoodsVO {
    private int gno;
    private String gname,poster,origin,manufacturer,price,dimage;
   public int getGno() {
      return gno;
   }
   public void setGno(int gno) {
      this.gno = gno;
   }
   public String getGname() {
      return gname;
   }
   public void setGname(String gname) {
      this.gname = gname;
   }
   public String getPoster() {
      return poster;
   }
   public void setPoster(String poster) {
      this.poster = poster;
   }
   public String getOrigin() {
      return origin;
   }
   public void setOrigin(String origin) {
      this.origin = origin;
   }
   public String getManufacturer() {
      return manufacturer;
   }
   public void setManufacturer(String manufacturer) {
      this.manufacturer = manufacturer;
   }
   public String getPrice() {
      return price;
   }
   public void setPrice(String price) {
      this.price = price;
   }
   public String getDimage() {
      return dimage;
   }
   public void setDimage(String dimage) {
      this.dimage = dimage;
   }
   
}