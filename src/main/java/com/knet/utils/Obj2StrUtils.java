package com.knet.utils;

import java.util.Map;

import com.google.common.collect.Maps;

public class Obj2StrUtils {
	
	/**
	 * 简单对象转换string ，null转""
	 * @param obj
	 * @return
	 */
	public static String objToString(Object obj){
		String temp = "";
		if(obj != null) {
			temp = obj.toString();
		}
		return temp;
	}
	
	/**
	 *Map<String, Object> 转换 Map<String, String>
	 * @param obj
	 * @return
	 */
	public static Map<String, String> objToStrMap(Map<String, Object> map){
		Map<String, String> temp = Maps.newHashMap();
		
		for(Map.Entry<String, Object> entry : map.entrySet()){
			temp.put(entry.getKey(), Obj2StrUtils.objToString(entry.getValue()));
		}
		
		return temp;
	}
}
