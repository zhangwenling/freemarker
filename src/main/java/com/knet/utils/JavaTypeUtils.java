package com.knet.utils;

import java.util.List;

import com.knet.core.MapBean;
import com.knet.gen.entity.ColumnEntity;
import com.knet.gen.entity.TableEntity;

public class JavaTypeUtils {
	
	private static MapBean mb = new MapBean();

	static{
		mb.put("VARCHAR2", new MapBean("javaType", "java.lang.String", "jdbcType", "VARCHAR"));
		mb.put("NUMBER", new MapBean("javaType", "java.lang.Long", "jdbcType", "NUMERIC"));
		mb.put("DATE", new MapBean("javaType", "java.util.Date", "jdbcType", "TIMESTAMP"));
		mb.put("CLOB", new MapBean("javaType", "java.lang.String", "jdbcType", "CLOB"));
	}
	
	public static String getJavaType(TableEntity tableEntity, ColumnEntity columnEntity, String column){
		MapBean tempMap = mb.get(column);
		
		columnEntity.setJdbcType(tempMap.getString("jdbcType"));
		
		String temp = tempMap.getString("javaType");
		List<String> importEntity = tableEntity.getImportEntity();
		if(!importEntity.contains(temp)){
			importEntity.add(temp);
		}
		
		String[] split = temp.split("\\.");
		return split[split.length-1];
	}
	
	public static void main(String[] args) {
//		System.out.println(getJavaType("NUMBER"));
	}
}
