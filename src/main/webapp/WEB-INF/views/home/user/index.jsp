<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>${ title }</title>
    <link rel="stylesheet" type="text/css" href="${ APP_PATH }/resources/element-ui.css"/>
    <link rel="stylesheet" type="text/css" href="${ APP_PATH }/resources/styles/index.css">
    <link rel="stylesheet" type="text/css" href="${ APP_PATH }/resources/styles/normalize.css">
    <link rel="stylesheet" type="text/css" href="${ APP_PATH }/resources/home/css/user.css">
    <script type="text/javascript" src="${ APP_PATH }/resources/AMEF.js"></script>
    <script type="text/javascript" src="${ APP_PATH }/resources/vue.js"></script>
    <script type="text/javascript" src="${ APP_PATH }/resources/vuex.js"></script>
    <script type="text/javascript" src="${ APP_PATH }/resources/vue-router.js"></script>
    <script type="text/javascript" src="${ APP_PATH }/resources/axios.min.js"></script>
    <script type="text/javascript" src="${ APP_PATH }/resources/npm/path-to-regexp.js"></script>
    <script type="text/javascript" src="${ APP_PATH }/resources/element-ui.js"></script>
</head>
<body>
<div id="app"></div>

<script>
    window.roles = ["学生"];
	window.APP_PATH = "../..";
    (async function main() {
        const [store, router] = await Promise.all([
            AMEF.import("../../resources/home/store.js").then(m => m.default),
            AMEF.import("../../resources/router/index.js").then(m => m.default),
            AMEF.import("../../resources/icons/index.js"),
        ]);
        const [user, permission] = await Promise.all([
            AMEF.import("../../resources/home/stores/user.js").then(m => m.default),
            AMEF.import("../../resources/home/stores/permission.js").then(m => m.default),
            AMEF.import("../../resources/permission.js").then(m => m.default),
        ]); 
        store.registerModule("user", user);
        store.registerModule("permission", permission);
        const vm = new Vue({
            store,
            router,
            template: /* HTML */`
            <div id="app">
                <router-view></router-view>
            </div>
            `,
            el: '#app',
        });
    })(); 
</script>
</body>
</html>