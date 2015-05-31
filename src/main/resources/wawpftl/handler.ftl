package ${table.basePackage}.entity.handler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import ${table.basePackage}.entity.support.${column.enumClassName?cap_first};

/**
 * ${column.columnComments}
 *
 * @author ${table.author}
 * @date ${.now}
 */
 
public class ${column.enumClassName?cap_first}Handler extends BaseTypeHandler<${column.enumClassName?cap_first}> {

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i,
			${column.enumClassName?cap_first} parameter, JdbcType jdbcType) throws SQLException {
		ps.setInt(i, parameter.getCode());
	}

	@Override
	public ${column.enumClassName?cap_first} getNullableResult(ResultSet rs, String columnName)
			throws SQLException {
		int code = rs.getInt(columnName);
		return ${column.enumClassName?cap_first}.forCode(code);
	}

	@Override
	public ${column.enumClassName?cap_first} getNullableResult(ResultSet rs, int columnIndex)
			throws SQLException {
		return null;
	}

	@Override
	public ${column.enumClassName?cap_first} getNullableResult(CallableStatement cs, int columnIndex)
			throws SQLException {
		return null;
	}

}
