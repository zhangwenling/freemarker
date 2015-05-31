package com.knet.gen.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;

import com.knet.core.Applications;
import com.knet.gen.entity.ColumnEntity;
import com.knet.gen.entity.TableEntity;
import com.knet.gen.service.GenService;
import com.knet.utils.EntityUtils;
import com.knet.utils.FreeMarkers;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class GenAction {

	public static final String ROOTPATH = Applications.get("root.path");

	public static void logger(String log) {
		System.out.println(log);
	}

	public static void genJava(TableEntity tableEntity, String packageName, String ftlName) throws IOException {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("table", tableEntity);
		String dirPath = tableEntity.getBasePackage().replaceAll("\\.", "\\\\") + File.separator + packageName;
		String fileName = StringUtils.capitalize(tableEntity.getShortTableName()) + StringUtils.capitalize(ftlName.split("\\.")[0]) + ".java";
		
		if("entity".equals(packageName)){
			fileName = StringUtils.capitalize(tableEntity.getShortTableName()) + ".java";
		}
		saveFile(model, dirPath, fileName, ftlName);
	}

	public static void genMapper(TableEntity tableEntity, String packageName, String ftlName) throws IOException {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("table", tableEntity);
		String dirPath = "biz" + File.separator + Applications.get("base.subpackage") + packageName;
		String fileName = StringUtils.capitalize(tableEntity.getShortTableName()) + ".xml";
		saveFile(model, dirPath, fileName, ftlName);
	}

	public static void genSupport(TableEntity tableEntity, String packageName, String ftlName) throws IOException {

		String dirPath = tableEntity.getBasePackage().replaceAll("\\.", "\\\\") + File.separator + packageName;
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("table", tableEntity);

		for (ColumnEntity columnEntity : tableEntity.getColumnList()) {
			if (!columnEntity.getIsEnum() || "STATE".equalsIgnoreCase(columnEntity.getColumnName())) {
				continue;
			}
			String fileName = StringUtils.capitalize(columnEntity.getEnumClassName()) + ".java";
			model.put("column", columnEntity);
			saveFile(model, dirPath, fileName, ftlName);
		}
	}
	
	public static void genHandler(TableEntity tableEntity, String packageName, String ftlName) throws IOException {
		
		String dirPath = tableEntity.getBasePackage().replaceAll("\\.", "\\\\") + File.separator + packageName;
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("table", tableEntity);
		
		for (ColumnEntity columnEntity : tableEntity.getColumnList()) {
			if (!columnEntity.getIsEnum() || "STATE".equalsIgnoreCase(columnEntity.getColumnName())) {
				continue;
			}
			String fileName = StringUtils.capitalize(columnEntity.getEnumClassName() + "Handler") + ".java";
			model.put("column", columnEntity);
			saveFile(model, dirPath, fileName, ftlName);
		}
	}

	public static void saveFile(Map<String, Object> model, String dirPath, String fileName, String ftlName) throws IOException {

		Configuration cfg = FreeMarkers.buildConfiguration("classpath:" + Applications.get("ftl.path"));
		Template template = cfg.getTemplate(ftlName);
		String result = FreeMarkers.renderTemplate(template, model);

		String dirName = ROOTPATH + File.separator + dirPath;
		File dir = new File(dirName);
		dir.mkdirs();
		String pathname = dirName + File.separator + fileName;
		File file = new File(pathname);
		file.createNewFile();
		IOUtils.write(result, new FileOutputStream(file));
		logger("创建文件：" + pathname);

	}
	
	public static void genTypeAlias(TableEntity tableEntity, String fileName, String ftlName) throws IOException {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("table", tableEntity);
		
		Configuration cfg = FreeMarkers.buildConfiguration("classpath:" + Applications.get("ftl.path"));
		Template template = cfg.getTemplate(ftlName);
		String result = FreeMarkers.renderTemplate(template, model);

		String dirName = ROOTPATH + File.separator + fileName;
		File file = new File(dirName);
		if(!file.exists()){
			file.createNewFile();
		}
		IOUtils.write(result + "\r\n", new FileOutputStream(file, true));
		logger("更新文件：" + dirName);

	}

	public static void gen(String tableName, String author) throws IOException {
		GenService TableService = new GenService();
		TableEntity tableEntity = new TableEntity();
		TableService.getTableComments(tableEntity, tableName);
		TableService.getTableColumnsMeta(tableEntity, tableName);
		tableEntity.setSubPackage(Applications.get("base.subpackage"));
		tableEntity.setAuthor(author);

		genMapper(tableEntity, File.separator + "mapper", "entityMapper.ftl");
		genMapper(tableEntity, "", "curdMapper.ftl");
		
		genJava(tableEntity, "entity", "entity.ftl");
		genJava(tableEntity, "repository", "dao.ftl");
		genJava(tableEntity, "service", "service.ftl");
		genJava(tableEntity, "action", "action.ftl");

		genSupport(tableEntity, "entity" + File.separator + "support", "support.ftl");
		genHandler(tableEntity, "entity" + File.separator + "handler", "handler.ftl");

		genTypeAlias(tableEntity, "typeAlias.xml", "typeAlias.ftl");
	}
}
