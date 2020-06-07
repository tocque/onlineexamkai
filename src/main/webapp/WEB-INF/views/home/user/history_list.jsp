<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
new Object({ history: [ <c:forEach items="${ historyList }" var="history"> { 
    name: '${ history.exam.name }', 
    totalTime: ${ history.exam.avaliableTime }, 
    useTime: ${ history.useTime }, 
    score: ${ history.score }, 
    startTime: '<fmt:formatDate value="${ history.startExamTime }" pattern="yyyy-MM-dd HH:mm:ss"/>',
    endTime: '<fmt:formatDate value="${ history.endExamTime }" pattern="yyyy-MM-dd HH:mm:ss"/>',
    passScore: ${ history.exam.passScore }, 
    totalScore: ${ history.exam.totalScore }, 
    id: ${ history.id },
    examId: ${ history.exam.id } 
}, </c:forEach>], page: ${ page } })
