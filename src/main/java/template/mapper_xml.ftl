<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${mapperPackage}.${table.name?cap_first}Mapper">

	<resultMap type="${entityPackage}.${table.name?cap_first}" id="${table.name}Map">
		<#list table.fields as field>
		<#if field.columnKey == "PRI">
		<id column="${field.columnName}"  property="${field.javaField}" jdbcType="${field.jdbcType}"/>
		<#else>
		<result column="${field.columnName}" property="${field.javaField}" jdbcType="${field.jdbcType}"/>
		</#if>
		</#list>
	</resultMap>
	
	<sql id="${table.name}_columns">
		<#list table.fields as field>
		${field.columnName}<#if field_index + 1 != table.fields?size>,</#if>
		</#list>
	</sql>
	
    <select id="findByKey" resultMap="${table.name}Map" parameterType="${entityPackage}.${table.name?cap_first}">
    	SELECT
    	<include refid="${table.name}_columns" />
    	FROM ${table.name} 
    	WHERE 
    	<#list table.fields as field>
		<#if field.columnKey == "PRI">
		${field.columnName} = ${r"#{" + field.javaField + "}"}
		</#if>
		</#list>
    </select>
    
    <select id="findAll" resultMap="${table.name}Map" parameterType="${entityPackage}.${table.name?cap_first}">
    </select>
    
    <select id="findAll" resultMap="${table.name}Map" >
    </select>
    
    <select id="findCount" parameterType="${entityPackage}.${table.name?cap_first}">
    </select>
    
    <delete id="delete" parameterType="${entityPackage}.${table.name?cap_first}">
    </delete>
    
    <update id="update" parameterType="${entityPackage}.${table.name?cap_first}">
    </update>
    
    <insert id="add" parameterType="${entityPackage}.${table.name?cap_first}">
    </insert>
</mapper>

