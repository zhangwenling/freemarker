package com.knet.gen.entity;

import java.util.ArrayList;
import java.util.List;

public class ColumnEntity {
	
	private String columnName;
	
	private String shortColumnName;
	
	private String columnType;
	
	private String javaType;

	private String jdbcType;

	private String columnPrecision;

	private String columnScale;
	
	private String columnComments;
	
	private Boolean isNullable;
	
	private Boolean isEnum;
	
	private String enumClassName;

	private String packageStr;

	private List<EnumEntity> enumList = new ArrayList<EnumEntity>();

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getShortColumnName() {
		return shortColumnName;
	}

	public void setShortColumnName(String shortColumnName) {
		this.shortColumnName = shortColumnName;
	}

	public String getColumnType() {
		return columnType;
	}

	public void setColumnType(String columnType) {
		this.columnType = columnType;
	}

	public String getJavaType() {
		return javaType;
	}

	public void setJavaType(String javaType) {
		this.javaType = javaType;
	}

	public String getColumnScale() {
		return columnScale;
	}

	public void setColumnScale(String columnScale) {
		this.columnScale = columnScale;
	}

	public String getColumnComments() {
		return columnComments;
	}

	public void setColumnComments(String columnComments) {
		this.columnComments = columnComments;
	}

	public Boolean getIsNullable() {
		return isNullable;
	}

	public void setIsNullable(Boolean isNullable) {
		this.isNullable = isNullable;
	}

	public Boolean getIsEnum() {
		return isEnum;
	}

	public void setIsEnum(Boolean isEnum) {
		this.isEnum = isEnum;
	}

	public List<EnumEntity> getEnumList() {
		return enumList;
	}

	public void setEnumList(List<EnumEntity> enumList) {
		this.enumList = enumList;
	}

	public String getColumnPrecision() {
		return columnPrecision;
	}

	public void setColumnPrecision(String columnPrecision) {
		this.columnPrecision = columnPrecision;
	}

	public String getJdbcType() {
		return jdbcType;
	}

	public void setJdbcType(String jdbcType) {
		this.jdbcType = jdbcType;
	}

	public String getEnumClassName() {
		return enumClassName;
	}

	public void setEnumClassName(String enumClassName) {
		this.enumClassName = enumClassName;
	}

	public String getPackageStr() {
		return packageStr;
	}

	public void setPackageStr(String packageStr) {
		this.packageStr = packageStr;
	} 

	

}
