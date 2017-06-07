package com.xiezhyan.generation.entity;

import java.io.Serializable;

public class Fields implements Serializable {

	/**
	 *	version: 字段表
	 *----------------------
	 * 	author:xiezhyan
	 *	date:2017-6-4
	 */
	private static final long serialVersionUID = 6482847865746417225L;

	private String tableName;
	
	private String columnName;
	
	private String javaField;
	
	private String jdbcType;
	
	private String javaType;
	
	private String columnKey;
	
	private String columnComment;
	
	
	public String getJavaField() {
		return javaField;
	}

	public void setJavaField(String javaField) {
		this.javaField = javaField;
	}

	public String getJavaType() {
		return javaType;
	}

	public void setJavaType(String javaType) {
		this.javaType = javaType;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getJdbcType() {
		return jdbcType;
	}

	public void setJdbcType(String jdbcType) {
		this.jdbcType = jdbcType;
	}

	public String getColumnKey() {
		return columnKey;
	}

	public void setColumnKey(String columnKey) {
		this.columnKey = columnKey;
	}

	public String getColumnComment() {
		return columnComment;
	}

	public void setColumnComment(String columnComment) {
		this.columnComment = columnComment;
	}
}
