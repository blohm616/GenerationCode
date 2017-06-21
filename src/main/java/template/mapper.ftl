package ${mapperPackage};

import ${entityPackage}.${table.javaName?cap_first};
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ${table.javaName?cap_first}Mapper {
	
	int add(${table.javaName?cap_first} ${table.javaName});
	
	int deleteByKey(<#list table.fields as field><#if field.columnKey == "PRI">${field.javaType} ${field.javaField}</#if></#list>);
	
	int updateByKey(${table.javaName?cap_first} ${table.javaName});
	
	${table.javaName?cap_first} findByKey(<#list table.fields as field><#if field.columnKey == "PRI">${field.javaType} ${field.javaField}</#if></#list>);
	
	List<${table.javaName?cap_first}> findList(${table.javaName?cap_first} ${table.javaName});
	
	List<${table.javaName?cap_first}> findListByPage(@Param("${table.javaName}") ${table.javaName?cap_first} ${table.javaName},@Param("startPage") int startPage, @Param("pageSize") int pageSize);
	
	int findCount(${table.javaName?cap_first} ${table.javaName});
}
