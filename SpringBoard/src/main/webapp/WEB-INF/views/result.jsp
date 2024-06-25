<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


${paramMap }
아이디 : ${paramMap.userid }<hr>
이름 : ${paramMap.username }<hr>

<c:forEach var="fileName" items="${paramMap.fileNameList }" varStatus="i">
<%-- 	${i.index }/${i.count }<hr> --%>
	<c:set var = "tmp" value="${fileName.substring(fileName.latsIndexOf('.')) }"/>

	파일 ${i.count} : <a href="/controller/download?fileName=${fileName }">${fileName }</a><hr>

	<c:if test="${tmp == '.png' }">
	<img src="/download?fileName=${fileName }"><hr>
	</c:if>
</c:forEach>


<%@ include file="include/footer.jsp" %>
