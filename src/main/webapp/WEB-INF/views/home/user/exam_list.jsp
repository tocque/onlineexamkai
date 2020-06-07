<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
new Object({
    exam: [<c:forEach items="${ examList }" var="exam"><c:if test="${ nowTime < exam.endTime.time }">
        {
            name: '${ exam.name }', 
            totalTime: ${ exam.avaliableTime },
            startTime: '<fmt:formatDate value="${ exam.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/>',
            endTime: '<fmt:formatDate value="${ exam.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/>',
            passScore: ${ exam.passScore }, 
            totalScore: ${ exam.totalScore }, 
            id: ${ exam.id }
        },</c:if></c:forEach>],
    page: ${ page }
})