package com.xiezhyan.generation;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.xiezhyan.generation.entity.Fields;
import com.xiezhyan.generation.entity.Tables;
import com.xiezhyan.generation.mappers.FieldMapper;
import com.xiezhyan.generation.mappers.TableMapper;
import com.xiezhyan.generation.utils.DaoSupport;
import com.xiezhyan.generation.utils.FreemarkerUtil;
import com.xiezhyan.generation.utils.LogUtil;
import com.xiezhyan.generation.utils.StringUtil;

/**
 * Hello world!
 *
 */
public class App 
{
	
	private static DaoSupport mDaoInstance = DaoSupport.getInstance();
	private static StringUtil mStringInstance = StringUtil.getInstance();
	private static FreemarkerUtil mFreemarker = FreemarkerUtil.getInstance();
	
	public static List<Tables> getTables() {
		
		String tableSchema = mDaoInstance.getPropVal("table_schema");
		
		SqlSession session = mDaoInstance.getSession();
		
		/**获取所有的表*/
    	TableMapper tm = session.getMapper(TableMapper.class);
    	List<Tables> tables = tm.findAllTables();

    	if(tables != null && tables.size() > 0) {
    		/**获取表中所有的字段*/
    		FieldMapper fm = session.getMapper(FieldMapper.class);
    		Map<String,String> map = null;
    		for(Tables table : tables) {
    			map = new HashMap<String,String>();
    			map.put("tableSchema", tableSchema);
    			map.put("tableName", table.getName());
    			
    			List<Fields> fields = fm.findFieldByTable(map);
    			table.setFields(fields);
    		}
    	}
    	return tables;
	}
	
    public static void main( String[] args )
    {
    	List<Tables> tables = getTables();
    	Map<String,Object> root = new HashMap<String,Object>();
    	
    	//生成代码的包结构
    	String packageName = mDaoInstance.getPropVal("packageName").replace(".", File.separator);

    	//不同包名的文件类型
    	String entityPackage = packageName + File.separator + "entity";
		String servicePackage = packageName + File.separator + "service";
		String serviceImplPackage = packageName + File.separator + "service" + File.separator + "impl";
		String mapperPackage = packageName + File.separator + "mappers";
		
		//获取模板所在路径
		String templatePath = App.class.getClassLoader().getResource("template").getPath();
		
		String tableJavaName = null;
		
		for(Tables table : tables) {
			
			tableJavaName = mStringInstance.firstUpperCase(table.getJavaName());
			
			root = new HashMap<String,Object>();
			
			root.put("table", table);
			root.put("packageName", packageName.replace(File.separator,"."));
			root.put("entityPackage", entityPackage.replace(File.separator,"."));
			root.put("servicePackage", servicePackage.replace(File.separator,"."));
			root.put("serviceImplPackage", serviceImplPackage.replace(File.separator,"."));
			root.put("mapperPackage", mapperPackage.replace(File.separator,"."));
			root.put("nowDate", new Date());
			
			try {
				//entity
				mFreemarker.tempWriter(templatePath, 
							"entity.ftl", entityPackage, tableJavaName + ".java", root);
				
				//serivce
				mFreemarker.tempWriter(templatePath, 
						"service.ftl", servicePackage, tableJavaName + "Service.java", root);
				
				//serviceImpl
				mFreemarker.tempWriter(templatePath, 
						"service_impl.ftl", serviceImplPackage, tableJavaName + "ServiceImpl.java", root);
				
				//mapper
				mFreemarker.tempWriter(templatePath, 
						"mapper.ftl", mapperPackage, tableJavaName + "Mapper.java", root);
				
				//mapper.xml
				mFreemarker.tempWriter(templatePath, 
						"mapper_xml.ftl", mapperPackage, tableJavaName + "Mapper.xml", root);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//FileUtil.getInstance().compressExe(FreemarkerUtil.getInstance().getParentPath(packageName), FreemarkerUtil.getInstance().getParentPath(packageName) + ".zip");
		LogUtil.i("全部完成");
    }
}
