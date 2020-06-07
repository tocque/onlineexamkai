<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>${ title }</title>
    <link rel="stylesheet" type="text/css" href="../../resources/element-ui.css"/>
    <link rel="stylesheet" type="text/css" href="../../resources/styles/normalize.css">
    <script type="text/javascript" src="../../resources/AMEF.js"></script>
    <script type="text/javascript" src="../../resources/vue.js"></script>
    <script type="text/javascript" src="../../resources/element-ui.js"></script>
</head>
<body>
<template id="examinfo">
    new Object({
        title: "${ title }",
        singleQuestion: {
            num: ${ exam.singleQuestionNum },
            score: ${ singleScore },
            questions: [<c:forEach items="${ singleQuestionList }" var="sq" varStatus="sqids">
                {
                    id: ${ sq.id },
                    qid: ${ sq.question.id },
                    score: ${ sq.question.score },
                    title: "${ sq.question.title }",
                    answer: "${ sq.question.answer }",
                    selection: [
                        "${ sq.question.attrA }",
                        "${ sq.question.attrB }",
                        "${ sq.question.attrC }",
                        "${ sq.question.attrD }",
                    ],
                    choice: "${ sq.answer }",
                }
            </c:forEach>]
        },
        multiQuestion: {
            num: ${ exam.multiQuestionNum },
            score: ${ multiScore },
            questions: [<c:forEach items="${ multiQuestionList }" var="mq" varStatus="mqids">
                {
                    id: ${ mq.id },
                    qid: ${ mq.question.id },
                    score: ${ mq.question.score },
                    title: "${ mq.question.title }",
                    answer: "${ mq.question.answer }",
                    selection: [
                        "${ mq.question.attrA }",
                        "${ mq.question.attrB }",
                        "${ mq.question.attrC }",
                        "${ mq.question.attrD }",
                    ],
                    choice: "${ sq.answer }",
                }
            </c:forEach>]
        },
        chargeQuestion: {
            num: ${ exam.chargeQuestionNum },
            score: ${ chargeScore },
            questions: [<c:forEach items="${ chargeQuestionList }" var="cq" varStatus="cqids">
                {
                    id: ${ cq.id },
                    qid: ${ cq.question.id },
                    score: ${ cq.question.score },
                    title: "${ cq.question.title }",
                    answer: "${ cq.question.answer }",
                    selection: [
                        "${ cq.question.attrA }",
                        "${ cq.question.attrB }",
                    ],
                    choice: "${ cq.answer }",
                }
            </c:forEach>]
        },
    })
</template>
<div id="app"></div>
<script>
    window.examinfo = eval(document.getElementById("examinfo").content.firstChild.wholeText);
    window.type === "review";
    AMEF.import("../../resources/home/Exam.vue").then((m) => {
        const vm = new Vue({
            el: '#app',
            render: h => h(m.default)
        })
    })
</script>
</body>
</html>