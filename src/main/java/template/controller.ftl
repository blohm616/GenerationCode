package ${controllerPackage!""};

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ${entityVoPackage}.${table.javaName?cap_first}Vo;
import ${servicePackage}.${table.javaName?cap_first}Service;

import com.xiezhyan.hishop.basic.entity.Pager;
import com.xiezhyan.hishop.basic.entity.Pagination;
import com.xiezhyan.hishop.utils.LogUtil;
import com.xiezhyan.hishop.utils.StringUtil;

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
		
		${table.javaName?cap_first}Vo ${table.javaName}Vo = ${table.javaName}Service.findByKey(id);
		request.setAttribute("${table.javaName}Vo", ${table.javaName}Vo);
		return "${table.javaName}/${table.javaName}_info";
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
	 *	@param ${table.javaName}Vo	条件查询时传入的参数
	 *	@param pagination	分页参数
	 *	@return		返回结果
	 *-------------------------------------
	 *	author:xiezhyan
	 *	date:${nowDate?string("yyyy-MM-dd")}
	 */
	@RequestMapping("/findList")
	public String findList(HttpServletRequest request,${table.javaName?cap_first}Vo ${table.javaName}Vo,Pagination pagination) {
		Pager<${table.javaName?cap_first}Vo> pager = ${table.javaName}Service.findListByPage(${table.javaName}Vo, pagination);
		
		request.setAttribute("pager", pager);
		request.setAttribute("${table.javaName}Vo",${table.javaName}Vo);

		return "${table.javaName}/${table.javaName}_list";
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
			${table.javaName?cap_first}Vo ${table.javaName}Vo = ${table.javaName}Service.findByKey(id);
			request.setAttribute("${table.javaName}Vo",${table.javaName}Vo);
		}
		
		return "${table.javaName}/${table.javaName}_page";
	}
	
	/**
	 * 
	 *	version: 添加功能
	 *	@param request
	 *	@param ${table.javaName}Vo	需要添加的内容
	 *				id为空，添加页面
	 *	@return
	 *-------------------------------------
	 *	author:xiezhyan
	 *	date:${nowDate?string("yyyy-MM-dd")}
	 */
	 @RequestMapping(value="/add",method=RequestMethod.POST)
	 public String add(HttpServletRequest request,${table.javaName?cap_first}Vo ${table.javaName}Vo) {
	 	int result = ${table.javaName}Service.add(${table.javaName}Vo);
	 	
	 	LogUtil.i("add::" + result);
	 	
	 	return "redirect:findList";
	 }
	
	/**
	 * 
	 *	version: 修改内容
	 *	@param request
	 *	@param ${table.javaName}Vo	需要修改的数据
	 *	@return
	 *-------------------------------------
	 *	author:xiezhyan
	 *	date:${nowDate?string("yyyy-MM-dd")}
	 */
	@RequestMapping(value="/updateByKey",method=RequestMethod.POST)
	public String updateByKey(HttpServletRequest request,${table.javaName?cap_first}Vo ${table.javaName}Vo,<#list table.fields as field><#if field.columnKey == "PRI">${field.javaType}</#if></#list> id) {
		
		${table.javaName?cap_first}Vo old${table.javaName?cap_first}Vo = ${table.javaName}Service.findByKey(id);
		if(null != ${table.javaName}Vo) {
			<#list table.fields as field>
			if(null != ${table.javaName}Vo.get${field.javaField?cap_first!""}()) {
				old${table.javaName?cap_first}Vo.set${field.javaField?cap_first!""}(${table.javaName}Vo.get${field.javaField?cap_first!""}());
			}
			</#list>
		}
		
		int result = ${table.javaName}Service.updateByKey(old${table.javaName?cap_first}Vo);
		
		LogUtil.i("update::" + result);
		
		return "redirect:findList";
	}
	
	
}
