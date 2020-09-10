package com.collaboration.colla.vo;

public class CardSortableVO {

	private int startcFk;
	private int startParent;
	private int startIndex;
	private int stopParent;
	private int stopIndex;
	private int beforecFk;
	private int nextcFk;

	public int getStartcFk() {
		return startcFk;
	}

	public void setStartcFk(int startcFk) {
		this.startcFk = startcFk;
	}

	public int getStartParent() {
		return startParent;
	}

	public void setStartParent(int startParent) {
		this.startParent = startParent;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getStopParent() {
		return stopParent;
	}

	public void setStopParent(int stopParent) {
		this.stopParent = stopParent;
	}

	public int getStopIndex() {
		return stopIndex;
	}

	public void setStopIndex(int stopIndex) {
		this.stopIndex = stopIndex;
	}

	public int getBeforecFk() {
		return beforecFk;
	}

	public void setBeforecFk(int beforecFk) {
		this.beforecFk = beforecFk;
	}

	public int getNextcFk() {
		return nextcFk;
	}

	public void setNextcFk(int nextcFk) {
		this.nextcFk = nextcFk;
	}

}