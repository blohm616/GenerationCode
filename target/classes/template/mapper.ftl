package ${mapperPackage};

import ${entityVoPackage}.${table.javaName?cap_first}Vo;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ${table.javaName?cap_first}Mapper {
	
	int add(${table.javaName?cap_first}Vo ${table.javaName}Vo);
	
	int deleteByKey(<#list table.fields as field><#if field.columnKey == "PRI">${field.javaType} ${field.javaField}</#if></#list>);
	
	int updateByKey(${table.javaName?cap_first}Vo ${table.javaName}Vo);
	
	${table.javaName?cap_first}Vo findByKey(<#list table.fields as field><#if field.columnKey == "PRI">${field.javaType} ${field.javaField}</#if></#list>);
	
	List<${table.javaName?cap_first}Vo> findList(${table.javaName?cap_first}Vo ${table.javaName}Vo);
	
	List<${table.javaName?cap_first}Vo> findListByPage(@Param("${table.javaName}") ${table.javaName?cap_first}Vo ${table.javaName}Vo,@Param("startPage") int startPage, @Param("pageSize") int pageSize);
	
	int findCount(${table.javaName?cap_first}Vo ${table.javaName}Vo);
}
