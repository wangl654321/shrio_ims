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
                        <i class="ace-icon fa fa-wrench"></i>
                        <a href="#">正在建设中...</a>
                    </li>

                </ul><!-- /.breadcrumb -->

            </div>

            <div class="page-content">

                <div class="page-header">
                    <h1>
                        该模块正在建设中
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            系统时间:<%@include file="time.jsp" %>
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12 show-info">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="alert alert-block alert-danger welcome-div">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>
                            <i class="ace-icon fa fa-wrench red2"></i>
                            该模块正在建设中，敬请期待！

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
<script src="${path}/assets/custom-js/main.js"></script>

</body>
</html>
