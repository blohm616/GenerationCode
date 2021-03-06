package ${entityPackage!""};

import java.io.Serializable;
import java.util.*;

public class ${table.javaName?cap_first!""} implements Serializable {

	/**
	 *	version: ${table.comment!""}
	 *----------------------
	 * 	author:xiezhyan
	 * 	date:${nowDate?string("yyyy-MM-dd")}
	 */
	private static final long serialVersionUID = 1L;
	
	<#if table.fields?? && table.fields?size gt 0>
	<#list table.fields as field>
	/**${field.columnComment!""}*/
	private ${field.javaType!""} ${field.javaField!""};
	
	</#list>
	</#if>
	
	<#if table.fields?? && table.fields?size gt 0>
	<#list table.fields as field>
	public ${field.javaType!""} get${field.javaField?cap_first!""}() {
		return ${field.javaField};
	}

	public void set${field.javaField?cap_first!""}(${field.javaType!""} ${field.javaField!""}) {
		this.${field.javaField!""} = ${field.javaField!""};
	}
	</#list>
	</#if>
}
