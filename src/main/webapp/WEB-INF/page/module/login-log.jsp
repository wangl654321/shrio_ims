<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/global.jsp" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <title>用户登录日志</title>
    <%@include file="../common/meta.jsp" %>
    <%@include file="../common/assets-css.jsp" %>

    <!-- 页面特殊插件样式 -->
    <link rel="stylesheet" href="${path}/assets/css/jquery-ui.custom.min.css"/>
    <link rel="stylesheet" href="${path}/assets/css/chosen.min.css"/>
    <link rel="stylesheet" href="${path}/assets/css/bootstrap-datepicker3.min.css"/>
    <link rel="stylesheet" href="${path}/assets/css/bootstrap-timepicker.min.css"/>
    <link rel="stylesheet" href="${path}/assets/css/daterangepicker.min.css"/>
    <link rel="stylesheet" href="${path}/assets/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="${path}/assets/css/bootstrap-colorpicker.min.css"/>

    <!-- 这里是本页内联样式开始 -->
    <!-- 这里是本页内联样式结束 -->

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
                        <a href="#">用户登录日志</a>
                    </li>
                    <li class="active">用户登录日志列表</li>
                </ul><!-- /.breadcrumb -->

            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        用户登录日志
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            共${loginLogs.total}条日志信息&emsp;
                            <shiro:hasPermission name="loginLog:delete">
                                <button type="button" class="btn btn-warning btn-xs delete-query" data-toggle="modal"
                                        data-target="#delete-confirm-dialog">删除所选日志
                                </button>
                            </shiro:hasPermission>


                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="row">
                            <div class="col-xs-12">
                                <table id="simple-table" class="table  table-bordered table-hover log-list">
                                    <thead>
                                    <tr>
                                        <th class="center">
                                            <label class="pos-rel">
                                                <input type="checkbox" class="ace select-all-btn"/>
                                                <span class="lbl"></span>
                                            </label>
                                        </th>
                                        <th><i class="fa fa-id-card bigger-110 hidden-480"></i>ID</th>
                                        <th><i class="fa fa-user bigger-110 hidden-480"></i>用户名</th>
                                        <th><i class="fa fa-clock-o bigger-110 hidden-480"></i>登录时间</th>
                                        <th><i class="fa fa-location-arrow bigger-110 hidden-480"></i>登录IP</th>
                                        <th><i class="fa fa-tv bigger-110 hidden-480"></i>登录设备</th>
                                        <th><i class="fa fa-apple bigger-110 hidden-480"></i>操作系统</th>
                                        <th><i class="fa fa-edge bigger-110 hidden-480"></i>浏览器及版本</th>
                                        <th><i class="fa fa-cog fa-spin bigger-110 hidden-480"></i>操作</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <shiro:hasPermission name="loginLog:show">
                                        <c:forEach items="${loginLogs.list}" var="loginLog">
                                            <tr>
                                                <td class="center">
                                                    <label class="pos-rel">
                                                        <input type="checkbox" class="ace" name="logIds"
                                                               value="${loginLog.id}"/>
                                                        <span class="lbl"></span>
                                                    </label>
                                                </td>
                                                <td class="logId">${loginLog.id}</td>
                                                <td class="username">${loginLog.username}</td>
                                                <td class="time"><fmt:formatDate value="${loginLog.time}" type="both"
                                                                                 pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                <td class="ip">${loginLog.ip}</td>
                                                <td class="device">${loginLog.device}</td>
                                                <td class="os">${loginLog.os}</td>
                                                <td class="browser">${loginLog.browser}</td>
                                                <td>
                                                    <shiro:hasPermission name="loginLog:delete">
                                                        <div class="hidden-sm hidden-xs btn-group">
                                                            <button class="btn btn-xs btn-danger delete-this-log">
                                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                            </button>
                                                        </div>
                                                    </shiro:hasPermission>
                                                    <shiro:hasPermission name="loginLog:delete">
                                                        <div class="hidden-md hidden-lg">
                                                            <div class="inline pos-rel">
                                                                <button class="btn btn-xs btn-danger delete-this-log">
                                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </shiro:hasPermission>

                                                    <shiro:lacksPermission name="loginLog:delete">
                                                    <span class="label label-large label-grey arrowed-in-right arrowed-in">
                                                        <i class="ace-icon fa fa-lock" title="无权限"></i>
                                                    </span>
                                                    </shiro:lacksPermission>

                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </shiro:hasPermission>
                                    <shiro:lacksPermission name="loginLog:show">
                                        <td colspan="100">对不起，您无权限查看！</td>
                                    </shiro:lacksPermission>
                                    </tbody>
                                </table>
                            </div><!-- /.span -->
                        </div><!-- /.row -->

                        <%--分页--%>
                        <div class="row">
                            <div class="col-xs-12 col-md-6">
                                当前第${loginLogs.pageNum}页，共${loginLogs.pages}页，共${loginLogs.total}条记录
                            </div>
                            <div class="col-xs-12 col-md-6">
                                <nav aria-lable="Page navigation">
                                    <ul class="pagination">
                                        <c:choose>
                                            <c:when test="${loginLogs.hasPreviousPage}">
                                                <li><a href="${path}/loginLog/list?pageNum=1">首页</a></li>
                                                <li>
                                                    <a href="${path}/loginLog/list?pageNum=${loginLogs.pageNum-1}"
                                                       aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="disabled"><a href="javascript:void(0)">首页</a></li>
                                            </c:otherwise>
                                        </c:choose>

                                        <c:forEach items="${loginLogs.navigatepageNums }" var="page">
                                            <c:if test="${page==loginLogs.pageNum}">
                                                <li class="active"><a
                                                        href="${path}/loginLog/list?pageNum=${page}">${page}</a></li>
                                            </c:if>
                                            <c:if test="${page!=loginLogs.pageNum}">
                                                <li><a href="${path }/loginLog/list?pageNum=${page}">${page}</a></li>
                                            </c:if>
                                        </c:forEach>

                                        <c:choose>
                                            <c:when test="${loginLogs.hasNextPage }">
                                                <li>
                                                    <a href="${path }/loginLog/list?pageNum=${loginLogs.pageNum+1 }"
                                                       aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                                <li><a href="${path }/loginLog/list?pageNum=${loginLogs.pages}">末页</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="disabled"><a href="javascript:void(0)">末页</a></li>
                                            </c:otherwise>
                                        </c:choose>

                                    </ul>
                                </nav>
                            </div>
                        </div>


                        <%--<ul class="pagination">--%>
                        <%--<li><a href="${path}/loginLog/list?pageNum=1">首页</a></li>--%>
                        <%--<li><a href="${path}/loginLog/list?pageNum=${loginLogs.pageNum-1}">上一页</a></li>--%>
                        <%--<li class="active disabled"><a href="javascript:void(0);">第${loginLogs.pageNum}/${loginLogs.pages}页</a></li>--%>
                        <%--<li><a href="${path}/loginLog/list?pageNum=${loginLogs.pageNum+1}">下一页</a></li>--%>
                        <%--<li><a href="${path}/loginLog/list?pageNum=${loginLogs.pages}">末页</a></li>--%>
                        <%--</ul>--%>
                        <%--<p>--%>
                        <%--total:${loginLogs.total}<br>--%>
                        <%--size:${loginLogs.size}<br>--%>
                        <%--toString:${loginLogs.toString()}<br>--%>
                        <%--startRow:${loginLogs.startRow}<br>--%>
                        <%--endRow:${loginLogs.endRow}<br>--%>
                        <%--firstPage:${loginLogs.firstPage}<br>--%>
                        <%--lastPage:${loginLogs.lastPage}<br>--%>
                        <%--hasNextPage:${loginLogs.hasNextPage}<br>--%>
                        <%--hasPreviousPage:${loginLogs.hasPreviousPage}<br>--%>
                        <%--isFirstPage:${loginLogs.isFirstPage}<br>--%>
                        <%--isLastPage:${loginLogs.isLastPage}<br>--%>
                        <%--list:${loginLogs.list}<br>--%>
                        <%--navigateFirstPage:${loginLogs.navigateFirstPage}<br>--%>
                        <%--navigateLastPage:${loginLogs.navigateLastPage}<br>--%>
                        <%--navigatePages:${loginLogs.navigatePages}<br>--%>
                        <%--navigatepageNums:${loginLogs.navigatepageNums}<br>--%>
                        <%--nextPage:${loginLogs.nextPage}<br>--%>
                        <%--pageSize:${loginLogs.pageSize}<br>--%>
                        <%--pageNum:${loginLogs.pageNum}<br>--%>
                        <%--pages:${loginLogs.pages}<br>--%>
                        <%--</p>--%>

                        <!--  删除所选对话框 -->
                        <div class="modal fade " id="delete-confirm-dialog" tabindex="-1" role="dialog"
                             aria-labelledby="mySmallModalLabel">
                            <div class="modal-dialog modal-sm" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">警告</h4>
                                    </div>
                                    <div class="modal-body">
                                        确认删除所选日志吗？
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                        <button type="button" class="btn btn-primary delete-selected-confirm">确认
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 提示框 -->
                        <div class="modal fade" id="op-tips-dialog" tabindex="-1" role="dialog"
                             aria-labelledby="mySmallModalLabel">
                            <div class="modal-dialog modal-sm" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span class="close-tip" aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">提示信息</h4>
                                    </div>
                                    <div class="modal-body" id="op-tips-content">
                                    </div>
                                </div>
                            </div>
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
<script src="${path}/assets/js/jquery.dataTables.min.js"></script>
<script src="${path}/assets/js/jquery.dataTables.bootstrap.min.js"></script>
<script src="${path}/assets/js/dataTables.buttons.min.js"></script>
<script src="${path}/assets/js/buttons.flash.min.js"></script>
<script src="${path}/assets/js/buttons.html5.min.js"></script>
<script src="${path}/assets/js/buttons.print.min.js"></script>
<script src="${path}/assets/js/buttons.colVis.min.js"></script>
<script src="${path}/assets/js/dataTables.select.min.js"></script>

<!-- ace脚本 -->
<%@include file="../common/ace-scripts.jsp" %>

<!-- 与此页相关的内联脚本 -->
<script src="${path}/assets/custom-js/login-log.js"></script>

</body>
</html>
