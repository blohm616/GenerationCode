package ${servicePackage};

import ${entityVoPackage}.${table.javaName?cap_first}Vo;
import com.xiezhyan.hishop.basic.entity.Pagination;
import com.xiezhyan.hishop.basic.entity.Pager;
import java.util.List;

public interface ${table.javaName?cap_first}Service {
	
	int add(${table.javaName?cap_first}Vo ${table.javaName}Vo);
	
	int deleteByKey(<#list table.fields as field><#if field.columnKey == "PRI">${field.javaType} ${field.javaField}</#if></#list>);
	
	int updateByKey(${table.javaName?cap_first}Vo ${table.javaName}Vo);
	
	${table.javaName?cap_first}Vo findByKey(<#list table.fields as field><#if field.columnKey == "PRI">${field.javaType} ${field.javaField}</#if></#list>);
	
	List<${table.javaName?cap_first}Vo> findList(${table.javaName?cap_first}Vo ${table.javaName}Vo);
	
	Pager<${table.javaName?cap_first}Vo> findListByPage(${table.javaName?cap_first}Vo ${table.javaName}Vo,Pagination pagination);
	
	int findCount(${table.javaName?cap_first}Vo ${table.javaName}Vo);
}
