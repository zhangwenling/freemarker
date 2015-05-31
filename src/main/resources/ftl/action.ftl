package ${table.basePackage}.action;

import static cn.wkey.framework.web.ApiResponstUtils.writeResponse;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.wkey.framework.action.SuperWebAction;
import cn.wkey.framework.entity.ApiCode;
import cn.wkey.framework.entity.ApiConstant;
import cn.wkey.framework.entity.support.YesOrNo;
import cn.wkey.framework.exception.ApiRunException;
import cn.wkey.framework.web.DataContent;
import ${table.basePackage}.entity.${table.shortTableName?cap_first};
import ${table.basePackage}.service.${table.shortTableName?cap_first}Service;

/**
 * ${table.shortTableName?cap_first}Action
 * 
 * @author ${table.author}
 * @date ${.now}
 */
@Controller
@RequestMapping(value = "/base/dept")
public class ${table.shortTableName?cap_first}Action extends SuperWebAction {

	/**
	 * 服务对象
	 * 
	 * @author 填写
	 */
	@Resource
	private ${table.shortTableName?cap_first}Service ${table.shortTableName}Service;

	/**
	 * 查询
	 * 
	 * @author 填写
	 * @param dataContent
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/read.html", method = RequestMethod.POST)
	public void read(HttpServletRequest request, HttpServletResponse response) {
		Long businessId = currentUser(request, response).getId();
		if (null == businessId) {
			throw new ApiRunException(ApiCode.DataError);
		}
		DataContent dc = DataContent.newInstance(request);
		Map<String, Object> whereMap = dc.getWhereMap();
		whereMap.put("businessId", businessId);
		${table.shortTableName?cap_first} ${table.shortTableName} = ${table.shortTableName}Service.read(whereMap);
		writeResponse(request, response, ${table.shortTableName});
	}

	/**
	 * 分页
	 * 
	 * @author 填写
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/list.html", method = RequestMethod.POST)
	public void list(HttpServletRequest request, HttpServletResponse response) {
		Long businessId = currentUser(request, response).getId();
		if (null == businessId) {
			throw new ApiRunException(ApiCode.DataError);
		}
		DataContent dc = DataContent.newInstance(request);
		Map<String, Object> whereMap = dc.getWhereMap();
		whereMap.put("businessId", businessId);

		Integer selectPage = dc.getInt(ApiConstant.PAGE_INDEX);
		Integer pageSize = dc.getInt(ApiConstant.PAGE_SIZE);

		Object pagerVO = ${table.shortTableName}Service.page(whereMap,
				dc.getSortColumnMap(), selectPage, pageSize);
		writeResponse(request, response, pagerVO);
	}

	/**
	 * 新增
	 * 
	 * @author 填写
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/add.html", method = RequestMethod.POST)
	public void add(HttpServletRequest request, HttpServletResponse response) {
		DataContent dc = DataContent.newInstance(request);
		${table.shortTableName?cap_first} ${table.shortTableName} = dc.getEntity(${table.shortTableName?cap_first}.class);
		Long businessId = currentUser(request, response).getId();
		if (null == businessId) {
			throw new ApiRunException(ApiCode.DataError);
		}
		${table.shortTableName}.setBusinessId(businessId);
		Date date = new Date();
		${table.shortTableName}.setCreateDate(date);
		${table.shortTableName}.setUpdateDate(date);
		${table.shortTableName}.setState(YesOrNo.No);
		${table.shortTableName}Service.add(${table.shortTableName});
		Map<String, Object> map = new HashMap<String, Object>(1);
		map.put("id", ${table.shortTableName}.getId());
		writeResponse(request, response, map);
	}

	/**
	 * 删除
	 * 
	 * @author 填写
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/delete.html", method = RequestMethod.POST)
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		Long businessId = currentUser(request, response).getId();
		if (null == businessId) {
			throw new ApiRunException(ApiCode.DataError);
		}
		DataContent dc = DataContent.newInstance(request);
		Map<String, Object> whereMap = dc.getWhereMap();
		whereMap.put("businessId", businessId);
		List<Object> idList = dc.getList(whereMap, "id");
		if (null != idList && idList.size() > 0) {
			whereMap.remove("id");
			whereMap.put("idList", idList);
		}

		final int result = ${table.shortTableName}Service.delete(whereMap);
		Map<String, Object> map = new HashMap<String, Object>() {
			private static final long serialVersionUID = 1L;
			{
				put("resultCount", result);
			}
		};
		writeResponse(request, response, map);
	}

	/**
	 * 更新
	 * 
	 * @author 填写
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/update.html", method = RequestMethod.POST)
	public void update(HttpServletRequest request, HttpServletResponse response) {
		Long businessId = currentUser(request, response).getId();
		if (null == businessId) {
			throw new ApiRunException(ApiCode.DataError);
		}
		DataContent dc = DataContent.newInstance(request);
		Map<String, Object> whereMap = dc.getWhereMap();
		whereMap.put("businessId", businessId);
		List<Object> idList = dc.getList(whereMap, "id");
		if (null != idList && idList.size() > 0) {
			whereMap.remove("id");
			whereMap.put("idList", idList);
		}

		final int result = ${table.shortTableName}Service.update(whereMap,
				dc.getUpdateMap());
		Map<String, Object> map = new HashMap<String, Object>() {
			private static final long serialVersionUID = 1L;
			{
				put("resultCount", result);
			}
		};
		writeResponse(request, response, map);
	}

}
