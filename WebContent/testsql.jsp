<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<sql:setDataSource var="fdb" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
     url="jdbc:sqlserver://localhost:1433;DatabaseName=HOUSEDB"
     user="blueteam"  password="houseproject"/>

<sql:query dataSource="${fdb}" var="result">
SELECT count(*) from favorite where fid=15;
</sql:query>
</head>
<body>
<table border="1" width="100%">
<tr>
<th>favorite ID</th>
<th>house id</th>
<th>member id</th>
<th>test find </th>

</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
<td><c:out value="${row.fid}"/></td>
<td><c:out value="${row.houseid}"/></td>
<td><c:out value="${row.accountid}"/></td>
<TD><c:out value="${row.favorite.houseBean.title}" /></TD>

</tr>
</c:forEach>
</table>
</body>
</html>