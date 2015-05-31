package ${table.basePackage}.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.shangjia.framework.dao.support.Order;
import cn.shangjia.framework.dao.support.SqlParameter;
import ${table.basePackage}.entity.${table.shortTableName?cap_first};
import ${table.basePackage}.repository.${table.shortTableName?cap_first}Dao;
import cn.wkey.api.common.entity.support.YesOrNoEnum;
import cn.wkey.framework.utils.Pager;
import cn.wkey.framework.utils.PagerVO;
import cn.wkey.api.common.utils.CommonUtils;
import cn.wkey.api.common.utils.DataContent;

/**
 * ${table.shortTableName?cap_first}Service
 * 
 * @author ${table.author}
 * @date ${.now}
 */
@Service
public class ${table.shortTableName?cap_first}Service {

	@Resource
	private ${table.shortTableName?cap_first}Dao ${table.shortTableName}Dao;

	/**
	 * 查询Model
	 * 
	 * @author 填写
	 * @param id
	 * @return
	 */
	public ${table.shortTableName?cap_first} read(Map<String, Object> whereMap) {
		SqlParameter sqlParameter = DataContent.dealWhere(whereMap);
		${table.shortTableName?cap_first} ${table.shortTableName} = ${table.shortTableName}Dao.read(sqlParameter);
		return ${table.shortTableName};
	}

	/**
	 * 查询Model
	 * 
	 * @author 填写
	 * @param id
	 * @return
	 */
	public ${table.shortTableName?cap_first} readOne(Map<String, Object> whereMap) {
		SqlParameter sqlParameter = DataContent.dealWhere(whereMap);
		${table.shortTableName?cap_first} ${table.shortTableName} = ${table.shortTableName}Dao.readOne(sqlParameter);
		return ${table.shortTableName};
	}

	/**
	 * 分页查询
	 * 
	 * @author 填写
	 * @param whereMap
	 * @param sortColumnMap
	 * @param selectPage
	 * @param pageSize
	 * @return
	 */
	public Object page(Map<String, Object> whereMap, Map<String, Object> sortColumnMap, Integer selectPage, Integer pageSize) {
		SqlParameter parameter = DataContent.dealWhere(whereMap);

		if (null != sortColumnMap && null != sortColumnMap.entrySet() && sortColumnMap.entrySet().size() > 0) {
			for (Entry<String, Object> entry : sortColumnMap.entrySet()) {
				parameter.addOrder(CommonUtils.fieldToColumn(entry.getKey()), Order.forCode(entry.getValue().toString()));
			}
		}

		long count = totalCount(parameter);
		Pager pager = new Pager(count, selectPage, pageSize);
		if (selectPage > pager.getTotalPages()) {
			selectPage = pager.getTotalPages();
			pager = new Pager(count, selectPage, pageSize);
		}
		parameter.addRowStart(pager.getStartRows());
		parameter.addRowEnd(pager.getEndRows());
		Collection<${table.shortTableName?cap_first}> result = ${table.shortTableName}Dao.page(parameter);
		pager.setResult(result);
		
		PagerVO pagerVO = new PagerVO();
		pagerVO.setDataList(result);
		pagerVO.setPageIndex(pager.getPage());
		pagerVO.setTotalRows(pager.getTotalCount());
		pagerVO.setTotalPages(pager.getTotalPages());
		return pagerVO;
	}

	/**
	 * 辅助分页
	 * 
	 * @author 填写
	 * @param parameter
	 * @return
	 */
	private long totalCount(SqlParameter parameter) {
		return ${table.shortTableName}Dao.count(parameter);
	}

	/**
	 * 新建
	 * 
	 * @author 填写
	 * @param ${table.shortTableName}
	 * @return
	 */
	@Transactional
	public int add(${table.shortTableName?cap_first} ${table.shortTableName}) {
		return ${table.shortTableName}Dao.create(${table.shortTableName});
	}

	/**
	 * 删除
	 * 
	 * @author 填写
	 * @param whereMap
	 * @return
	 */
	@Transactional
	public int delete(Map<String, Object> whereMap) {
		SqlParameter parameter = DataContent.dealWhere(whereMap);
		parameter.addUpdate("state", YesOrNoEnum.Yes);
		return ${table.shortTableName}Dao.update(parameter);
	}

	/**
	 * 更新
	 * 
	 * @author 填写
	 * @param whereMap
	 * @param updateMap
	 * @return
	 */
	@Transactional
	public int update(Map<String, Object> whereMap, Map<String, Object> updateMap) {
		SqlParameter parameter = DataContent.dealWhereAndUpdata(whereMap, updateMap);
		return ${table.shortTableName}Dao.update(parameter);
	}

}
