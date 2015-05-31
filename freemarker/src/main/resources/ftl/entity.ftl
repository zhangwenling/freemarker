package ${table.basePackage}.entity;

import cn.shangjia.framework.entity.Entity;
import cn.wkey.framework.entity.json.CommonCodeSerializer;
import cn.wkey.framework.entity.json.JsonEnumDeserializer;
<#list table.columnList as being>
<#if being.packageStr??>
import ${being.packageStr}.support.${being.enumClassName?cap_first};
</#if>
</#list>

import com.fasterxml.jackson.annotation.JsonFilter;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize.Inclusion;
<#list table.importEntity as being>
import ${being};
</#list>

/**
 * ${table.shortTableName?cap_first}管理
 * 
 * @author ${table.author}
 * @date ${.now}
 */
@JsonFilter("DefaultFilter")
public class ${table.shortTableName?cap_first} extends Entity {
	private static final long serialVersionUID = 1L;
<#assign seq = ["id", "createDate", "updateDate"]>
<#list table.columnList as being>
<#if !seq?seq_contains(being.shortColumnName)>
	<#if being.isEnum>
 	/** 
	 * ${being.columnComments}
	 */
	@JsonSerialize(using = CommonCodeSerializer.class, include = Inclusion.NON_NULL)
	@JsonDeserialize(using = JsonEnumDeserializer.class)
	private ${being.enumClassName} ${being.shortColumnName};
 	<#else>
	/** 
	 * ${being.columnComments}
	 */
	private ${being.javaType} ${being.shortColumnName};
 	</#if>
</#if>

</#list>

<#list table.columnList as being>
<#if !seq?seq_contains(being.shortColumnName)>
 	<#if being.isEnum>
 	/** 
	 * ${being.columnComments}
	 * @return the ${being.shortColumnName}
	 */
	public ${being.enumClassName} get${being.shortColumnName?cap_first}() {
		return ${being.shortColumnName};
	}
	
	/** 
	 * ${being.columnComments}
	 */
	public void set${being.shortColumnName?cap_first}(${being.enumClassName} ${being.shortColumnName}) {
		this.${being.shortColumnName} = ${being.shortColumnName};
	}
 	<#else>
	/** 
	 * ${being.columnComments}
	 * @return the ${being.shortColumnName}
	 */
	public ${being.javaType} get${being.shortColumnName?cap_first}() {
		return ${being.shortColumnName};
	}
	
	/** 
	 * ${being.columnComments}
	 */
	public void set${being.shortColumnName?cap_first}(${being.javaType} ${being.shortColumnName}) {
		this.${being.shortColumnName} = ${being.shortColumnName};
	}
 	</#if>
 </#if>
</#list>
	
}