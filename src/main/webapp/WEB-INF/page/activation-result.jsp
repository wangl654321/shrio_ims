<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/global.jsp" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <title>激活结果-${title}</title>
    <%@include file="common/meta.jsp" %>
    <link rel="stylesheet" href="${path}/resource/static/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${path}/resource/static/font-awesome/css/font-awesome.min.css" />
    <style type="text/css">
    *{
        margin: 0;
        padding: 0;
    }

    body, html{
        height: 100%;
    }

    .container{
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100%;
    }

    .container div{
        max-width: 50%;
        padding: 30px 130px 50px 130px;
    }
    </style>

</head>

<body>

<div class="container">
    <%--下面元素将居中显示--%>
    <c:if test="${activationResult eq '帐号激活成功'}">
        <div class="alert alert-success text-center">
            <h3><b>
                恭喜你</b>
            </h3>
            <p>&emsp;</p>
            <h4>${activationResult}</h4>
            <p>&emsp;</p><br>
            <a href="${path}"><button type="button" class="btn btn-default btn-success">返回登录</button></a>
        </div>
    </c:if>
    <c:if test="${activationResult eq '激活链接不正确'}">
        <div class="alert alert-danger text-center">
            <h3><b>
                对不起</b>
            </h3>
            <p>&emsp;</p>
            <h4>${activationResult}</h4>
            <p>&emsp;</p><br>
            <a href="${path}"><button type="button" class="btn btn-default btn-danger">返&emsp;回</button></a>
        </div>
    </c:if>
    <c:if test="${activationResult eq '激活链接已过期'}">
        <div class="alert alert-danger text-center">
            <h3><b>
                对不起</b>
            </h3>
            <p>&emsp;</p>
            <h4>${activationResult}</h4>
            <p>&emsp;</p><br>
            <a href="${path}"><button type="button" class="btn btn-default btn-danger">返&emsp;回</button></a>
        </div>
    </c:if>
    <c:if test="${activationResult eq '帐户已是激活状态，请直接登录'}">
        <div class="alert alert-warning text-center">
            <h3><b>
                您好</b>
            </h3>
            <p>&emsp;</p>
            <h4>${activationResult}</h4>
            <p>&emsp;</p><br>
            <a href="${path}"><button type="button" class="btn btn-default btn-warning">返回登录</button></a>
        </div>
    </c:if>
    <c:if test="${activationResult eq '激活链接已失效'}">
        <div class="alert alert-danger text-center">
            <h3><b>
                对不起</b>
            </h3>
            <p>&emsp;</p>
            <h4>${activationResult}</h4>
            <p>&emsp;</p><br>
            <a href="${path}"><button type="button" class="btn btn-default btn-danger">返&emsp;回</button></a>
        </div>
    </c:if>

</div>
</body>
</html>
