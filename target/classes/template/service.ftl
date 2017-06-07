package ${servicePackage};

import ${entityPackage}.${table.name?cap_first};
import ${packageName}.basic.entity.Pagination;
import ${packageName}.basic.entity.Pager;

public interface ${table.name?cap_first}Service {
	
	int add(${table.name?cap_first} ${table.name});
	
	int delete(${table.name?cap_first} ${table.name});
	
	int update(${table.name?cap_first} ${table.name});
	
	${table.name?cap_first} find(${table.name?cap_first} ${table.name});
	
	List<${table.name?cap_first}> findAll(${table.name?cap_first} ${table.name});
	
	Pager<${table.name?cap_first}> findAll(${table.name?cap_first} ${table.name},Pagination pagination);
	
	int findCount(${table.name?cap_first} ${table.name});
}
