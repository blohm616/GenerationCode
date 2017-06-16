package ${mapperPackage};

import ${entityPackage}.${table.javaName?cap_first};
import java.util.List;

public interface ${table.javaName?cap_first}Mapper {
	
	int add(${table.javaName?cap_first} ${table.javaName});
	
	int deleteByKey(${table.javaName?cap_first} ${table.javaName});
	
	int updateByKey(${table.javaName?cap_first} ${table.javaName});
	
	${table.javaName?cap_first} findByKey(${table.javaName?cap_first} ${table.javaName});
	
	List<${table.javaName?cap_first}> findAll(${table.javaName?cap_first} ${table.javaName});
	
	List<${table.javaName?cap_first}> findAll(${table.javaName?cap_first} ${table.javaName},int startPage, int pageSize);
	
	int findCount(${table.javaName?cap_first} ${table.javaName});
}
