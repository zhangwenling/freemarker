package ${table.basePackage}.entity.support;

import java.util.HashMap;
import java.util.Map;

/**
 * ${column.columnComments}
 *
 * @author ${table.author}
 * @date ${.now}
 */
public enum ${column.enumClassName} {

<#list column.enumList as being>
	${ being.enumName}(${ being.enumKey}, ${"\"" + being.enumValue + "\""})
	<#if being_has_next>,
	</#if>
 </#list>;
	
	${column.enumClassName}(Integer code, String value) {
		this.code = code;
		this.value = value;
	}
	
	private Integer code;
	private String value;
	
	public String getText() {
		return value;
	}

	public Integer getCode() {
		return code;
	}
	
	private static Map<Integer,${column.enumClassName}> MAPPING = new HashMap<Integer,${column.enumClassName}>();
	
	static {
		for (${column.enumClassName} model : ${column.enumClassName}.values()) {
			MAPPING.put(model.getCode(), model);
		}
	}
	
	public static ${column.enumClassName} forCode(int code) {
		return MAPPING.get(code);
	}
	
	public static ${column.enumClassName} forText(String text) {
		for (${column.enumClassName} model : ${column.enumClassName}.values()) {
			if (model.getText().equals(text)) {
				return model;
			}
		}
		return null;
	}
}
