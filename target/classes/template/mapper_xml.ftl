<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${mapperPackage}.${table.javaName?cap_first}Mapper">

	<resultMap type="${entityPackage}.${table.javaName?cap_first}" id="${table.javaName}Map">
		<#list table.fields as field>
		<#if field.columnKey == "PRI">
		<id column="${field.columnName}"  property="${field.javaField}" jdbcType="${field.jdbcType?upper_case}"/>
		<#else>
		<result column="${field.columnName}" property="${field.javaField}" jdbcType="${field.jdbcType?upper_case}"/>
		</#if>
		</#list>
	</resultMap>
	
	<sql id="${table.name}_columns">
		<#list table.fields as field>
		${field.columnName}<#if field_index + 1 != table.fields?size>,</#if>
		</#list>
	</sql>
	
    <select id="findByKey" resultMap="${table.javaName}Map" parameterType="${entityPackage}.${table.javaName?cap_first}">
    	SELECT
    	<include refid="${table.name}_columns" />
    	FROM ${table.name} 
    	WHERE 
    	<#list table.fields as field>
		<#if field.columnKey == "PRI">
		${field.columnName} = ${r"#{" + field.javaField + ",jdbcType="+field.jdbcType?upper_case+"}"}
		</#if>
		</#list>
    </select>
    
    <select id="findAll" resultMap="${table.javaName}Map" parameterType="${entityPackage}.${table.javaName?cap_first}">
    	SELECT
    	<include refid="${table.name}_columns" />
    	FROM ${table.name} 
    	WHERE is_delete = 'N'
    	<#list table.fields as field>
    	<#if field.javaType == "String">
    	<if test="${field.javaField} !=null ">  
    		AND ${field.columnName} LIKE ${r"#{" + field.javaField + ",jdbcType="+field.jdbcType?upper_case+"}"}
		</if>  
    	<#else>
		<if test="${field.javaField} !=null ">  
            AND ${field.columnName} = ${r"#{" + field.javaField + ",jdbcType="+field.jdbcType?upper_case+"}"}
        </if> 
        </#if> 
		</#list>
    </select>
    
    <select id="findAll" resultMap="${table.javaName}Map" >
    	SELECT
    	<include refid="${table.name}_columns" />
    	FROM ${table.name} 
    	WHERE is_delete = 'N'
    	<#list table.fields as field>
    	<#if field.javaType == "String">
    	<if test="${field.javaField} !=null ">  
    		AND ${field.columnName} LIKE ${r"#{" + field.javaField + ",jdbcType="+field.jdbcType?upper_case+"}"}
		</if>  
    	<#else>
		<if test="${field.javaField} !=null ">  
            AND ${field.columnName} = ${r"#{" + field.javaField + ",jdbcType="+field.jdbcType?upper_case+"}"}
        </if> 
        </#if> 
		</#list>
		LIMIT startPage,pageSize
    </select>
    
    <select id="findCount" parameterType="${entityPackage}.${table.javaName?cap_first}">
    	SELECT
    	count(*)
    	FROM ${table.name} 
    	WHERE is_delete = 'N'
    	<#list table.fields as field>
    	<#if field.javaType == "String">
    	<if test="${field.javaField} !=null ">  
    		AND ${field.columnName} LIKE ${r"#{" + field.javaField + ",jdbcType="+field.jdbcType?upper_case+"}"}
		</if>  
    	<#else>
		<if test="${field.javaField} !=null ">  
            AND ${field.columnName} = ${r"#{" + field.javaField + ",jdbcType="+field.jdbcType?upper_case+"}"}
        </if> 
        </#if> 
		</#list>
    </select>
    
    <delete id="deleteByKey" parameterType="${entityPackage}.${table.javaName?cap_first}">
    	UPDATE ${table.name} 
    	SET is_delete = 'Y'
    	WHERE 
    	<#list table.fields as field>
		<#if field.columnKey == "PRI">
		${field.columnName} = ${r"#{" + field.javaField + ",jdbcType="+field.jdbcType?upper_case+"}"}
		</#if>
		</#list>
    </delete>
    
    <update id="updateByKey" parameterType="${entityPackage}.${table.javaName?cap_first}">
    	update ${table.name}
	    <set>
		    <#list table.fields as field>
			<if test="${field.javaField} !=null ">  
	           ${field.columnName} = ${r"#{" + field.javaField + ",jdbcType="+field.jdbcType?upper_case+"}"},
	        </if> 
			</#list>
	    </set>
	    where 
	    <#list table.fields as field>
		<#if field.columnKey == "PRI">
		${field.columnName} = ${r"#{" + field.javaField + ",jdbcType="+field.jdbcType?upper_case+"}"}
		</#if>
		</#list>
    </update>
    
    <insert id="add" parameterType="${entityPackage}.${table.javaName?cap_first}">
    	INSERT INTO ${table.name}
	    <trim prefix="(" suffix=")" suffixOverrides="," >
	      	<#list table.fields as field>
			<if test="${field.javaField} !=null ">  
	           ${field.columnName},
	        </if> 
			</#list>
	    </trim>
	    <trim prefix="values (" suffix=")" suffixOverrides="," >
	      <#list table.fields as field>
			<if test="${field.javaField} !=null ">  
	          ${r"#{" + field.javaField + ",jdbcType="+field.jdbcType?upper_case+"}"},
	        </if> 
			</#list>
	    </trim>
    </insert>
</mapper>


