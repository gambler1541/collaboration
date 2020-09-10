package com.collaboration.colla.vo;


//카드를 생성하는 VO
public class CardVO {
	private int bFk;
	private int lFk;
	private int cFk;
	private String cTitle;
	private String cDescription;
	private String cCreate;
	private String cDeadline;
	private boolean cDone;
	private int pos;

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

	public String getcTitle() {
		return cTitle;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}

	public String getcDescription() {
		return cDescription;
	}

	public void setcDescription(String cDescription) {
		this.cDescription = cDescription;
	}

	public String getcCreate() {
		return cCreate;
	}

	public void setcCreate(String cCreate) {
		this.cCreate = cCreate;
	}

	public String getcDeadline() {
		return cDeadline;
	}

	public void setcDeadline(String cDeadline) {
		this.cDeadline = cDeadline;
	}

	public boolean iscDone() {
		return cDone;
	}

	public void setcDone(String cDone) {
		this.cDone = Boolean.parseBoolean(cDone);
	}

	public int getPos() {
		return pos;
	}

	public void setPos(int pos) {
		this.pos = pos;
	}

}