package com.knet.core;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 获取系统常亮
 * 
 * @author Administrator
 * 
 */
public class Applications {

	/**
	 * 常量日志
	 */
	private static final Logger logger = LoggerFactory.getLogger(Applications.class);
	private static PropertiesLoader prop;

	static {
		try {
			prop = new PropertiesLoader("config.properties", "jdbc.properties");
		} catch (Exception e) {
			logger.error("常量文件加载失败!");
		}
	}


	/**
	 * 获得配置常量
	 * 
	 * @param key
	 *            键值
	 * @return
	 */
	public static String get(String key) {
		return prop.getProperty(key);
	}

	/**
	 * 获得配置常量
	 * 
	 * @param key
	 *            键值
	 * @param defaultValue
	 *            默认值
	 * @return
	 */
	public static String get(String key, String defaultValue) {
		return prop.getProperty(key, defaultValue);
	}

	/**
	 * 获得配置常量
	 * 
	 * @param key
	 *            键值
	 * @return
	 */
	public static Integer getInteger(String key) {
		return prop.getInteger(key);
	}

	/**
	 * 获得配置常量
	 * 
	 * @param key
	 *            键值
	 * @param defaultValue
	 *            默认值
	 * @return
	 */
	public static Integer getInteger(String key, Integer defaultValue) {
		return prop.getInteger(key, defaultValue);
	}

	/**
	 * 获得配置常量
	 * 
	 * @param key
	 *            键值
	 * @return
	 */
	public static boolean getBoolean(String key) {
		return prop.getBoolean(key);
	}

	/**
	 * 获得配置常量
	 * 
	 * @param key
	 *            键值
	 * @param defaultValue
	 *            默认值
	 * @return
	 */
	public static boolean getBoolean(String key, boolean defaultValue) {
		return prop.getBoolean(key, defaultValue);
	}
}
