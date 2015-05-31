<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//ibatis.apache.org//DTD Mapper 3.0//EN" "http://ibatis.apache.org/dtd/ibatis-3-mapper.dtd">

<mapper namespace="${table.tableName}">
 	<!-- 映射配置 -->
	<resultMap type="${table.shortTableName?cap_first}" id="${table.shortTableName?cap_first}ResultMap">
		<#list table.columnList as being>
         	<#if being.isEnum>
         	<result column="${being.columnName}" property="${being.shortColumnName}" typeHandler=${"\"" + being.packageStr + ".handler."}<#if being.shortColumnName=="state">YesOrNoHandler"<#else>${being.enumClassName}Handler"</#if>/>
         	<#else>
         	<result column="${being.columnName}" property="${being.shortColumnName}"/>
         	</#if>
        </#list>
	</resultMap>
 <!-- 条件配置 -->
<sql id="${table.shortTableName?cap_first}QueryFilter">
	<where>
<#list table.columnList as being>
 	<#if being.isEnum>
 		<if test="query${being.shortColumnName?cap_first} != null"> AND T.${being.columnName} = ${emptyString!'#'}${"{query" + being.shortColumnName?cap_first}, typeHandler=${being.packageStr + ".handler."}<#if being.shortColumnName=="state">YesOrNoHandler<#else>${being.enumClassName}Handler</#if>} </if>
 	<#else>
 		<if test="query${being.shortColumnName?cap_first} != null"> AND T.${being.columnName} = ${emptyString!'#'}{query${being.shortColumnName?cap_first}} </if>
 	</#if>
 	<#list ["CREATE_DATE","UPDATE_DATE"] as word>
    	<#if word==being.columnName || (word!=being.columnName && being.columnType=="DATE") >
   		<if test="queryStart${being.shortColumnName?cap_first} != null"> AND T.${being.columnName} &gt;= ${emptyString!'#'}{queryStart${being.shortColumnName?cap_first},typeHandler=cn.wkey.api.common.entity.handler.DateHandler} </if>
   		<if test="queryEnd${being.shortColumnName?cap_first} != null"> AND T.${being.columnName} &lt;= ${emptyString!'#'}{queryEnd${being.shortColumnName?cap_first},typeHandler=cn.wkey.api.common.entity.handler.DateHandler} </if>
   		<#break>
    	</#if>
    </#list>
</#list>
		<if test="queryIdList != null"> AND T.ID IN 
		 <foreach collection="queryIdList" index="index" item="item" open="(" separator="," close=")">${emptyString!'#'}{item}</foreach>
		</if>
	</where>
</sql>
 <!-- 更新配置 -->
<sql id="${table.shortTableName?cap_first}SetFilter">
	<set>
<#list table.columnList as being>
 	<#if being.isEnum>
 		<if test="update${being.shortColumnName?cap_first} != null"> T.${being.columnName?cap_first} = ${emptyString!'#'}{update${being.shortColumnName?cap_first}, typeHandler=${being.packageStr + ".handler."}<#if being.shortColumnName=="state">YesOrNoHandler<#else>${being.enumClassName}Handler</#if>}, </if>
 	<#else>
 		<if test="update${being.shortColumnName?cap_first} != null"> T.${being.columnName?cap_first} = ${emptyString!'#'}{update${being.shortColumnName?cap_first}<#if being.columnType=="DATE" >, typeHandler=cn.wkey.api.common.entity.handler.DateHandler</#if>}, </if>
 	</#if>
</#list>
	</set>
</sql>
</mapper>
