package ${servicePackage};

import ${entityPackage}.${table.javaName?cap_first};
import com.xiezhyan.hishop.basic.entity.Pagination;
import com.xiezhyan.hishop.basic.entity.Pager;
import java.util.List;

public interface ${table.javaName?cap_first}Service {
	
	int add(${table.javaName?cap_first} ${table.javaName});
	
	int deleteByKey(<#list table.fields as field><#if field.columnKey == "PRI">${field.javaType} ${field.javaField}</#if></#list>);
	
	int updateByKey(${table.javaName?cap_first} ${table.javaName});
	
	${table.javaName?cap_first} findByKey(<#list table.fields as field><#if field.columnKey == "PRI">${field.javaType} ${field.javaField}</#if></#list>);
	
	List<${table.javaName?cap_first}> findList(${table.javaName?cap_first} ${table.javaName});
	
	Pager<${table.javaName?cap_first}> findListByPage(${table.javaName?cap_first} ${table.javaName},Pagination pagination);
	
	int findCount(${table.javaName?cap_first} ${table.javaName});
}
