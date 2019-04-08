<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/global.jsp" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <title>首页--${title}</title>
    <%@include file="../common/meta.jsp" %>
    <%@include file="../common/assets-css.jsp" %>
    <%@include file="../common/assets-js.jsp" %>
</head>

<body class="no-skin">
<%--top导航栏--%>
<%@include file="../common/navbar.jsp" %>

<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.loadState('main-container')
        } catch (e) {
        }
    </script>

    <%--侧边栏--%>
    <%@include file="../common/sidebar.jsp" %>

    <%--main-content内容--%>
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">首页</a>
                    </li>
                    <li class="active">控制台</li>
                </ul><!-- /.breadcrumb -->

                <div class="nav-search" id="nav-search">
                    <form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="搜索..." class="nav-search-input"
                                           id="nav-search-input" autocomplete="off"/>
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
                    </form>
                </div><!-- /.nav-search -->
            </div>

            <div class="page-content">

                <div class="page-header">
                    <h1>
                        控制台
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            概述和统计数据
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->

                        <div class="alert alert-block alert-success">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>

                            <i class="ace-icon fa fa-check green"></i>

                            欢迎使用
                            <strong class="green">
                                ${title}-管理员版
                                <small>(v1.0)</small>
                            </strong>
                            ，企业员工便捷查询信息的安全平台。
                        </div>

                        <!---------------以下功能待开发--------------------->


                        <div class="row">
                            <div class="space-6"></div>

                            <div class="col-sm-7 infobox-container">
                                <div class="infobox infobox-green">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-bullhorn"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-data-number">${notices.size()}</span>
                                        <div class="infobox-content">系统通知</div>
                                    </div>

                                    <%--<div class="stat stat-success">8%</div>--%>
                                </div>

                                <div class="infobox infobox-blue">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-users"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-data-number">${employees.size()}</span>
                                        <div class="infobox-content">企业职工总数</div>
                                    </div>

                                    <%--<div class="badge badge-success">--%>
                                    <%--+8%--%>
                                    <%--<i class="ace-icon fa fa-arrow-up"></i>--%>
                                    <%--</div>--%>
                                </div>

                                <div class="infobox infobox-pink">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-trophy"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-data-number">${qualification.size()}</span>
                                        <div class="infobox-content">企业资质</div>
                                    </div>
                                    <%--<div class="stat stat-important">4%</div>--%>
                                </div>

                                <div class="infobox infobox-red">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-soccer-ball-o"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-data-number">${party.size()}</span>
                                        <div class="infobox-content">活动剪影</div>
                                    </div>
                                </div>

                                <div class="infobox infobox-orange2">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-copyright"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-data-number">待开发</span>
                                        <div class="infobox-content">商标总数</div>
                                    </div>

                                    <%--<div class="badge badge-success">--%>
                                    <%--7.2%--%>
                                    <%--<i class="ace-icon fa fa-arrow-up"></i>--%>
                                    <%--</div>--%>
                                </div>

                                <div class="infobox infobox-blue2">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-archive"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-data-number">待开发</span>
                                        <div class="infobox-content">软著总数</div>
                                    </div>
                                </div>

                                <div class="space-6"></div>

                                <%--<div class="infobox infobox-green infobox-small infobox-dark">--%>
                                <%--<div class="infobox-progress">--%>
                                <%--<div class="easy-pie-chart percentage" data-percent="61" data-size="39">--%>
                                <%--<span class="percent">61</span>%--%>
                                <%--</div>--%>
                                <%--</div>--%>

                                <%--<div class="infobox-data">--%>
                                <%--<div class="infobox-content">Task</div>--%>
                                <%--<div class="infobox-content">Completion</div>--%>
                                <%--</div>--%>
                                <%--</div>--%>

                                <%--<div class="infobox infobox-blue infobox-small infobox-dark">--%>
                                <%--<div class="infobox-chart">--%>
                                <%--<span class="sparkline" data-values="3,4,2,3,4,4,2,2"></span>--%>
                                <%--</div>--%>

                                <%--<div class="infobox-data">--%>
                                <%--<div class="infobox-content">Earnings</div>--%>
                                <%--<div class="infobox-content">$32,000</div>--%>
                                <%--</div>--%>
                                <%--</div>--%>

                                <%--<div class="infobox infobox-grey infobox-small infobox-dark">--%>
                                <%--<div class="infobox-icon">--%>
                                <%--<i class="ace-icon fa fa-download"></i>--%>
                                <%--</div>--%>

                                <%--<div class="infobox-data">--%>
                                <%--<div class="infobox-content">Downloads</div>--%>
                                <%--<div class="infobox-content">1,205</div>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                            </div>

                            <div class="vspace-12-sm"></div>

                            <div class="col-sm-5">
                                <div class="widget-box">
                                    <div class="widget-header widget-header-flat widget-header-small">
                                        <h5 class="widget-title">
                                            <i class="ace-icon fa fa-pie-chart"></i>
                                            Java进程内存占用情况
                                        </h5>

                                        <%--<div class="widget-toolbar no-border">--%>
                                        <%--<div class="inline dropdown-hover">--%>
                                        <%--<button class="btn btn-minier btn-primary">--%>
                                        <%--This Week--%>
                                        <%--<i class="ace-icon fa fa-angle-down icon-on-right bigger-110"></i>--%>
                                        <%--</button>--%>

                                        <%--<ul class="dropdown-menu dropdown-menu-right dropdown-125 dropdown-lighter dropdown-close dropdown-caret">--%>
                                        <%--<li class="active">--%>
                                        <%--<a href="#" class="blue">--%>
                                        <%--<i class="ace-icon fa fa-caret-right bigger-110">&nbsp;</i>--%>
                                        <%--This Week--%>
                                        <%--</a>--%>
                                        <%--</li>--%>

                                        <%--<li>--%>
                                        <%--<a href="#">--%>
                                        <%--<i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>--%>
                                        <%--Last Week--%>
                                        <%--</a>--%>
                                        <%--</li>--%>

                                        <%--<li>--%>
                                        <%--<a href="#">--%>
                                        <%--<i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>--%>
                                        <%--This Month--%>
                                        <%--</a>--%>
                                        <%--</li>--%>

                                        <%--<li>--%>
                                        <%--<a href="#">--%>
                                        <%--<i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>--%>
                                        <%--Last Month--%>
                                        <%--</a>--%>
                                        <%--</li>--%>
                                        <%--</ul>--%>
                                        <%--</div>--%>
                                        <%--</div>--%>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <div id="piechart-placeholder"></div>

                                            <div class="hr hr8 hr-double"></div>

                                            <div class="clearfix">
                                                <div class="grid3">
															<span class="grey">
																<i class="ace-icon fa fa-heart fa-2x red"></i>
																&nbsp; 总量
															</span>
                                                    <h4 class="bigger pull-right"><fmt:formatNumber
                                                            value="${maxMemory/1024/1024}" pattern="#.00"/>MB</h4>
                                                </div>

                                                <div class="grid3">
															<span class="grey">
																<i class="ace-icon fa fa-heartbeat fa-2x red"></i>
																&nbsp; 占用
															</span>
                                                    <h4 class="bigger pull-right"><fmt:formatNumber
                                                            value="${usedMemory/1024/1024}" pattern="#.00"/>MB</h4>
                                                </div>

                                                <div class="grid3">
															<span class="grey">
																<i class="ace-icon fa fa-heart-o fa-2x red"></i>
																&nbsp; 剩余
															</span>
                                                    <h4 class="bigger pull-right"><fmt:formatNumber
                                                            value="${useableMemory/1024/1024}" pattern="#.00"/>MB</h4>
                                                </div>
                                            </div>
                                        </div><!-- /.widget-main -->
                                    </div><!-- /.widget-body -->
                                </div><!-- /.widget-box -->
                            </div><!-- /.col -->
                        </div><!-- /.row -->

                        <div class="hr hr32 hr-dotted"></div>

                        <div class="row">
                            <div class="col-sm-4">
                                <div class="widget-box transparent">
                                    <div class="widget-header widget-header-flat">
                                        <h4 class="widget-title lighter">
                                            <i class="ace-icon fa fa-tasks blue"></i>
                                            服务器与Java信息
                                        </h4>

                                        <div class="widget-toolbar">
                                            <a href="#" data-action="collapse">
                                                <i class="ace-icon fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main no-padding">
                                            <table class="table table-bordered table-striped">
                                                <thead class="thin-border-bottom">
                                                <tr>
                                                    <th>
                                                        <i class="ace-icon fa fa-caret-right blue"></i>参数
                                                    </th>

                                                    <th>
                                                        <i class="ace-icon fa fa-caret-right blue"></i>配置
                                                    </th>
                                                </tr>
                                                </thead>

                                                <tbody>
                                                <tr>
                                                    <td>服务器时间</td>

                                                    <td>
                                                        <b class="blue">
                                                            <%@include file="clock.jsp" %>
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>服务器名称</td>
                                                    <td>
                                                        <b class="blue">${pageContext.request.serverName}</b>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td>服务器端口</td>

                                                    <td>
                                                        <b class="blue">${pageContext.request.serverPort}</b>
                                                    </td>

                                                </tr>

                                                <tr>
                                                    <td>服务器类型</td>

                                                    <td>
                                                        <b class="blue">${pageContext.servletContext.serverInfo}</b>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td>Java运行时名称</td>

                                                    <td>

                                                        <b class="blue">${map["java.specification.name"]}</b>
                                                    </td>


                                                </tr>
                                                <tr>
                                                    <td>Java虚拟机版本</td>

                                                    <td>
                                                        <b class="blue">${map["java.vm.version"]}</b>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td>Java运行版本</td>

                                                    <td>
                                                        <b class="blue">${map["java.version"]}</b>
                                                    </td>

                                                </tr>


                                                </tbody>
                                            </table>
                                        </div><!-- /.widget-main -->
                                    </div><!-- /.widget-body -->
                                </div><!-- /.widget-box -->
                            </div><!-- /.col -->


                            <div class="col-sm-4">
                                <div class="widget-box transparent">
                                    <div class="widget-header widget-header-flat">
                                        <h4 class="widget-title lighter">
                                            <i class="ace-icon fa fa-windows green"></i>
                                            操作系统信息
                                        </h4>

                                        <div class="widget-toolbar">
                                            <a href="#" data-action="collapse">
                                                <i class="ace-icon fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main no-padding">
                                            <table class="table table-bordered table-striped">
                                                <thead class="thin-border-bottom">
                                                <tr>
                                                    <th>
                                                        <i class="ace-icon fa fa-caret-right blue"></i>参数
                                                    </th>

                                                    <th>
                                                        <i class="ace-icon fa fa-caret-right blue"></i>配置
                                                    </th>
                                                </tr>
                                                </thead>

                                                <tbody>
                                                <tr>
                                                    <td>操作系统名称</td>

                                                    <td>

                                                        <b class="green">${map["os.name"]}</b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>操作系统版本</td>

                                                    <td>

                                                        <b class="green">${map["os.version"]}</b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>操作系统架构</td>

                                                    <td>

                                                        <b class="green">${map["os.arch"]}</b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>操作系统时区</td>

                                                    <td>
                                                        <b class="green">${map["user.timezone"]}</b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>用户名称</td>

                                                    <td>
                                                        <b class="green">${map["user.name"]}</b>
                                                    </td>

                                                </tr>

                                                <tr>
                                                    <td>用户主目录</td>

                                                    <td>
                                                        <b class="green">${map["user.home"]}</b>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td>用户国家/语言</td>

                                                    <td>
                                                        <b class="green">${map["user.country"]}/${map["user.language"]}</b>
                                                    </td>

                                                </tr>
                                                </tbody>
                                            </table>
                                        </div><!-- /.widget-main -->
                                    </div><!-- /.widget-body -->
                                </div><!-- /.widget-box -->
                            </div><!-- /.col -->


                            <div class="col-sm-4">
                                <div class="widget-box transparent">
                                    <div class="widget-header widget-header-flat">
                                        <h4 class="widget-title lighter">
                                            <i class="ace-icon fa fa-desktop orange"></i>
                                            客户端信息
                                        </h4>

                                        <div class="widget-toolbar">
                                            <a href="#" data-action="collapse">
                                                <i class="ace-icon fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main no-padding">
                                            <table class="table table-bordered table-striped">
                                                <thead class="thin-border-bottom">
                                                <tr>
                                                    <th>
                                                        <i class="ace-icon fa fa-caret-right blue"></i>参数
                                                    </th>

                                                    <th>
                                                        <i class="ace-icon fa fa-caret-right blue"></i>配置
                                                    </th>
                                                </tr>
                                                </thead>

                                                <tbody>

                                                <tr>
                                                    <td>访问地址</td>

                                                    <td>
                                                        <b class="orange">${header["Host"]}</b>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>客户端IP</td>

                                                    <td>
                                                        <b class="orange">${pageContext.request.remoteAddr }</b>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>web application名称</td>

                                                    <td>
                                                        <b class="orange">${pageContext.request.contextPath}</b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>[HTTP]协议</td>

                                                    <td>
                                                        <b class="orange">[${pageContext.request.method}]${pageContext.request.protocol}</b>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>用户浏览器版本</td>

                                                    <td>
                                                        <b class="orange">${header["User-Agent"]}</b>
                                                    </td>

                                                </tr>

                                                </tbody>
                                            </table>
                                        </div><!-- /.widget-main -->
                                    </div><!-- /.widget-body -->
                                </div><!-- /.widget-box -->
                            </div><!-- /.col -->


                        </div><!-- /.row -->
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
<script src="${path}/assets/js/jquery-ui.custom.min.js"></script>
<script src="${path}/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="${path}/assets/js/jquery.easypiechart.min.js"></script>
<script src="${path}/assets/js/jquery.sparkline.index.min.js"></script>
<script src="${path}/assets/js/jquery.flot.min.js"></script>
<script src="${path}/assets/js/jquery.flot.pie.min.js"></script>
<script src="${path}/assets/js/jquery.flot.resize.min.js"></script>

<!-- ace脚本 -->
<%@include file="../common/ace-scripts.jsp" %>

<!-- 与此页相关的内联脚本 -->
<script src="${path}/assets/custom-js/server-info.js"></script>

</body>
</html>