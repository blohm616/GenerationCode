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
	
	private static String mTemplatePath;
	private static Map<String,Object> mRoot;
	
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
    	
    	//生成代码的包结构
    	String packageName = mDaoInstance.getPropVal("packageName").replace(".", File.separator);

    	//不同包名的文件类型
    	String controllerPackage = packageName + File.separator + "controller";
    	String entityPackage = packageName + File.separator + "entity";
    	String entityVoPackage = entityPackage + File.separator + "vo";
		String servicePackage = packageName + File.separator + "service";
		String serviceImplPackage = packageName + File.separator + "service" + File.separator + "impl";
		String mapperPackage = packageName + File.separator + "mappers";

		mRoot = new HashMap<String,Object>();
		mRoot.put("tables", tables);
		mRoot.put("packageName", packageName.replace(File.separator,"."));
		mRoot.put("controllerPackage", controllerPackage.replace(File.separator,"."));
		mRoot.put("entityPackage", entityPackage.replace(File.separator,"."));
		mRoot.put("entityVoPackage", entityVoPackage.replace(File.separator,"."));
		mRoot.put("servicePackage", servicePackage.replace(File.separator,"."));
		mRoot.put("serviceImplPackage", serviceImplPackage.replace(File.separator,"."));
		mRoot.put("mapperPackage", mapperPackage.replace(File.separator,"."));
		mRoot.put("nowDate", new Date());
		
		mTemplatePath = App.class.getClassLoader().getResource("template").getPath();
		String tableJavaName = null;
		
		for(Tables table : tables) {
			
			tableJavaName = mStringInstance.firstUpperCase(table.getJavaName());
			
			mRoot.put("table", table);
			
			try {
				//entity
				write("entity.ftl",entityPackage,tableJavaName + ".java");
				
				//entityVo
				write("entityVo.ftl",entityVoPackage,tableJavaName + "Vo.java");
				
				//controller
				write("controller.ftl",controllerPackage,tableJavaName + "Controller.java");
				
				//service
				write("service.ftl",servicePackage,tableJavaName + "Service.java");
				
				//serviceImpl
				write("service_impl.ftl",serviceImplPackage,tableJavaName + "ServiceImpl.java");
				
				//mapper
				write("mapper.ftl",mapperPackage,tableJavaName + "Mapper.java");
				
				//mapper.xml
				write("mapper_xml.ftl",mapperPackage,tableJavaName + "Mapper.xml");
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//FileUtil.getInstance().compressExe(FreemarkerUtil.getInstance().getParentPath(packageName), FreemarkerUtil.getInstance().getParentPath(packageName) + ".zip");
		LogUtil.i("全部完成");
    }
    
    private static void write(String ftlName,String packageName,String fileName) throws Exception {
    	mFreemarker.tempWriter(mTemplatePath, 
    			ftlName, packageName, fileName, mRoot);
    }
}
