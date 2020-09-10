package com.collaboration.colla.vo;

public class ReplyVO {
   private int bFk;
   private int lFk;
   private int cFk;
   private int rIndex;
   private String rWriter;
   private String rContent;
   
   public int getbFk() {
      return bFk;
   }
   public void setbFk(int bFk) {
      this.bFk = bFk;
   }
   public int getlFk() {
      return lFk;
   }
   public void setlFk(int lFk) {
      this.lFk = lFk;
   }
   public int getcFk() {
      return cFk;
   }
   public void setcFk(int cFk) {
      this.cFk = cFk;
   }
   public int getrIndex() {
      return rIndex;
   }
   public void setrIndex(int rIndex) {
      this.rIndex = rIndex;
   }
   public String getrWriter() {
      return rWriter;
   }
   public void setrWriter(String rWriter) {
      this.rWriter = rWriter;
   }
   public String getrContent() {
      return rContent;
   }
   public void setrContent(String rContent) {
      this.rContent = rContent;
   }
   
}