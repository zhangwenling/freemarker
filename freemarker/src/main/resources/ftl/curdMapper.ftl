<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//ibatis.apache.org//DTD Mapper 3.0//EN" "http://ibatis.apache.org/dtd/ibatis-3-mapper.dtd">

<mapper namespace="${table.tableName}">
 <!-- =======业务SQL====== -->
 <!-- 创建配置 -->
 <insert id="${table.shortTableName?cap_first}_insert" parameterType="${table.shortTableName?cap_first}">
  <selectKey resultType="long" keyProperty="id" order="BEFORE">SELECT SEQ_${table.sequence}.nextval FROM DUAL </selectKey>
     INSERT INTO ${table.tableName} (
                 <#list table.columnList as being>
                 ${ being.columnName}<#if being_has_next>,</#if>
                 </#list>
                 )
        VALUES (
                 <#list table.columnList as being>
                 	<#if being.isEnum>#${"{" + being.shortColumnName}, jdbcType=${being.jdbcType}, typeHandler=${being.packageStr + ".handler." + being.enumClassName + "Handler"}}<#else>#${"{" + being.shortColumnName}, jdbcType=${being.jdbcType}}</#if><#if being_has_next>,</#if>
                 </#list>
                )
 </insert>
 <!-- 删除配置 --> 
 <delete id="${table.shortTableName?cap_first}_delete" parameterType="map">
	DELETE ${table.tableName}
  	<include refid="${table.shortTableName?cap_first}QueryFilter"/>
 </delete>
 <!-- 修改配置 -->
 <update id="${table.shortTableName?cap_first}_update" parameterType="map">
	UPDATE ${table.tableName}
  <include refid="${table.shortTableName?cap_first}SetFilter"/>
  <include refid="${table.shortTableName?cap_first}QueryFilter"/>
 </update>
 <!-- 查询单条记录配置 -->
 <select id="${table.shortTableName?cap_first}_read" parameterType="map" resultMap="${table.shortTableName?cap_first}ResultMap">
SELECT * FROM ${table.tableName}
  <include refid="${table.shortTableName?cap_first}QueryFilter"/>
 </select>
 <!-- 查询集合中的第一个值配置 -->
 <select id="${table.shortTableName?cap_first}_readone" parameterType="map" resultMap="${table.shortTableName?cap_first}ResultMap">
SELECT TT.*,ROWNUM FROM (SELECT * FROM ${table.tableName}
  <include refid="${table.shortTableName?cap_first}QueryFilter"/> ) TT WHERE ROWNUM = 1
 </select>
 <!-- 查询分页配置 -->
 <select id="${table.shortTableName?cap_first}_page" parameterType="map" resultMap="${table.shortTableName?cap_first}ResultMap">
  <include refid="Public.beforePage"/>
SELECT * FROM ${table.tableName}
  <include refid="${table.shortTableName?cap_first}QueryFilter"/>
  <include refid="Public.OrderCriteria"/>
  <include refid="Public.afterPage"/>
 </select>
 <!-- 查询集合大小配置 -->
 <select id="${table.shortTableName?cap_first}_count" parameterType="map" resultType="long">
SELECT COUNT(*) FROM ${table.tableName}
  <include refid="${table.shortTableName?cap_first}QueryFilter"/>
 </select>
</mapper>
