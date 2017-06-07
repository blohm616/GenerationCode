package ${serviceImplPackage};

import ${entityPackage}.${table.name?cap_first};
import ${packageName}.basic.entity.Pagination;
import ${packageName}.basic.entity.Pager;
import ${servicePackage}.${table.name?cap_first}Service;

import org.springframework.stereotype.Service;


@Service("${table.name}Service")
public class ${table.name?cap_first}ServiceImpl implements ${table.name?cap_first}Service {

	@Resource
	private ${table.name?cap_first}Mapper ${table.name}Mapper;
	
	@Override
	public int add(${table.name?cap_first} ${table.name}) {
		return ${table.name}Mapper.add(${table.name});
	}
	
	@Override
	public int delete(${table.name?cap_first} ${table.name}) {
		return ${table.name}Mapper.delete(${table.name});
	}	
	
	@Override
	public int update(${table.name?cap_first} ${table.name}) {
		return ${table.name}Mapper.update(${table.name});
	}
	
	@Override
	public ${table.name?cap_first} find(${table.name?cap_first} ${table.name}) {
		return ${table.name}Mapper.find(${table.name});
	}
	
	@Override
	public List<${table.name?cap_first}> findAll(${table.name?cap_first} ${table.name}) {
		return ${table.name}Mapper.findAll(${table.name});
	}
	
	@Override
	public Pager<${table.name?cap_first}> findAll(${table.name?cap_first} ${table.name},Pagination pagination) {
		pagination.setPageCount(findCount(${table.name?cap_first} ${table.name}));
		
		List<${table.name?cap_first}> datas = ${table.name}Mapper.findAll(${table.name},pagination.getStartPage(),pagination.pageSize);
		
		return new Pager<${table.name?cap_first}>(pagination,datas);
	}
	
	@Override
	public int findCount(${table.name?cap_first} ${table.name}) {
		return ${table.name}Mapper.findCount(${table.name});
	}
	
}
