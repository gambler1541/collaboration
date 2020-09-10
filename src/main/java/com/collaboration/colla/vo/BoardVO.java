package com.collaboration.colla.vo;

//보드를 생성하는 VO
public class BoardVO {
	private int bFk;
	private String bLeader;
	private String bTitle;
	private String bContent;
	
	public int getbFk() {
		return bFk;
	}
	
	public void setbFk(int bFk) {
		this.bFk = bFk;
	}
	
	public String getbLeader() {
		return bLeader;
	}
	
	public void setbLeader(String bLeader) {
		this.bLeader = bLeader;
	}
	
	public String getbTitle() {
		return bTitle;
	}
	
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	
	public String getbContent() {
		return bContent;
	}
	
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	
}
