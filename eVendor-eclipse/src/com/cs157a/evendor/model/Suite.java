package com.cs157a.evendor.model;

public class Suite {
	private int id;
	private String heading;
	private String paragraph;
	private String imgPath;
	private int index;
	
	public Suite(int id, String heading, String paragraph, String imgPath, int index) {
		this.id = id;
		this.heading = heading;
		this.paragraph = paragraph;
		this.imgPath = imgPath;
		this.index = index;
	}

	public int getId() {
		return id;
	}

	public String getHeading() {
		return heading;
	}

	public String getParagraph() {
		return paragraph;
	}

	public String getImgPath() {
		return imgPath;
	}
	
	public int getIndex() {
		return index;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setHeading(String heading) {
		this.heading = heading;
	}

	public void setParagraph(String paragraph) {
		this.paragraph = paragraph;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
	public void setIndex(int index) {
		this.index = index;
	}
}
