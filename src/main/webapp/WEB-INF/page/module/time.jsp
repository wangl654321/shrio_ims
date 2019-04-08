<%@ page import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <title>服务器时间</title>
</head>
<body>
<%
    Calendar rightNow = Calendar.getInstance();
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<script language="javascript">
    //从服务器上获取初始时间
    var currentDate = new Date(<%=new java.util.Date().getTime()%>);
    function run() {
        currentDate.setSeconds(currentDate.getSeconds() + 1);
        var time = "";
        var year = currentDate.getFullYear();
        var month = currentDate.getMonth() + 1;
        var day = currentDate.getDate();
        var hour = currentDate.getHours();
        var minute = currentDate.getMinutes();
        var second = currentDate.getSeconds();
        if (hour < 10) {
            time += "0" + hour;
        } else {
            time += hour;
        }
        time += ":";
        if (minute < 10) {
            time += "0" + minute;
        } else {
            time += minute;
        }
        time += ":";
        if (second < 10) {
            time += "0" + second;
        } else {
            time += second;
        }
        document.getElementById("dt").innerHTML = year + "年" + month + "月" + day + "日" + time;
    }

    window.setInterval("run();", 1000);
</script>
<span id="dt"></span>
</body>
</html>