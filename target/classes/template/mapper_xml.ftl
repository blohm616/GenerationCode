<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${mapperPackage}.${table.javaName?cap_first}Mapper">

	<resultMap type="${entityVoPackage}.${table.javaName?cap_first}Vo" id="${table.javaName}Map">
		<#list table.fields as field>
		<#if field.columnKey == "PRI">
		<id column="${field.columnName}"  property="${field.javaField}"/>
		<#else>
		<result column="${field.columnName}" property="${field.javaField}"/>
		</#if>
		</#list>
	</resultMap>

	<sql id="${table.name}_columns">
		<#list table.fields as field>
		${field.columnName}<#if field_index + 1 != table.fields?size>,</#if>
		</#list>
	</sql>
	
    <select id="findByKey" resultMap="${table.javaName}Map" parameterType="<#list table.fields as field><#if field.columnKey == "PRI">${field.javaType}</#if></#list>">
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
    
    <select id="findList" resultMap="${table.javaName}Map" parameterType="${entityVoPackage}.${table.javaName?cap_first}Vo">
    	SELECT
    	<include refid="${table.name}_columns" />
    	FROM ${table.name} 
    	<where>
	    	<#list table.fields as field>
	    	<#if (field.javaType!"") == "String">
	    	<if test="${field.javaField} !=null ">  
	    		<#if field_index != 0>AND</#if> ${field.columnName} LIKE CONCAT('%',${r"#{" + field.javaField + "}"},'%')   
			</if>  
	    	<#else>
			<if test="${field.javaField} !=null ">  
	            <#if field_index != 0>AND</#if> ${field.columnName} = ${r"#{" + field.javaField + "}"}
	        </if> 
	        </#if> 
			</#list>
    	</where>
    </select>
    
    <select id="findListByPage" resultMap="${table.javaName}Map" >
    	SELECT
    	<include refid="${table.name}_columns" />
    	FROM ${table.name} 
    	<where>
    		<#list table.fields as field>
	    	<#if (field.javaType!"") == "String">
	    	<if test="${table.javaName}.${field.javaField} !=null ">  
	    		<#if field_index != 0>AND</#if> ${field.columnName} LIKE CONCAT('%',${r"#{" + table.javaName + "." + field.javaField + "}"},'%') 
			</if>  
	    	<#else>
			<if test="${table.javaName}.${field.javaField} !=null ">  
	            <#if field_index != 0>AND</#if> ${field.columnName} = ${r"#{" + table.javaName + "." + field.javaField + "}"}
	        </if> 
	        </#if> 
			</#list>
    	</where>
		LIMIT ${r"#{startPage}"},${r"#{pageSize}"}
    </select>
    
    <select id="findCount" parameterType="${entityVoPackage}.${table.javaName?cap_first}Vo" resultType="java.lang.Integer">
    	SELECT
    	COUNT(*)
    	FROM ${table.name} 
    	<where>
	    	<#list table.fields as field>
	    	<#if (field.javaType!"") == "String">
	    	<if test="${field.javaField} !=null ">  
	    		<#if field_index != 0>AND</#if> ${field.columnName} LIKE CONCAT('%',${r"#{" + field.javaField + "}"},'%') 
			</if>  
	    	<#else>
			<if test="${field.javaField} !=null ">  
	            <#if field_index != 0>AND</#if> ${field.columnName} = ${r"#{" + field.javaField + "}"}
	        </if> 
	        </#if> 
			</#list>
    	</where>
    </select>
    
    <delete id="deleteByKey" parameterType="<#list table.fields as field><#if field.columnKey == "PRI">${field.javaType}</#if></#list>">
		DELETE FROM ${table.name}
		WHERE 
    	<#list table.fields as field>
		<#if field.columnKey == "PRI">
		${field.columnName} = ${r"#{" + field.javaField + "}"}
		</#if>
		</#list>
    </delete>
    
    <update id="updateByKey" parameterType="${entityVoPackage}.${table.javaName?cap_first}Vo">
    	UPDATE ${table.name}
	    <set>
		    <#list table.fields as field>
			<if test="${field.javaField} !=null ">  
	           ${field.columnName} = ${r"#{" + field.javaField + "}"},
	        </if> 
			</#list>
	    </set>
	    WHERE 
	    <#list table.fields as field>
		<#if field.columnKey == "PRI">
		${field.columnName} = ${r"#{" + field.javaField + "}"}
		</#if>
		</#list>
    </update>
    
    <insert id="add" parameterType="${entityVoPackage}.${table.javaName?cap_first}Vo">
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
	          ${r"#{" + field.javaField + "}"},
	        </if> 
			</#list>
	    </trim>
    </insert>
</mapper>


