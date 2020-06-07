<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>${ title }</title>
    <link rel="stylesheet" type="text/css" href="../resources/element-ui.css"/>
    <script type="text/javascript" src="../resources/AMEF.js"></script>
    <script type="text/javascript" src="../resources/vue.js"></script>
    <script type="text/javascript" src="../resources/vuex.js"></script>
    <script type="text/javascript" src="../resources/vue-router.js"></script>
    <script type="text/javascript" src="../resources/axios.min.js"></script>
    <script type="text/javascript" src="../resources/element-ui.js"></script>
    <script type="text/javascript" src="../resources/home/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="../resources/styles/index.css">
    <link rel="stylesheet" type="text/css" href="../resources/styles/normalize.css">
    <link rel="stylesheet" type="text/css" href="../resources/home/css/login.css">
</head>
<body>
<div id="app"></div>
<script type="text/javascript">
    function getBrowserInfo() {
        try {
            var Sys = {};
            var ua = navigator.userAgent.toLowerCase();
            var re = /(msie|trident|firefox|chrome|opera|version).*?([\d.]+)/;
            var m = ua.match(re);
            Sys.browser = m[1].replace(/version/, "'safari");
            Sys.ver = m[2];
            return Sys;
        } catch (e) {
        }
    }
    function checkBrowser() {
        var tmBrowser = getBrowserInfo();
        var isSupportedBrowser = false;
        if (tmBrowser) {
            if (tmBrowser.browser == "firefox" || tmBrowser.browser == "chrome") {
                isSupportedBrowser = true;
            }
        }
        if (!isSupportedBrowser) {
            layer.open({
                title: "浏览器提示",
                content: "为达到最佳使用效果，请使用Chrome、FireFox、或360极速浏览器访问系统。",
                btnAlign: "c"
            });
        }
    }
</script>
<script>
    (async function main() {
        await AMEF.import("../resources/icons/index.js");
        const m = await AMEF.import("../resources/home/Login.vue");
        const vm = new Vue({
            el: '#app',
            render: h => h(m.default)
        })
    })(); 
</script>

</body>
</html>