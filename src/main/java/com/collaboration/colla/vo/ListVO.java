package com.collaboration.colla.vo;

public class ListVO {

	private int bFk;
	private int lFk;
	private String lTitle;
	private int pos;
	private int beforelFk;
	private int nextlFk;

	public int getBeforelFk() {
		return beforelFk;
	}

	public void setBeforelFk(int beforelFk) {
		this.beforelFk = beforelFk;
	}

	public int getNextlFk() {
		return nextlFk;
	}

	public void setNextlFk(int nextlFk) {
		this.nextlFk = nextlFk;
	}

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

	public String getlTitle() {
		return lTitle;
	}

	public void setlTitle(String lTitle) {
		this.lTitle = lTitle;
	}

	public int getPos() {
		return pos;
	}

	public void setPos(int pos) {
		this.pos = pos;
	}
}