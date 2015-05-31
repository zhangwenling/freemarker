package com.knet.gen.dao;

import java.util.List;

import com.knet.core.ConnectionDB;
import com.knet.core.MapBean;

/**
 * @author zhangwenling  
 */
public class GenDao {

	ConnectionDB ConnectionDB = new ConnectionDB();

	public List<Object> getTableComments(String tableName) {
		String sql = " select * from user_tab_comments t where t.TABLE_NAME=?";
		List<Object> excuteQuery = ConnectionDB.excuteQuery(sql,  new Object[]{tableName.toUpperCase()});
		return excuteQuery;
	}
	public List<Object> getTableColumnsMeta(String tableName) {
		String sql = " SELECT COLS.COLUMN_NAME, COLS.DATA_TYPE, COMMENTS.COMMENTS, COLS.DATA_LENGTH, COLS.DATA_PRECISION, COLS.DATA_SCALE,COLS.NULLABLE " + " FROM USER_TAB_COLUMNS COLS " + " LEFT JOIN USER_COL_COMMENTS COMMENTS "
				+ " ON COLS.COLUMN_NAME = COMMENTS.COLUMN_NAME" + " WHERE COLS.TABLE_NAME = :tableName" + " AND COMMENTS.TABLE_NAME = :tableName" + " ORDER BY COLS.COLUMN_ID ";
		List<Object> excuteQuery = ConnectionDB.excuteQuery(sql,  tableName.toUpperCase(), tableName.toUpperCase());
		return excuteQuery;
	}
	
	public List<Object> getTableNameByTableName(String tableName) {
		String sql = "SELECT T.TABLE_NAME FROM USER_TABLES T WHERE T.TABLE_NAME LIKE ?";
		List<Object> excuteQuery = ConnectionDB.excuteQuery(sql,  new Object[]{"%" + tableName.toUpperCase() + "%"});
		return excuteQuery;
	}

/*	public String getTablePKey(String tableName) {
		String sql = "SELECT A.COLUMN_NAME as ID " + " FROM USER_CONS_COLUMNS A, USER_CONSTRAINTS B " + " WHERE A.TABLE_NAME = :tableName " + " AND A.TABLE_NAME = B.TABLE_NAME "
				+ " AND A.CONSTRAINT_NAME = B.CONSTRAINT_NAME " + " AND B.CONSTRAINT_TYPE = 'P'";
		List<MapBean> l = ConnectionDB.excuteQuery(sql, params)(sql, new MapBean("tableName", tableName.toUpperCase()));
		if(l!=null && l.size()>0){
			return l.get(0).keySet().iterator().next();
		}
		return null;
	}*/
	
	public static void main(String[] args) {
		GenDao TableDao = new GenDao();
		String tableName = "WAIMAI";
//		TableDao.getTableColumnsMeta(tableName);
//		TableDao.getTableComments(tableName);
		System.err.println(TableDao.getTableNameByTableName(tableName));
	}

}
