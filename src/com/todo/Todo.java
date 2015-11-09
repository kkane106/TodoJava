package com.todo;

import java.io.Serializable;

public class Todo implements Serializable {
	private String title;
	private String description;
	
	public Todo() {
		this("Title", "Description");
	}
	
	public Todo(String title, String description) {
		this.title = title;
		this.description = description;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
