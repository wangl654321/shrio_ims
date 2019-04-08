<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/global.jsp" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <title>用户管理</title>
    <%@include file="../common/meta.jsp" %>
    <%@include file="../common/assets-css.jsp" %>
    <!-- 页面特殊插件样式 -->


    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="${path}/assets/css/jquery-ui.custom.min.css" />
    <link rel="stylesheet" href="${path}/assets/css/chosen.min.css" />
    <link rel="stylesheet" href="${path}/assets/css/bootstrap-datepicker3.min.css" />
    <link rel="stylesheet" href="${path}/assets/css/bootstrap-timepicker.min.css" />
    <link rel="stylesheet" href="${path}/assets/css/daterangepicker.min.css" />
    <link rel="stylesheet" href="${path}/assets/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="${path}/assets/css/bootstrap-colorpicker.min.css" />

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
                        <a href="#">用户管理</a>
                    </li>
                    <li class="active">用户列表</li>
                </ul><!-- /.breadcrumb -->

            </div>

            <div class="page-content">


                <div class="page-header">
                    <h1>
                        用户管理
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            共${fn:length(users)}位用户
                            <i class="ace-icon fa fa-hand-o-right"></i>
                            <a href="#add-user-form" data-toggle="modal">
                                <i class="ace-icon fa fa-user-plus"></i>
                                添加用户
                            </a>

                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="row">
                            <div class="col-xs-12">
                                <table id="simple-table" class="table  table-bordered table-hover user-list">
                                    <thead>
                                    <tr>
                                        <th class="center">
                                            <label class="pos-rel">
                                                <input type="checkbox" class="ace"/>
                                                <span class="lbl"></span>
                                            </label>
                                        </th>
                                        <th class="detail-col">详细</th>
                                        <th><i class="ace-icon fa fa-user bigger-110 hidden-480"></i>ID</th>
                                        <th><i class="ace-icon fa fa-user bigger-110 hidden-480"></i>用户名</th>
                                        <th><i class="ace-icon fa fa-user-circle-o bigger-110 hidden-480"></i>姓名</th>
                                        <th><i class="ace-icon fa fa-transgender bigger-110 hidden-480"></i>性别</th>
                                        <th><i class="ace-icon fa fa-mobile bigger-110 hidden-480"></i>手机号码</th>
                                        <th><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>注册时间</th>
                                        <th><i class="ace-icon fa fa-heartbeat bigger-110 hidden-480"></i>状态</th>
                                        <th><i class="ace-icon fa fa-cog fa-spin bigger-110 hidden-480"></i>操作</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach items="${users}" var="user">

                                        <tr>
                                            <td class="center">
                                                <label class="pos-rel">
                                                    <input type="checkbox" class="ace" name="userIds"
                                                           value="${user.id}"/>
                                                    <span class="lbl"></span>
                                                </label>
                                            </td>

                                            <td class="center">
                                                <div class="action-buttons">
                                                    <a href="#" class="green bigger-140 show-details-btn"
                                                       title="详细信息">
                                                        <i class="ace-icon fa fa-angle-double-down"></i>
                                                        <span class="sr-only">详细信息</span>
                                                    </a>
                                                </div>
                                            </td>
                                            <td class="userid">${user.id}</td>
                                            <td>
                                                ${user.username}
                                            </td>
                                            <td>${user.realName}</td>
                                            <td class="hidden-480">
                                                <c:if test="${empty user.gender}"></c:if>
                                                <c:if test="${user.gender==0}">保密</c:if>
                                                <c:if test="${user.gender==2}">女</c:if>
                                                <c:if test="${user.gender==1}">男</c:if>
                                            </td>
                                            <td>${user.mobile}</td>
                                            <td class="hidden-480">
                                                <fmt:formatDate value="${user.createTime}" type="both"
                                                                pattern="yyyy-MM-dd HH:mm:ss"/>
                                            </td>
                                            <td>
                                                <c:if test="${empty user.state}"></c:if>
                                                <c:if test="${user.state==2}"><span
                                                        class="label label-sm label-inverse arrowed-in">锁定</span></c:if>
                                                <c:if test="${user.state==1}"><span
                                                        class="label label-sm label-success">正常</span></c:if>

                                            </td>

                                            <td>
                                                <div class="hidden-sm hidden-xs btn-group">

                                                    <a href="#edit-user-form" data-toggle="modal">
                                                        <button class="btn btn-xs btn-info">
                                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                        </button>
                                                    </a>


                                                    <a class="delete-this-user" href="javascript:void(0);">
                                                        <button class="btn btn-xs btn-danger">
                                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                        </button>
                                                    </a>


                                                </div>

                                            </td>
                                        </tr>


                                        <tr class="detail-row">
                                            <td colspan="11">
                                                <div class="table-detail">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-2">
                                                            <div class="text-center">
                                                                <img height="150"
                                                                     class="thumbnail inline no-margin-bottom"
                                                                     alt="Domain Owner's Avatar"
                                                                     src="${path}${user.head}"/>
                                                                <br/>
                                                                <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                                                                    <div class="inline position-relative">
                                                                        <a class="user-title-label" href="#">
                                                                            <i class="ace-icon fa fa-circle light-green"></i>
                                                                            &nbsp;
                                                                            <span class="white">${user.realName}</span>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-xs-12 col-sm-7">
                                                            <div class="space visible-xs"></div>

                                                            <div class="profile-user-info profile-user-info-striped">
                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 学&emsp;&emsp;历</div>

                                                                    <div class="profile-info-value">
                                                                <span>
                                                                    <c:if test="${user.education==null}"></c:if>
                                                                    <c:if test="${user.education==1}">博士</c:if>
                                                                    <c:if test="${user.education==2}">硕士</c:if>
                                                                    <c:if test="${user.education==3}">本科</c:if>
                                                                    <c:if test="${user.education==4}">专科</c:if>
                                                                    <c:if test="${user.education==5}">高中</c:if>
                                                                    <c:if test="${user.education==6}">初中</c:if>
                                                                   </span>
                                                                    </div>
                                                                </div>

                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 出生日期</div>

                                                                    <div class="profile-info-value">

                                                                        <span>${user.birth}</span>

                                                                    </div>
                                                                </div>
                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 部&emsp;&emsp;门</div>

                                                                    <div class="profile-info-value">
                                                                        <span>${user.department}</span>
                                                                    </div>
                                                                </div>

                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 职&emsp;&emsp;务</div>

                                                                    <div class="profile-info-value">
                                                                        <span>${user.position}</span>
                                                                    </div>
                                                                </div>


                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 住&emsp;&emsp;址</div>

                                                                    <div class="profile-info-value">
                                                                        <i class="fa fa-map-marker light-orange bigger-110"></i>
                                                                        <span>${user.address}</span>
                                                                    </div>
                                                                </div>

                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 备&emsp;&emsp;注</div>

                                                                    <div class="profile-info-value">

                                                                        <span>${user.note}</span>

                                                                    </div>
                                                                </div>


                                                            </div>
                                                        </div>

                                                            <%--<div class="col-xs-12 col-sm-3">--%>
                                                            <%--<div class="space visible-xs"></div>--%>
                                                            <%--<h4 class="header blue lighter less-margin">Send a message to Alex</h4>--%>


                                                            <%--</div>--%>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>


                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div><!-- /.span -->
                        </div><!-- /.row -->


                        <div style="display: none" onMouseout="hidden();">
                            <table id="dynamic-table">
                                <!--该DIV不可删除，否则上一个表格将不显示详细信息-->
                            </table>
                        </div>

                        <%--添加用户DIV--%>
                        <div id="add-user-form" class="modal fade" tabindex="-1">
                            <div class="modal-dialog">

                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="blue bigger">添加用户</h4>
                                    </div>
                                    <form id="addUserForm">
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-6">
                                                <div class="form-group">
                                                    <label for="form-add-username">用户名<span style="color:#F00">*</span></label>
                                                    <div>
                                                        <input type="text" id="form-add-username" name="username" placeholder="用户名"/>
                                                    </div>
                                                    <label for="form-add-password">密码<span style="color:#F00">*</span></label>
                                                    <div>
                                                        <input type="password" id="form-add-password" name="password" placeholder="密码"/>
                                                    </div>
                                                    <label for="form-add-realname">姓名<span style="color:#F00">*</span></label>
                                                    <div>
                                                        <input type="text" id="form-add-realname" name="realName" placeholder="姓名"
                                                               value=""/>
                                                    </div>
                                                    <label for="gender">性别<span style="color:#F00">*</span></label>
                                                    <div>
                                                        <label class="radio-inline">
                                                            <input name="gender" type="radio" class="ace" value="1"/>
                                                            <span class="lbl">男</span>
                                                        </label>
                                                        <label  class="radio-inline">
                                                            <input name="gender" type="radio" class="ace" value="2" />
                                                            <span class="lbl">女</span>
                                                        </label>
                                                        <label  class="radio-inline">
                                                            <input name="gender" type="radio" class="ace" value="0" checked />
                                                            <span class="lbl">保密</span>
                                                        </label>
                                                    </div>
                                                    <label for="form-add-mobile">手机号码</label>
                                                    <div>
                                                        <input type="text" id="form-add-mobile" name="mobile" placeholder="手机号码"
                                                               value=""/>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-6">
                                                <div class="form-group">
                                                    <label for="form-add-birth">出生日期</label>
                                                    <div class="row">
                                                        <div class="col-xs-8 col-sm-11">
                                                            <div class="input-group">
                                                                <input class="form-control date-picker" id="form-add-birth" name="birth" type="text" data-date-format="yyyy-mm-dd" />
                                                                <span class="input-group-addon">
																		<i class="fa fa-calendar bigger-110"></i>
																	</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <label for="form-add-education">学历<span style="color:#F00">*</span></label>
                                                    <div class="row">
                                                    <div class="col-xs-8 col-sm-11">
                                                    <select class="form-control" id="form-add-education" name="education">
                                                        <option value="">请选择</option>
                                                        <option value="1">博士</option>
                                                        <option value="2">硕士</option>
                                                        <option value="3">本科</option>
                                                        <option value="4">专科</option>
                                                        <option value="5">高中</option>
                                                        <option value="6">初中</option>
                                                    </select>
                                                    </div>
                                                    </div>


                                                    <label for="form-add-department">部门及职务</label>
                                                    <div class="row">
                                                        <div class="col-xs-3 col-sm-6">
                                                            <select class="form-control" id="form-add-department" name="department">
                                                                <option value="">请选择</option>
                                                                <option value="软件一部">软件一部</option>
                                                                <option value="软件二部">软件二部</option>

                                                            </select>
                                                        </div>
                                                        <div class="col-xs-3 col-sm-6">
                                                            <select class="form-control" id="form-add-position" name="position">
                                                                <option value="">请选择</option>
                                                                <option value="副总经理">副总经理</option>
                                                                <option value="主管">主管</option>
                                                                <option value="项目经理">项目经理</option>
                                                                <option value="软件工程师">软件工程师</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <label for="form-add-address">住址</label>
                                                    <div>
                                                        <input type="text" id="form-add-address" name="address" placeholder="现住址"/>
                                                    </div>
                                                        <%--<div id="form-add-address" data-toggle="distpicker">--%>
                                                            <%--<select data-province="---- 选择省 ----" name="address"></select>--%>
                                                            <%--<select data-city="---- 选择市 ----"></select>--%>
                                                            <%--<select data-district="---- 选择区 ----"></select>--%>
                                                        <%--</div>--%>

                                                    <label for="form-add-note">备注</label>
                                                    <div>
                                                        <textarea id="form-add-note" name="note" class="autosize-transition form-control"></textarea>
                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                    <div class="modal-footer">
                                        <button class="btn btn-sm" data-dismiss="modal" type="submit">
                                            <i class="ace-icon fa fa-times"></i>
                                            取消
                                        </button>


                                        <button type="button" class="btn btn-sm btn-primary add-user-submit">
                                            <i class="ace-icon fa fa-check"></i>
                                            提交
                                        </button>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <%--修改用户DIV--%>
                        <div id="edit-user-form" class="modal fade" tabindex="-1">
                            <div class="modal-dialog">

                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="blue bigger">编辑用户信息</h4>
                                    </div>
                                    <form id="editUserForm">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6">
                                                    <div class="form-group">
                                                        <label for="form-edit-username">用户名<span style="color:#F00">*</span></label>
                                                        <div>
                                                            <input type="text" id="form-edit-username" name="username" value=""/>
                                                        </div>
                                                        <label for="form-edit-realname">姓名<span style="color:#F00">*</span></label>
                                                        <div>
                                                            <input type="text" id="form-edit-realname" name="realName" placeholder="姓名"
                                                                   value=""/>
                                                        </div>
                                                        <label for="gender">性别<span style="color:#F00">*</span></label>
                                                        <div>
                                                            <label class="radio-inline">
                                                                <input name="gender" type="radio" class="ace" value="1"/>
                                                                <span class="lbl">男</span>
                                                            </label>
                                                            <label  class="radio-inline">
                                                                <input name="gender" type="radio" class="ace" value="2" />
                                                                <span class="lbl">女</span>
                                                            </label>
                                                            <label  class="radio-inline">
                                                                <input name="gender" type="radio" class="ace" value="0" checked />
                                                                <span class="lbl">保密</span>
                                                            </label>
                                                        </div>
                                                        <label for="form-edit-mobile">手机号码</label>
                                                        <div>
                                                            <input type="text" id="form-edit-mobile" name="mobile" placeholder="手机号码"
                                                                   value=""/>
                                                        </div>
                                                        <label for="form-edit-birth">出生日期</label>
                                                        <div class="row">
                                                            <div class="col-xs-8 col-sm-11">
                                                                <div class="input-group">
                                                                    <input class="form-control date-picker" id="form-edit-birth" name="birth" type="text" data-date-format="yyyy-MM-dd" />
                                                                    <span class="input-group-addon">
																		<i class="fa fa-calendar bigger-110"></i>
																	</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-6">
                                                    <div class="form-group">

                                                        <label for="form-edit-education">学历<span style="color:#F00">*</span></label>
                                                        <div class="row">
                                                            <div class="col-xs-8 col-sm-11">
                                                                <select class="form-control" id="form-edit-education" name="education">
                                                                    <option value="">请选择</option>
                                                                    <option value="1">博士</option>
                                                                    <option value="2">硕士</option>
                                                                    <option value="3">本科</option>
                                                                    <option value="4">专科</option>
                                                                    <option value="5">高中</option>
                                                                    <option value="6">初中</option>
                                                                </select>
                                                            </div>
                                                        </div>


                                                        <label for="form-edit-department">部门及职务</label>
                                                        <div class="row">
                                                            <div class="col-xs-3 col-sm-6">
                                                                <select class="form-control" id="form-edit-department" name="department">
                                                                    <option value="">请选择</option>
                                                                    <option value="软件一部">软件一部</option>
                                                                    <option value="软件二部">软件二部</option>

                                                                </select>
                                                            </div>
                                                            <div class="col-xs-3 col-sm-6">
                                                                <select class="form-control" id="form-edit-position" name="position">
                                                                    <option value="">请选择</option>
                                                                    <option value="副总经理">副总经理</option>
                                                                    <option value="主管">主管</option>
                                                                    <option value="项目经理">项目经理</option>
                                                                    <option value="软件工程师">软件工程师</option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <label for="form-edit-address">住址</label>
                                                        <div>
                                                            <input type="text" id="form-edit-address" name="address" placeholder="现住址"/>
                                                        </div>
                                                        <%--<div id="form-edit-address" data-toggle="distpicker">--%>
                                                        <%--<select data-province="---- 选择省 ----" name="address"></select>--%>
                                                        <%--<select data-city="---- 选择市 ----"></select>--%>
                                                        <%--<select data-district="---- 选择区 ----"></select>--%>
                                                        <%--</div>--%>

                                                        <label for="form-edit-note">备注</label>
                                                        <div>
                                                            <textarea id="form-edit-note" name="note" class="autosize-transition form-control"></textarea>
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="modal-footer">
                                        <button class="btn btn-sm" data-dismiss="modal" type="submit">
                                            <i class="ace-icon fa fa-times"></i>
                                            取消
                                        </button>


                                        <button type="button" class="btn btn-sm btn-primary edit-user-submit">
                                            <i class="ace-icon fa fa-check"></i>
                                            确定
                                        </button>
                                    </div>
                                </div>

                            </div>
                        </div>




                        <!-- PAGE CONTENT ENDS -->



                        <!-- 提示框 -->
                        <div class="modal fade" id="op-tips-dialog" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                            <div class="modal-dialog modal-sm" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" >提示信息</h4>
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
    <div id="qwert"></div>
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
<script src="${path}/assets/js/bootstrap-datepicker.min.js"></script>
<script src="${path}/assets/js/bootstrap-timepicker.min.js"></script>
<script src="${path}/assets/js/moment.min.js"></script>
<script src="${path}/assets/js/daterangepicker.min.js"></script>
<script src="${path}/assets/js/bootstrap-datetimepicker.min.js"></script>
<script src="${path}/assets/js/bootstrap-colorpicker.min.js"></script>
<script src="${path}/assets/js/jquery.knob.min.js"></script>
<script src="${path}/assets/js/autosize.min.js"></script>
<script src="${path}/assets/js/jquery.inputlimiter.min.js"></script>
<script src="${path}/assets/js/jquery.maskedinput.min.js"></script>
<script src="${path}/assets/js/bootstrap-tag.min.js"></script>

<script src="${path}/resource/static/distpicker/dist/distpicker.js"></script>

<!-- ace脚本 -->
<%@include file="../common/ace-scripts.jsp" %>

<!-- 与此页相关的内联脚本 -->
<script src="${path}/assets/custom-js/user-info.js"></script>

</body>
</html>
