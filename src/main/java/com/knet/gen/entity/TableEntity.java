package com.knet.gen.entity;

import java.util.ArrayList;
import java.util.List;

public class TableEntity {
	

	private String tableName;
	
	private String shortTableName;
	
	private String tableComments;
	
	private String sequence;
	
	private String basePackage;

	private String subPackage;
	
	private String author;
	
	private List<String> importEntity = new ArrayList<String>();

	private List<ColumnEntity> columnList = new ArrayList<ColumnEntity>();

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getShortTableName() {
		return shortTableName;
	}

	public void setShortTableName(String shortTableName) {
		this.shortTableName = shortTableName;
	}

	public List<ColumnEntity> getColumnList() {
		return columnList;
	}

	public void setColumnList(List<ColumnEntity> columnList) {
		this.columnList = columnList;
	}

	public String getTableComments() {
		return tableComments;
	}

	public void setTableComments(String tableComments) {
		this.tableComments = tableComments;
	}

	public List<String> getImportEntity() {
		return importEntity;
	}

	public void setImportEntity(List<String> importEntity) {
		this.importEntity = importEntity;
	}

	public String getSequence() {
		return sequence;
	}

	public void setSequence(String sequence) {
		this.sequence = sequence;
	}

	public String getBasePackage() {
		return basePackage;
	}

	public void setBasePackage(String basePackage) {
		this.basePackage = basePackage;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getSubPackage() {
		return subPackage;
	}

	public void setSubPackage(String subPackage) {
		this.subPackage = subPackage;
	} 
	
	
	
}
