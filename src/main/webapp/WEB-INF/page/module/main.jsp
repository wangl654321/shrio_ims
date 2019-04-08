<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/global.jsp" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <title></title>
    <%@include file="../common/meta.jsp" %>
    <%@include file="../common/assets-css.jsp" %>
    <%@include file="../common/assets-js.jsp" %>
</head>

<body class="no-skin">
<%--top导航栏--%>

<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.loadState('main-container')
        } catch (e) {
        }
    </script>


    <%--main-content内容--%>
    <div class="main-content">


        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state breadcrumbs-fixed" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">首页</a>
                    </li>
                    <li class="active">控制台</li>
                </ul><!-- /.breadcrumb -->

            </div>

            <div class="page-content">

                <div class="page-header">
                    <h1>
                        首页
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            系统时间:
                            <%@include file="time.jsp" %>
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12 show-info">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="alert alert-block alert-success welcome-div">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>
                            <i class="ace-icon fa fa-check green"></i>
                            欢迎使用
                            <strong class="green">
                                ${title}
                                <small>(v1.1)</small>
                            </strong>,
                            采用Spring MVC+Mybatis+Shiro等技术进行开发。东云工作室版权所有，模板可在<a href="http://www.pydyun.com"
                                                                               target="_blank">东云网</a>下载。
                        </div>
                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <%--footer部分--%>
    <%@include file="../common/footer.jsp" %>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<!-- 基本脚本 -->
<%@include file="../common/basic-scripts.jsp" %>

<!-- 页面特殊插件脚本 -->


<!-- ace脚本 -->
<%@include file="../common/ace-scripts.jsp" %>

<!-- 与此页相关的内联脚本 -->

<script type="text/javascript">
    // 根据用户名获取相应角色
    function getRolesByUsername(username, doSuccess) {
        $.ajax({
            url: "${path}/user/checkRoles",
            data: {username: username},
            type: "POST",
            dataType: "text",
            success: function (data) {
                doSuccess(data);
            }
        });
    }

    // 根据是否有权限，显示红色提示文本
    $(function () {
        var noRoleDiv =
            '<div class="alert alert-block alert-danger no-role-div">' +
            '<button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button>' +
            '<i class="ace-icon fa fa-exclamation-triangle light-red"></i>' +
            '注意：您没有相应角色及权限，请及时联系管理员开通权限！' +
            '</div>';
        var shiroUsername = "<shiro:principal/>";
        getRolesByUsername(shiroUsername, function (data) {
            if (data === "0") {
                $(".show-info").append(noRoleDiv);
            } else if (data === "1") {
            }
        });
    });
</script>
</body>
</html>
