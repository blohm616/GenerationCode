package com.xiezhyan.generation.entity;

import java.io.Serializable;
import java.util.List;

public class Tables implements Serializable {

	/**
	 *	version: 表名
	 *----------------------
	 * 	author:xiezhyan
	 *	date:2017-6-4
	 */
	private static final long serialVersionUID = 6204772647475628441L;

	private String name;
	private String comment;
	
	private String javaName;
	
	private List<Fields> fields;
	
	public String getJavaName() {
		return javaName;
	}
	public void setJavaName(String javaName) {
		this.javaName = javaName;
	}
	public List<Fields> getFields() {
		return fields;
	}
	public void setFields(List<Fields> fields) {
		this.fields = fields;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
}
