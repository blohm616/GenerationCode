package ${controllerPackage!""};

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ${entityPackage}.${table.javaName?cap_first};
import ${servicePackage}.${table.javaName?cap_first}Service;

import com.xiezhyan.hishop.basic.entity.Pager;
import com.xiezhyan.hishop.basic.entity.Pagination;
import com.xiezhyan.hishop.utils.LogUtil;

@Controller
@RequestMapping("/${table.name}")
public class ${table.javaName?cap_first}Controller {

	@Resource
	private ${table.javaName?cap_first}Service ${table.javaName}Service;
	
	/**
	 * 
	 *	version:通过id查询
	 *	@param id
	 *	@return
	 *-------------------------------------
	 *	author:xiezhyan
	 *	date:${nowDate?string("yyyy-MM-dd")}
	 */
	@RequestMapping("/findByKey")
	public String findByKey(HttpServletRequest request,<#list table.fields as field><#if field.columnKey == "PRI">${field.javaType}</#if></#list> id) {
		
		${table.javaName?cap_first} ${table.javaName} = ${table.javaName}Service.findByKey(id);
		request.setAttribute("${table.javaName}", ${table.javaName});
		return "${table.javaName}_info";
	}
	
	/**
	 * 
	 *	version:通过id删除
	 *	@param request
	 *	@param id
	 *	@return
	 *-------------------------------------
	 *	author:xiezhyan
	 *	date:${nowDate?string("yyyy-MM-dd")}
	 */
	@RequestMapping("/deleteByKey")
	public String deleteByKey(HttpServletRequest request,<#list table.fields as field><#if field.columnKey == "PRI">${field.javaType}</#if></#list> id) {
		
		int result = ${table.javaName}Service.deleteByKey(id);
		LogUtil.i("delete::" + result);
		
		return "redirect:findList";
	}
	
	/**
	 * 
	 *	version:查询列表
	 *	@param request
	 *	@param ${table.javaName}	条件查询时传入的参数
	 *	@param pagination	分页参数
	 *	@return		返回结果
	 *-------------------------------------
	 *	author:xiezhyan
	 *	date:${nowDate?string("yyyy-MM-dd")}
	 */
	@RequestMapping("/findList")
	public String findList(HttpServletRequest request,${table.javaName?cap_first} ${table.javaName},Pagination pagination) {
		Pager<${table.javaName?cap_first}> pager = ${table.javaName}Service.findListByPage(${table.javaName}, pagination);
		
		request.setAttribute("pager", pager);

		return "${table.javaName}_list";
	}
	
	/**
	 * 
	 *	version: 页面跳转：添加，修改
	 *	@param request
	 *	@param id	id不为空，修改页面
	 *				id为空，添加页面
	 *	@return
	 *-------------------------------------
	 *	author:xiezhyan
	 *	date:${nowDate?string("yyyy-MM-dd")}
	 */
	@RequestMapping("/toPage")
	public String toPage(HttpServletRequest request,<#list table.fields as field><#if field.columnKey == "PRI">${field.javaType}</#if></#list> id) {
		
		if(null != id) {
			${table.javaName?cap_first} ${table.javaName} = ${table.javaName}Service.findByKey(id);
			request.setAttribute("${table.javaName}",${table.javaName});
		}
		
		return "${table.javaName}_page";
	}
	
	/**
	 * 
	 *	version: 页面跳转：添加，修改
	 *	@param request
	 *	@param id	id不为空，修改页面
	 *				id为空，添加页面
	 *	@return
	 *-------------------------------------
	 *	author:xiezhyan
	 *	date:${nowDate?string("yyyy-MM-dd")}
	 */
	 @RequestMapping(value="/add",method=RequestMethod.POST)
	 public String updateByKey(HttpServletRequest request,${table.javaName?cap_first} ${table.javaName}) {
	 	int result = ${table.javaName}Service.add(${table.javaName});
	 	
	 	LogUtil.i("add::" + result);
	 	
	 	return "redirect:findList";
	 }
	
	/**
	 * 
	 *	version: 修改内容
	 *	@param request
	 *	@param ${table.javaName}	需要修改的数据
	 *	@return
	 *-------------------------------------
	 *	author:xiezhyan
	 *	date:${nowDate?string("yyyy-MM-dd")}
	 */
	@RequestMapping("/updateByKey")
	public String updateByKey(HttpServletRequest request,${table.javaName?cap_first} ${table.javaName},<#list table.fields as field><#if field.columnKey == "PRI">${field.javaType}</#if></#list> id) {
		
		${table.javaName?cap_first} old${table.javaName?cap_first} = ${table.javaName}Service.findByKey(id);
		if(null != ${table.javaName}) {
			<#list table.fields as field>
			if(null != ${table.javaName}.get${field.javaField?cap_first!""}()) {
				old${table.javaName?cap_first}.set${field.javaField?cap_first!""}(${table.javaName}.get${field.javaField?cap_first!""}());
			}
			</#list>
		}
		
		int result = ${table.javaName}Service.updateByKey(old${table.javaName?cap_first});
		
		LogUtil.i("update::" + result);
		
		return "redirect:findList";
	}
	
	
}
