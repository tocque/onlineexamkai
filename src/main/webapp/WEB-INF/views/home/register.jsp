<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[<c:forEach items="${ subjectList }" var="subject">
    { id: ${ subject.id }, name: '${ subject.name }' },
</c:forEach>]