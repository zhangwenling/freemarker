package ${table.basePackage}.repository;

import java.util.Collection;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import cn.shangjia.framework.dao.ReadDao;
import cn.shangjia.framework.dao.WriteDao;
import cn.shangjia.framework.dao.support.SqlParameter;
import ${table.basePackage}.entity.${table.shortTableName?cap_first};

/**
 * ${table.shortTableName?cap_first}管理
 * 
 * @author ${table.author}
 * @date ${.now}
 */
@Repository
public class ${table.shortTableName?cap_first}Dao {
	@Resource
	private ReadDao readDao;

	@Resource
	private WriteDao writeDao;

	/**
	 * 创建${table.shortTableName?cap_first}
	 * 
	 * @param ${table.shortTableName?cap_first}
	 * @return
	 */
	public int create(${table.shortTableName?cap_first} ${table.shortTableName}) {
		return writeDao.create(${table.shortTableName?cap_first}.class, "${table.shortTableName?cap_first}_insert",
				${table.shortTableName});
	}

	/**
	 * 删除WlkQyhBase${table.shortTableName?cap_first}* @param parameter
	 * @return
	 */
	public int delete(SqlParameter parameter) {
		return writeDao.delete(${table.shortTableName?cap_first}.class, "${table.shortTableName?cap_first}_delete",
				parameter);
	}

	/**
	 * 更新${table.shortTableName?cap_first}
	 * 
	 * @param parameter
	 * @return
	 */
	public int update(SqlParameter parameter) {
		return writeDao.update(${table.shortTableName?cap_first}.class, "${table.shortTableName?cap_first}_update",
				parameter);
	}

	/**
	 * 读取${table.shortTableName?cap_first}
	 * 
	 * @param parameter
	 * @return
	 */
	public ${table.shortTableName?cap_first} read(SqlParameter parameter) {
		return readDao.read(${table.shortTableName?cap_first}.class, "${table.shortTableName?cap_first}_read",
				parameter);
	}

	/**
	 * 读取第一条数据${table.shortTableName?cap_first}
	 * 
	 * @param parameter
	 * @return
	 */
	public ${table.shortTableName?cap_first} readOne(SqlParameter parameter) {
		return readDao.read(${table.shortTableName?cap_first}.class, "${table.shortTableName?cap_first}_readone",
				parameter);
	}

	/**
	 * 读取分页信息${table.shortTableName?cap_first}
	 * 
	 * @param parameter
	 * @return
	 */
	public Collection<${table.shortTableName?cap_first}> page(SqlParameter parameter) {
		return readDao.select(${table.shortTableName?cap_first}.class, "${table.shortTableName?cap_first}_page",
				parameter);
	}

	/**
	 * 读取总条数${table.shortTableName?cap_first}
	 * 
	 * @param parameter
	 * @return
	 */
	public long count(SqlParameter parameter) {
		return readDao.count(${table.shortTableName?cap_first}.class, "${table.shortTableName?cap_first}_count",
				parameter);
	}
}
