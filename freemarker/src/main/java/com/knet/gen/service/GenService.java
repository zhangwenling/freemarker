package com.knet.gen.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.knet.core.Applications;
import com.knet.gen.dao.GenDao;
import com.knet.gen.entity.ColumnEntity;
import com.knet.gen.entity.TableEntity;
import com.knet.utils.EntityUtils;
import com.knet.utils.JavaTypeUtils;
import com.knet.utils.Obj2StrUtils;

/**
 * 
 * @author zhangwenling
 * @date 201
 *
 */
public class GenService {

	private GenDao TableDao = new GenDao();
	
	public static final String basePackage=Applications.get("base.package") +"." + Applications.get("base.subpackage");

	public void getTableComments(TableEntity tableEntity, String tableName) {
		List<Object> tableComments = TableDao.getTableComments(tableName);
		tableEntity.setTableName(tableName);
		tableEntity.setShortTableName(EntityUtils.column2JavaProperty(tableName));
		tableEntity.setSequence(Applications.get("base.sequence"));
		tableEntity.setBasePackage(basePackage);
		
		for (Object obj : tableComments) {
			Map<String, String> m = (Map<String, String>) obj;
			tableEntity.setTableComments(m.get("COMMENTS").toString());
		}
	}

	public void getTableColumnsMeta(TableEntity tableEntity, String tableName) {
		List<Object> tableColumnsMeta = TableDao.getTableColumnsMeta(tableName);
		
		List<ColumnEntity> columnList = new ArrayList<ColumnEntity>();

		for (Object obj : tableColumnsMeta) {
			// [{DATA_PRECISION=12, COLUMN_NAME=ID, DATA_LENGTH=22, COMMENTS=主键, DATA_SCALE=0, NULLABLE=N, DATA_TYPE=NUMBER}
			Map<String, String> m = (Map<String, String>) obj;
			ColumnEntity columnEntity = new ColumnEntity();
			columnEntity.setColumnName(Obj2StrUtils.objToString(m.get("COLUMN_NAME")));
			columnEntity.setShortColumnName(EntityUtils.column2JavaProperty(Obj2StrUtils.objToString(m.get("COLUMN_NAME"))));

			String comments = Obj2StrUtils.objToString(m.get("COMMENTS"));
			columnEntity.setColumnComments(comments);

			Boolean isEnum = comments.contains("@") ? true : false;
			columnEntity.setIsEnum(isEnum);
			if(isEnum){
				columnEntity.setEnumList(EntityUtils.comments2Enum(tableEntity, columnEntity, columnEntity.getColumnComments()));
			}
			
			columnEntity.setColumnScale(Obj2StrUtils.objToString(m.get("DATA_SCALE")));
			columnEntity.setColumnPrecision(Obj2StrUtils.objToString(m.get("DATA_PRECISION")));
			columnEntity.setColumnType(Obj2StrUtils.objToString(m.get("DATA_TYPE")));

			Boolean isNullable = "N".equals(Obj2StrUtils.objToString(m.get("isNullable"))) ? false : true;
			columnEntity.setIsNullable(isNullable);

			columnEntity.setJavaType(JavaTypeUtils.getJavaType(tableEntity, columnEntity, columnEntity.getColumnType()));
			columnList.add(columnEntity);
		}
		tableEntity.setColumnList(columnList );
	}

	public static void main(String[] args) {
		GenService TableService = new GenService();
		TableEntity tableEntity = new TableEntity();
		String tableName = "WLK_QYH_SIGN_RECORD";
		TableService.getTableComments(tableEntity, tableName);
		TableService.getTableColumnsMeta(tableEntity, tableName);
		System.out.println(tableEntity);
	}

}
