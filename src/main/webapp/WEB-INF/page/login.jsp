<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/global.jsp" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <title>登录-${title}</title>
    <%@include file="common/meta.jsp" %>
    <%@include file="common/assets-css.jsp" %>

    <link rel="stylesheet" href="${path}/assets/css/jquery-ui.custom.min.css"/>
    <link rel="stylesheet" href="${path}/assets/css/jquery.gritter.min.css"/>

    <%@include file="common/assets-js.jsp" %>
    <style rel="stylesheet">
        .error{
            font-size: smaller;
            color:red;
        }
    </style>
</head>
<body class="login-layout light-login">
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">
                    <div class="center">
                        <h1>
                            <i class="ace-icon fa fa-leaf green"></i>
                            <%--<span class="red">企业</span>--%>
                            <span class="grey" id="id-text2">管理系统</span>
                        </h1>

                    </div>

                    <div class="space-6"></div>

                    <div class="position-relative">
                        <div id="login-box" class="login-box visible widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header blue lighter bigger">
                                        <i class="ace-icon fa fa-coffee green"></i>
                                        登录
                                            <c:choose>
                                                <c:when test="${error eq '帐户未激活!'}">
                                                    <span class="label label-lg label-warning arrowed login-error-tip">${error}
                                                                <a href="#" data-target="#resend-email-box" class="resend-email-link">
                                                        点我重发激活邮件
                                                    </a></span>
                                                            </c:when>
                                                            <c:otherwise>
                                                    <span class="label label-lg label-warning arrowed login-error-tip">${error}</span>
                                                </c:otherwise>
                                            </c:choose>
                                    </h4>
                                    <div class="space-6"></div>

                                    <form method="post" action="">
                                        <fieldset>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="text" class="form-control" name="username" placeholder="用户名/邮箱/手机号" value="admin" required autofocus/>
                                                    <i class="ace-icon fa fa-user"></i>
                                                </span>
                                            </label>

                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="password" class="form-control" name="password" value="admin" placeholder="密码" required/>
                                                    <i class="ace-icon fa fa-lock"></i>
                                                </span>
                                            </label>
                                            <div class="space"></div>
                                            <div class="clearfix">
                                                <label class="inline">
                                                    <input type="checkbox" class="ace" name="rememberMe"/>
                                                    <span class="lbl">记住我</span>
                                                </label>

                                                <button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
                                                    <i class="ace-icon fa fa-key"></i>
                                                    <span class="bigger-110">登录</span>
                                                </button>
                                            </div>
                                            <div class="space-4"></div>
                                        </fieldset>
                                    </form>

                                    <%-- <div class="social-or-login center">
                                         <span class="bigger-110">其他登录方式</span>
                                     </div>

                                     <div class="space-6"></div>

                                     <div class="social-login center">
                                         <a class="btn btn-primary">
                                             <i class="ace-icon fa fa-qq"></i>
                                         </a>

                                         <a class="btn btn-success">
                                             <i class="ace-icon fa fa-weixin"></i>
                                         </a>

                                         <a class="btn btn-danger">
                                             <i class="ace-icon fa fa-weibo"></i>
                                         </a>
                                     </div>--%>
                                </div>

                                <div class="toolbar clearfix">
                                    <div>
                                        <a href="#" data-target="#forgot-box" class="forgot-password-link">
                                            <i class="ace-icon fa fa-arrow-left"></i>
                                            忘记密码
                                        </a>
                                    </div>
                                    <div>
                                        <a href="#" data-target="#signup-box" class="user-signup-link">
                                            注册账号
                                            <i class="ace-icon fa fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="forgot-box" class="forgot-box widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header red lighter bigger">
                                        <i class="ace-icon fa fa-key"></i>
                                        重置密码
                                    </h4>

                                    <div class="space-6"></div>
                                    <p>
                                        请输入电子邮箱（注册时填写的）
                                    </p>

                                    <form class="retrieve-password-form" id="retrieve-password-form">
                                        <fieldset>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="email" class="form-control" placeholder="电子邮箱" required autofocus/>
                                                    <i class="ace-icon fa fa-envelope"></i>
                                                </span>
                                            </label>

                                            <div class="clearfix">
                                                <button type="submit" class="width-35 pull-right btn btn-sm btn-danger">
                                                    <i class="ace-icon fa fa-lightbulb-o"></i>
                                                    <span class="bigger-110">获取</span>
                                                </button>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>

                                <div class="toolbar center">
                                    <a href="#" data-target="#login-box" class="back-to-login-link">
                                        返回登录
                                        <i class="ace-icon fa fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div id="signup-box" class="signup-box widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header green lighter bigger">
                                        <i class="ace-icon fa fa-users blue"></i>
                                        注册
                                    </h4>

                                    <div class="space-6"></div>

                                    <%--<span class="btn btn-warning btn-sm tooltip-warning" data-rel="tooltip"--%>
                                          <%--data-placement="right" title="右侧警告">右侧</span>--%>
                                    <form class="sign-up-form" id="sign-up-form">
                                        <fieldset>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="email" class="form-control" id="email" name="email" placeholder="电子邮箱(必需,用于激活及找回密码)"/>
                                                    <i class="ace-icon fa fa-envelope"></i>
                                                </span>
                                            </label>
                                            <label for="email"></label>

                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="text" class="form-control" id="username" name="username" placeholder="用户名(必需)"/>
                                                    <i class="ace-icon fa fa-user"></i>
                                                </span>
                                            </label>
                                            <label for="username"></label>

                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="password" class="form-control" id="password" name="password" placeholder="密码(必需)"/>
                                                    <i class="ace-icon fa fa-lock"></i>
                                                </span>
                                            </label>
                                            <label for="password"></label>

                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="确认密码(必需)"/>
                                                    <i class="ace-icon fa fa-retweet"></i>
                                                </span>
                                            </label>
                                            <label for="confirm_password"></label>

                                            <label class="block">
                                                <input type="checkbox" class="ace" id="agree_ra" name="agree_ra"/>
                                                <span class="lbl">我接受<a href="javascript:void(0);" id="sign-on-ra">《用户注册协议》</a></span>
                                            </label>

                                            <label for="agree_ra"></label>
                                            <div class="space-24"></div>
                                            <div class="clearfix">
                                                <button type="reset" class="width-30 pull-left btn btn-sm">
                                                    <i class="ace-icon fa fa-refresh"></i>
                                                    <span class="bigger-110">重置</span>
                                                </button>
                                                <button type="submit"
                                                        class="width-65 pull-right btn btn-sm btn-success sign-up-submit">
                                                    <span class="bigger-110">提交</span>

                                                    <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                                </button>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>

                                <div class="toolbar center">
                                    <a href="#" data-target="#login-box" class="back-to-login-link">
                                        <i class="ace-icon fa fa-arrow-left"></i>
                                        返回登录
                                    </a>
                                </div>
                            </div>
                        </div>

                        <%--重发激活邮件--%>
                        <div id="resend-email-box" class="forgot-box widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header orange lighter bigger">
                                        <i class="ace-icon fa fa-envelope"></i>
                                        重发激活邮件
                                    </h4>

                                    <div class="space-6"></div>
                                    <p>
                                        请输入待激活用户
                                    </p>

                                    <form class="resend-email-form" id="resend-email-form">
                                        <fieldset>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="text" class="form-control" name="username" placeholder="待激活用户名" required autofocus/>
                                                    <i class="ace-icon fa fa-user"></i>
                                                </span>
                                            </label>

                                            <div class="clearfix">
                                                <button type="submit" class="width-35 pull-right btn btn-sm btn-warning">
                                                    <i class="ace-icon fa fa-lightbulb-o"></i>
                                                    <span class="bigger-110">发送</span>
                                                </button>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div><!-- /.widget-main -->
                                <div style="background:#ff892a;border-top:2px solid rgb(236, 128, 40);border-top-style:solid;" class="orange toolbar center">
                                    <a href="#" data-target="#login-box" class="back-to-login-link">
                                        返回登录
                                        <i class="ace-icon fa fa-arrow-right"></i>
                                    </a>
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

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- 基本脚本 -->
<%@include file="common/basic-scripts.jsp" %>

<!-- 页面特殊插件脚本 -->
<!--[if lte IE 8]>
<script src="${path}/assets/js/excanvas.min.js"></script>
<![endif]-->
<script src="${path}/assets/js/jquery-ui.custom.min.js"></script>
<script src="${path}/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="${path}/assets/js/bootbox.js"></script>
<script src="${path}/assets/js/jquery.easypiechart.min.js"></script>
<script src="${path}/assets/js/jquery.gritter.min.js"></script>
<script src="${path}/assets/js/spin.js"></script>
<script src="${path}/resource/static/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="${path}/resource/static/jquery-validation/dist/localization/messages_zh.js"></script>

<!-- ace脚本 -->
<%@include file="common/ace-scripts.jsp" %>

<!-- 与此页相关的内联脚本 -->
<script type="text/javascript" src="${path}/assets/custom-js/login.js"></script>

</body>
</html>