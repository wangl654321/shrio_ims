<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/global.jsp" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <title>角色管理</title>
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
    <link rel="stylesheet" href="${path}/resource/static/ztree/ztree.css"/>


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
                        <a href="#">角色管理</a>
                    </li>
                    <li class="active">角色列表</li>
                </ul><!-- /.breadcrumb -->

            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        角色管理
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            共${roles.total}种角色&emsp;
                            <shiro:hasPermission name="role:delete">
                                <button type="button" class="btn btn-warning btn-xs delete-query" data-toggle="modal"
                                        data-target="#delete-confirm-dialog">删除所选角色
                                </button>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="role:add">
                                <button type="button" class="btn btn-primary btn-xs show-add-form" data-toggle="modal"
                                        data-target="#role-form-div">添加新角色
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
                                <table id="simple-table" class="table  table-bordered table-hover role-list">
                                    <thead>
                                    <tr>
                                        <th class="center">
                                            <label class="pos-rel">
                                                <input type="checkbox" class="ace select-all-btn"/>
                                                <span class="lbl"></span>
                                            </label>
                                        </th>
                                        <th><i class="fa fa-id-card bigger-110 hidden-480"></i>ID</th>
                                        <th><i class="fa fa-envira bigger-110 hidden-480"></i>角色名称</th>
                                        <th><i class="fa fa-user-circle-o bigger-110 hidden-480"></i>角色描述</th>
                                        <th><i class="fa fa-key bigger-110 hidden-480"></i>角色代码</th>
                                        <th><i class="fa fa-unlock bigger-110 hidden-480"></i>角色权限</th>
                                        <th><i class="fa fa-cog fa-spin bigger-110 hidden-480"></i>操作</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <shiro:hasPermission name="role:show">
                                        <c:forEach items="${roles.list}" var="role">
                                            <tr>
                                                <td class="center">
                                                    <label class="pos-rel">
                                                        <input type="checkbox" class="ace" name="roleIds"
                                                               value="${role.id}"/>
                                                        <span class="lbl"></span>
                                                    </label>
                                                </td>
                                                <td class="roleId">${role.id}</td>
                                                <td class="name">${role.name}</td>
                                                <td class="description">${role.description}</td>
                                                <td class="code">${role.code}</td>
                                                <td><a href="javascript:void(0);" class="show-role-perms">点击查看</a></td>
                                                <td>
                                                    <div class="hidden-sm hidden-xs btn-group">
                                                        <shiro:hasPermission name="role:update">
                                                            <button class="btn btn-xs btn-info show-update-form"
                                                                    data-toggle="modal" data-target="#role-form-div">
                                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                            </button>
                                                        </shiro:hasPermission>
                                                        <shiro:hasPermission name="role:delete">
                                                            <c:if test="${role.name ne '超级管理员'}">
                                                                <button class="btn btn-xs btn-danger delete-this-role">
                                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                                </button>
                                                            </c:if>
                                                        </shiro:hasPermission>

                                                        <shiro:lacksPermission name="role:update">
                                                            <shiro:lacksPermission name="role:delete">
                                                    <span class="label label-large label-grey arrowed-in-right arrowed-in">
                                                        <i class="ace-icon fa fa-lock" title="无权限"></i>
                                                    </span>
                                                            </shiro:lacksPermission>
                                                        </shiro:lacksPermission>

                                                    </div>
                                                    <div class="hidden-md hidden-lg">
                                                        <div class="inline pos-rel">
                                                            <customTag:hasAnyPermissions
                                                                    name="role:update,role:delete">
                                                                <button class="btn btn-minier btn-primary dropdown-toggle"
                                                                        data-toggle="dropdown" data-position="auto">
                                                                    <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                                                                </button>
                                                            </customTag:hasAnyPermissions>
                                                            <shiro:lacksPermission name="role:update">
                                                                <shiro:lacksPermission name="role:delete">
                                                    <span class="label label-large label-grey arrowed-in-right arrowed-in">
                                                        <i class="ace-icon fa fa-lock" title="无权限"></i>
                                                    </span>
                                                                </shiro:lacksPermission>
                                                            </shiro:lacksPermission>

                                                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                                <shiro:hasPermission name="role:update">
                                                                    <li>
                                                                        <a href="javascript:void(0);"
                                                                           class="tooltip-success show-update-form"
                                                                           data-toggle="modal"
                                                                           data-target="#role-form-div"
                                                                           data-rel="tooltip" title="编辑">
																			<span class="green">
																				<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																			</span>
                                                                        </a>
                                                                    </li>
                                                                </shiro:hasPermission>
                                                                <shiro:hasPermission name="role:delete">
                                                                    <c:if test="${role.name ne '超级管理员'}">
                                                                        <li>
                                                                            <a href="javascript:void(0);"
                                                                               class="tooltip-error delete-this-role"
                                                                               data-rel="tooltip" title="删除">
																			<span class="red">
																				<i class="ace-icon fa fa-trash-o bigger-120"></i>
																			</span>
                                                                            </a>
                                                                        </li>
                                                                    </c:if>
                                                                </shiro:hasPermission>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </shiro:hasPermission>
                                    <shiro:lacksPermission name="role:show">
                                        <td colspan="100">对不起，您无权限查看！</td>
                                    </shiro:lacksPermission>
                                    </tbody>
                                </table>
                            </div><!-- /.span -->
                        </div><!-- /.row -->

                        <%--分页--%>
                        <div class="row">
                            <div class="col-xs-12 col-md-6">
                                当前第${roles.pageNum}页，共${roles.pages}页，共${roles.total}条记录
                            </div>
                            <div class="col-xs-12 col-md-6">
                                <nav aria-lable="Page navigation">
                                    <ul class="pagination">
                                        <c:choose>
                                            <c:when test="${roles.hasPreviousPage}">
                                                <li><a href="${path}/role/list?pageNum=1">首页</a></li>
                                                <li>
                                                    <a href="${path}/role/list?pageNum=${roles.pageNum-1}"
                                                       aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="disabled"><a href="javascript:void(0)">首页</a></li>
                                            </c:otherwise>
                                        </c:choose>

                                        <c:forEach items="${roles.navigatepageNums }" var="page">
                                            <c:if test="${page==roles.pageNum}">
                                                <li class="active"><a
                                                        href="${path}/role/list?pageNum=${page}">${page}</a></li>
                                            </c:if>
                                            <c:if test="${page!=roles.pageNum}">
                                                <li><a href="${path }/role/list?pageNum=${page}">${page}</a></li>
                                            </c:if>
                                        </c:forEach>

                                        <c:choose>
                                            <c:when test="${roles.hasNextPage }">
                                                <li>
                                                    <a href="${path }/role/list?pageNum=${roles.pageNum+1 }"
                                                       aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                                <li><a href="${path }/role/list?pageNum=${roles.pages}">末页</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="disabled"><a href="javascript:void(0)">末页</a></li>
                                            </c:otherwise>
                                        </c:choose>

                                    </ul>
                                </nav>
                            </div>
                        </div>

                        <!--添加、更新角色表单（二合一）-->
                        <div class="modal fade" id="role-form-div" tabindex="-1" role="dialog"
                             aria-labelledby="mySmallModalLabel">
                            <div class="modal-dialog modal-md" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="blue bigger role-form-title"></h4>
                                    </div>
                                    <form id="role-form" name="role-form" class="role-form">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6">
                                                    <input type="hidden" name="id" class="form-control" id="idInput">
                                                    <div class="form-group">
                                                        <label for="nameInput">角色名称<span
                                                                style="color:#F00">*</span></label>
                                                        <div>
                                                            <input type="text" id="nameInput" name="name"
                                                                   placeholder="角色名称"/>
                                                        </div>
                                                        <label for="descriptionInput">角色描述<span
                                                                style="color:#F00">*</span></label>
                                                        <div>
                                                            <input type="text" id="descriptionInput" name="description"
                                                                   placeholder="角色描述"/>
                                                        </div>
                                                        <label for="codeInput">角色代码<span
                                                                style="color:#F00">*</span></label>
                                                        <div>
                                                            <input type="text" id="codeInput" name="code"
                                                                   placeholder="示例:userAdmin"/>
                                                        </div>


                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-6">
                                                    <div class="form-group">
                                                        <label>设置权限</label>
                                                        <div class="row">
                                                            <div class="col-xs-8 col-sm-11">
                                                                <ul id="permTree" class="ztree"></ul>
                                                            </div>
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="modal-footer">
                                        <button class="btn btn-sm" data-dismiss="modal" type="submit"><i
                                                class="ace-icon fa fa-times"></i>取消
                                        </button>
                                        <button type="button" class="btn btn-sm btn-primary role-submit"></button>
                                    </div>
                                </div>

                            </div>
                        </div>


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
                                        确认删除所选角色吗？
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

<script src="${path}/assets/js/jquery-ui.custom.min.js"></script>
<script src="${path}/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="${path}/assets/js/chosen.jquery.min.js"></script>
<script src="${path}/assets/js/spinbox.min.js"></script>
<script src="${path}/assets/js/moment.min.js"></script>
<script src="${path}/assets/js/jquery.knob.min.js"></script>
<script src="${path}/assets/js/autosize.min.js"></script>
<script src="${path}/assets/js/bootstrap-tag.min.js"></script>

<script type="text/javascript" src="${path}/resource/static/ztree/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${path}/resource/static/ztree/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="${path}/resource/static/ztree/jquery.ztree.exedit.js"></script>

<!-- ace脚本 -->
<%@include file="../common/ace-scripts.jsp" %>

<!-- 与此页相关的内联脚本 -->
<script src="${path}/assets/custom-js/role-list.js"></script>
</body>
</html>
