<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/global.jsp" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <title>菜单及权限管理</title>
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
                        <a href="#">菜单及权限管理</a>
                    </li>
                    <li class="active">菜单及权限列表</li>
                </ul><!-- /.breadcrumb -->

            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        菜单及权限管理
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            共${perms.total}条菜单与权限&emsp;
                            <shiro:hasPermission name="perm:delete">
                                <button type="button" class="btn btn-warning btn-xs delete-query" data-toggle="modal"
                                        data-target="#delete-confirm-dialog">删除所选权限
                                </button>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="perm:add">
                                <button type="button" class="btn btn-primary btn-xs show-add-form" data-toggle="modal"
                                        data-target="#perm-form-div">添加新权限
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
                                <table id="simple-table" class="table  table-bordered table-hover perm-list">
                                    <thead>
                                    <tr>
                                        <th class="center">
                                            <label class="pos-rel">
                                                <input type="checkbox" class="ace select-all-btn"/>
                                                <span class="lbl"></span>
                                            </label>
                                        </th>
                                        <th><i class="fa fa-id-card bigger-110 hidden-480"></i>ID</th>
                                        <th><i class="fa fa-envira bigger-110 hidden-480"></i>名称</th>
                                        <th><i class="fa fa-edge bigger-110 hidden-480"></i>URL</th>
                                        <th><i class="fa fa-key bigger-110 hidden-480"></i>权限代码</th>
                                        <th><i class="fa fa-location-arrow bigger-110 hidden-480"></i>导航节点</th>
                                        <th><i class="fa fa-sort-numeric-asc bigger-110 hidden-480"></i>优先级</th>
                                        <th><i class="fa fa-picture-o bigger-110 hidden-480"></i>图标</th>
                                        <th><i class="fa fa-paper-plane bigger-110 hidden-480"></i>父节点</th>
                                        <th><i class="fa fa-flag bigger-110 hidden-480"></i>状态</th>


                                        <th><i class="fa fa-cog fa-spin bigger-110 hidden-480"></i>操作</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <shiro:hasPermission name="perm:show">
                                    <c:forEach items="${perms.list}" var="perm">
                                        <tr>
                                            <td class="center">
                                                <label class="pos-rel">
                                                    <input type="checkbox" class="ace" name="permIds"
                                                           value="${perm.id}"/>
                                                    <span class="lbl"></span>
                                                </label>
                                            </td>
                                            <td class="permId">${perm.id}</td>
                                            <td class="name">${perm.name}</td>
                                            <td class="url">${perm.url}</td>
                                            <td class="code">${perm.code}</td>
                                            <td class="isNav">
                                                <c:if test="${perm.isNav==0||perm.isNav==null}"><span
                                                        class="label label-sm label-warning arrowed arrowed-righ">否</span></c:if>
                                                <c:if test="${perm.isNav==1}"><span
                                                        class="label label-sm label-success arrowed arrowed-righ">是</span></c:if>
                                            </td>
                                            <td class="priority">${perm.priority}</td>
                                            <td class="icon"><i class="fa ${perm.icon}"></i></td>

                                            <td class="code">
                                                    ${perm.pId}
                                            </td>
                                            <td class="code">
                                                <c:if test="${perm.state==0||perm.state==null}"><span
                                                        class="label label-sm label-warning arrowed arrowed-righ">停用</span></c:if>
                                                <c:if test="${perm.state==1}"><span
                                                        class="label label-sm label-success arrowed arrowed-righ">启用</span></c:if>
                                            </td>
                                            <td>
                                                <div class="hidden-sm hidden-xs btn-group">
                                                    <shiro:hasPermission name="perm:update">
                                                        <button class="btn btn-xs btn-info show-update-form"
                                                                data-toggle="modal" data-target="#perm-form-div">
                                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                        </button>
                                                    </shiro:hasPermission>
                                                    <shiro:hasPermission name="perm:delete">
                                                        <button class="btn btn-xs btn-danger delete-this-perm">
                                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                        </button>
                                                    </shiro:hasPermission>

                                                    <shiro:lacksPermission name="perm:update">
                                                        <shiro:lacksPermission name="perm:delete">
                                                    <span class="label label-large label-grey arrowed-in-right arrowed-in">
                                                        <i class="ace-icon fa fa-lock" title="无权限"></i>
                                                    </span>
                                                        </shiro:lacksPermission>
                                                    </shiro:lacksPermission>

                                                </div>
                                                <div class="hidden-md hidden-lg">
                                                    <div class="inline pos-rel">
                                                        <customTag:hasAnyPermissions
                                                                name="perm:update,perm:delete">
                                                            <button class="btn btn-minier btn-primary dropdown-toggle"
                                                                    data-toggle="dropdown" data-position="auto">
                                                                <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                                                            </button>
                                                        </customTag:hasAnyPermissions>
                                                        <shiro:lacksPermission name="perm:update">
                                                            <shiro:lacksPermission name="perm:delete">
                                                    <span class="label label-large label-grey arrowed-in-right arrowed-in">
                                                        <i class="ace-icon fa fa-lock" title="无权限"></i>
                                                    </span>
                                                            </shiro:lacksPermission>
                                                        </shiro:lacksPermission>
                                                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                            <shiro:hasPermission name="perm:update">
                                                                <li>
                                                                    <a href="javascript:void(0);"
                                                                       class="tooltip-success show-update-form"
                                                                       data-toggle="modal" data-target="#perm-form-div"
                                                                       data-rel="tooltip" title="编辑">
																			<span class="green">
																				<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																			</span>
                                                                    </a>
                                                                </li>
                                                            </shiro:hasPermission>
                                                            <shiro:hasPermission name="perm:delete">
                                                                <li>
                                                                    <a href="javascript:void(0);"
                                                                       class="tooltip-error delete-this-perm"
                                                                       data-rel="tooltip" title="删除">
																			<span class="red">
																				<i class="ace-icon fa fa-trash-o bigger-120"></i>
																			</span>
                                                                    </a>
                                                                </li>
                                                            </shiro:hasPermission>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </shiro:hasPermission>
                                    <shiro:lacksPermission name="perm:show">
                                        <td colspan="100">对不起，您无权限查看！</td>
                                    </shiro:lacksPermission>
                                    </tbody>
                                </table>
                            </div><!-- /.span -->
                        </div><!-- /.row -->

                        <%--分页--%>
                        <div class="row">
                            <div class="col-xs-12 col-md-6">
                                当前第${perms.pageNum}页，共${perms.pages}页，共${perms.total}条记录
                            </div>
                            <div class="col-xs-12 col-md-6">
                                <nav aria-lable="Page navigation">
                                    <ul class="pagination">
                                        <c:choose>
                                            <c:when test="${perms.hasPreviousPage}">
                                                <li><a href="${path}/perm/list?pageNum=1">首页</a></li>
                                                <li>
                                                    <a href="${path}/perm/list?pageNum=${perms.pageNum-1}"
                                                       aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="disabled"><a href="javascript:void(0)">首页</a></li>
                                            </c:otherwise>
                                        </c:choose>

                                        <c:forEach items="${perms.navigatepageNums }" var="page">
                                            <c:if test="${page==perms.pageNum}">
                                                <li class="active"><a
                                                        href="${path}/perm/list?pageNum=${page}">${page}</a></li>
                                            </c:if>
                                            <c:if test="${page!=perms.pageNum}">
                                                <li><a href="${path }/perm/list?pageNum=${page}">${page}</a></li>
                                            </c:if>
                                        </c:forEach>

                                        <c:choose>
                                            <c:when test="${perms.hasNextPage }">
                                                <li>
                                                    <a href="${path }/perm/list?pageNum=${perms.pageNum+1 }"
                                                       aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                                <li><a href="${path }/perm/list?pageNum=${perms.pages}">末页</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="disabled"><a href="javascript:void(0)">末页</a></li>
                                            </c:otherwise>
                                        </c:choose>

                                    </ul>
                                </nav>
                            </div>
                        </div>


                        <!--添加、更新权限表单（二合一）-->
                        <div class="modal fade" id="perm-form-div" tabindex="-1" role="dialog"
                             aria-labelledby="mySmallModalLabel">
                            <div class="modal-dialog modal-md" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="blue bigger perm-form-title"></h4>
                                    </div>
                                    <form id="perm-form" name="perm-form" class="perm-form">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6">
                                                    <input type="hidden" name="id" class="form-control" id="idInput">
                                                    <div class="form-group">
                                                        <label for="nameInput">名称<span
                                                                style="color:#F00">*</span></label>
                                                        <div>
                                                            <input type="text" id="nameInput" name="name"
                                                                   placeholder="名称"/>
                                                        </div>
                                                        <label for="urlInput">URL<span
                                                                style="color:#F00">*</span></label>
                                                        <div>
                                                            <input type="text" id="urlInput" name="url"
                                                                   placeholder="URL"/>
                                                        </div>
                                                        <label for="codeInput">权限代码<span
                                                                style="color:#F00">*</span></label>
                                                        <div>
                                                            <input type="text" id="codeInput" name="code"
                                                                   placeholder="示例:user:showroles"/>
                                                        </div>
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox" class="ace" name="isNav"
                                                                       value="1"><span class="lbl">导航节点</span>
                                                            </label>
                                                        </div>


                                                    </div>
                                                </div>


                                                <div class="col-xs-12 col-sm-6">
                                                    <div class="form-group">
                                                        <label for="priority">优先级<span
                                                                style="color:#F00">*</span></label>
                                                        <div>
                                                            <input type="text" id="priority" name="priority"
                                                                   placeholder="同级别优先级"/>
                                                        </div>
                                                        <label for="icon">图标<span style="color:#F00">*</span></label>
                                                        <div>
                                                            <input type="text" id="icon" name="icon"
                                                                   placeholder="例：fa-user"/>
                                                        </div>
                                                        <label for="pIdInput">父节点<span
                                                                style="color:#F00">*</span></label>
                                                        <div>
                                                            <input type="text" id="pIdInput" name="pId"
                                                                   placeholder="父节点"/>
                                                        </div>
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox" class="ace" name="state"
                                                                       value="1"><span class="lbl">状态</span>
                                                            </label>
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
                                        <button type="button" class="btn btn-sm btn-primary perm-submit"></button>
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
                                        确认删除所选权限吗？
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

<!-- ace脚本 -->
<%@include file="../common/ace-scripts.jsp" %>

<!-- 与此页相关的内联脚本 -->
<script src="${path}/assets/custom-js/permission-list.js"></script>

</body>
</html>
