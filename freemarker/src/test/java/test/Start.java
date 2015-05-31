package test;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.io.FileUtils;

import com.knet.core.Applications;
import com.knet.core.MapBean;
import com.knet.gen.action.GenAction;
import com.knet.gen.dao.GenDao;

public class Start {

	public static final String SOURCE_JAVA_PATH = "\\cn\\wkey\\api\\waimai";
	public static final String DESTINATION_MAPPER_PATH = "D:\\workspaces\\wlk-wawp_waimai\\src\\main\\resources\\configure\\mybatis\\api";
	public static final String DESTINATION_JAVA_PATH = "D:\\workspaces\\wlk-wawp_waimai\\src\\main\\java\\cn\\wkey\\api\\waimai";

	// public static final String SOURCE_JAVA_PATH = "\\cn\\wkey\\api";
	// public static final String DESTINATION_MAPPER_PATH = "D:\\workspaces\\wlk-cus\\src\\main\\resources\\configure\\mybatis\\api";
	// public static final String DESTINATION_JAVA_PATH = "D:\\workspaces\\wlk-cus\\src\\main\\java\\cn\\wkey\\api";

	public static void main(String[] args) throws IOException {
		String rootPath = Applications.get("root.path");
		FileUtils.deleteDirectory(new File(rootPath));
		List<String> tableNames = new ArrayList<String>();

		// 获取表明
		/*
		 * GenDao TableDao = new GenDao(); String likeTableName = "WAIMAI"; List<Object> tableNameByTableName =
		 * TableDao.getTableNameByTableName(likeTableName); for(Object obj:tableNameByTableName){ Map<String, Object> map = (Map)obj;
		 * tableNames.add((String)map.get("TABLE_NAME")); }
		 */

		String author = "zhangwenling";
		// tableNames.add("WLK_WAWP_WAIMAI_ORDER");
		// tableNames.add("WLK_WAWP_WAIMAI_TABLE_CLASS");
		// tableNames.add("WLK_WAWP_WAIMAI_TABLE_DETAIL");
		tableNames.add("WLK_WAWP_WAIMAI_ORDER_DINING");
//		tableNames.add("WLK_WAWP_WAIMAI_NUMBER");
		for (String tableName : tableNames) {
			System.out.println("开始生成：" + tableName);
			GenAction genAction = new GenAction();
			genAction.gen(tableName, author);
		}

		System.err.println("生成成功");

		// 拷贝文件
//		 copy(rootPath);

	}

	/**
	 * 复制到项目目录下
	 * 
	 * @param rootPath
	 * @throws IOException
	 */
	public static void copy(String rootPath) throws IOException {
		System.err.println("正在复制到制定目录……");
		MapBean mb = new MapBean();
		// 拷贝mapper文件
		mb.put(rootPath + "\\biz", DESTINATION_MAPPER_PATH);
		// 拷贝java文件
		mb.put(rootPath + SOURCE_JAVA_PATH, DESTINATION_JAVA_PATH);

		for (Entry<String, Object> entry : mb.entrySet()) {
			String key = entry.getKey();
			String value = (String) entry.getValue();
			System.err.println("复制：" + key + "===>>" + value);
			File srcDir = new File(key);
			File destDir = new File(value);
			FileUtils.copyDirectory(srcDir, destDir);
		}
		System.err.println("复制成功");
	}
}
