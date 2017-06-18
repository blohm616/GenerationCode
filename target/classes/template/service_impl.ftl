package ${serviceImplPackage};

import ${entityPackage}.${table.javaName?cap_first};
import ${packageName}.basic.entity.Pagination;
import ${packageName}.basic.entity.Pager;
import ${servicePackage}.${table.javaName?cap_first}Service;
import ${mapperPackage}.${table.javaName?cap_first}Mapper;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;


@Service("${table.javaName}Service")
public class ${table.javaName?cap_first}ServiceImpl implements ${table.javaName?cap_first}Service {

	@Resource
	private ${table.javaName?cap_first}Mapper ${table.javaName}Mapper;
	
	@Override
	public int add(${table.javaName?cap_first} ${table.javaName}) {
		return ${table.javaName}Mapper.add(${table.javaName});
	}
	
	@Override
	public int deleteByKey(${table.javaName?cap_first} ${table.javaName}) {
		return ${table.javaName}Mapper.deleteByKey(${table.javaName});
	}	
	
	@Override
	public int updateByKey(${table.javaName?cap_first} ${table.javaName}) {
		return ${table.javaName}Mapper.updateByKey(${table.javaName});
	}
	
	@Override
	public ${table.javaName?cap_first} findByKey(${table.javaName?cap_first} ${table.javaName}) {
		return ${table.javaName}Mapper.findByKey(${table.javaName});
	}
	
	@Override
	public List<${table.javaName?cap_first}> findList(${table.javaName?cap_first} ${table.javaName}) {
		return ${table.javaName}Mapper.findList(${table.javaName});
	}
	
	@Override
	public Pager<${table.javaName?cap_first}> findListByPage(${table.javaName?cap_first} ${table.javaName},Pagination pagination) {
		pagination.setPageCount(findCount(${table.javaName}));
		
		List<${table.javaName?cap_first}> datas = ${table.javaName}Mapper.findListByPage(${table.javaName},pagination.getStartPage(),pagination.getPageSize());
		
		return new Pager<${table.javaName?cap_first}>(pagination,datas);
	}
	
	@Override
	public int findCount(${table.javaName?cap_first} ${table.javaName}) {
		return ${table.javaName}Mapper.findCount(${table.javaName});
	}
	
}
