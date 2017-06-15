package ${mapperPackage};

import ${entityPackage}.${table.name?cap_first};
import ${packageName}.basic.entity.Pagination;
import ${packageName}.basic.entity.Pager;

public interface ${table.name?cap_first}Mapper {
	
	int add(${table.name?cap_first} ${table.name});
	
	int delete(${table.name?cap_first} ${table.name});
	
	int update(${table.name?cap_first} ${table.name});
	
	${table.name?cap_first} findByKey(${table.name?cap_first} ${table.name});
	
	List<${table.name?cap_first}> findAll(${table.name?cap_first} ${table.name});
	
	List<${table.name?cap_first}> findAll(${table.name?cap_first} ${table.name},int startPage, int pageSize);
	
	int findCount(${table.name?cap_first} ${table.name});
}
