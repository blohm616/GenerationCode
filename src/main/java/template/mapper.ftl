package ${mapperPackage};

import ${entityPackage}.${table.javaName?cap_first};
import ${packageName}.basic.entity.Pagination;
import ${packageName}.basic.entity.Pager;
import java.util.List;

public interface ${table.javaName?cap_first}Mapper {
	
	int add(${table.javaName?cap_first} ${table.javaName});
	
	int delete(${table.javaName?cap_first} ${table.javaName});
	
	int update(${table.javaName?cap_first} ${table.javaName});
	
	${table.javaName?cap_first} findByKey(${table.javaName?cap_first} ${table.javaName});
	
	List<${table.javaName?cap_first}> findAll(${table.javaName?cap_first} ${table.javaName});
	
	List<${table.javaName?cap_first}> findAll(${table.javaName?cap_first} ${table.javaName},int startPage, int pageSize);
	
	int findCount(${table.javaName?cap_first} ${table.javaName});
}
