<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/global.jsp" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <title>首页-${title}</title>
    <%@include file="common/meta.jsp" %>
    <%@include file="common/assets-css.jsp" %>
    <%@include file="common/assets-js.jsp" %>
    <style rel="stylesheet">
        .error{
            font-size: smaller;
            color:red;
        }
    </style>
</head>

<body class="no-skin">
<%--top导航栏--%>
<%@include file="common/navbar.jsp" %>

<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.loadState('main-container')
        } catch (e) {
        }
    </script>

    <%--侧边栏--%>
    <%@include file="common/sidebar.jsp" %>

    <%--main-content内容--%>
    <div class="main-content">
        <div class="main-content-inner">

            <%--修改密码--%>
            <%@include file="common/update-password.jsp" %>

                <div class="modal fade" id="update-password-div" tabindex="-1" role="dialog"
                     aria-labelledby="mySmallModalLabel">
                    <div class="modal-dialog modal-md" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="blue bigger update-password-title">修改登录密码</h4>
                            </div>
                            <form id="update-password-form" class="update-password-form" name="update-password-form">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-xs-1 col-sm-4 col-md-3">
                                        </div>
                                        <div class="col-xs-11 col-sm-8 col-md-9">
                                            <div class="form-group">
                                                <input type="hidden" name="username" class="form-control" value="<shiro:principal/>">
                                                <label for="old_password">原密码<span
                                                        style="color:#F00">*</span></label>
                                                <div>
                                                    <input class="input-xlarge" type="password" id="old_password"
                                                           name="old_password" placeholder="原密码"/>
                                                </div>
                                                <label for="new_password">新密码<span
                                                        style="color:#F00">*</span></label>
                                                <div>
                                                    <input class="input-xlarge" type="password" id="new_password"
                                                           name="new_password" placeholder="新密码"/>
                                                </div>
                                                <label for="confirm_password">确认密码<span
                                                        style="color:#F00">*</span></label>
                                                <div>
                                                    <input class="input-xlarge" type="password" id="confirm_password"
                                                           name="confirm_password" placeholder="再次输入新密码"/>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button class="btn btn-sm" data-dismiss="modal" type="t"><i
                                            class="ace-icon fa fa-times"></i>取消
                                    </button>
                                    <button type="submit" class="btn btn-sm btn-primary update-password-submit">
                                        <i class="ace-icon fa fa-check"></i>确定</button>
                                </div>
                            </form>
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


            <iframe name="mainFrame" id="mainFrame" frameborder="0" src="${path}/main" style="margin:0 auto;width:100%;height:100%;"></iframe>
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-container -->

<!-- 基本脚本 -->
<%@include file="common/basic-scripts.jsp" %>

<!-- 页面特殊插件脚本 -->
<script src="${path}/assets/js/jquery-ui.custom.min.js"></script>
<script src="${path}/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="${path}/assets/js/jquery.sparkline.index.min.js"></script>
<script src="${path}/assets/js/jquery.flot.min.js"></script>
<script src="${path}/assets/js/jquery.flot.pie.min.js"></script>
<script src="${path}/assets/js/jquery.flot.resize.min.js"></script>

<script src="${path}/resource/static/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="${path}/resource/static/jquery-validation/dist/localization/messages_zh.js"></script>

<!-- ace脚本 -->
<%@include file="common/ace-scripts.jsp" %>

<!-- 与此页相关的内联脚本 -->
<script type="text/javascript" src="${path}/assets/custom-js/index.js"></script>
<script>

    var path='${path}';

    $(".sidebar .nav ul li").click(function () {
        var id = $(this).attr("id");
        $(".nav").find("li").removeClass("active");
        $(this).parents("li").siblings().removeClass("open active");
        $(this).parents("li").siblings().removeClass("open");
        $(this).addClass("active");
        $(this).parents("li").addClass("active open");

        $.ajax({
            url: "perm/getPerm.html",
            data: {permId:id},
            type: "POST",
            dataType:"json",
            success: function (data) {
                var newURL=path+data['url'];
                $("#mainFrame").attr('src', newURL);
            },
            error: function () {
                alert("登录超时，请重新登录！")
            }
        });

    });

    // 展示提示框
    function showTips(content){
        $("#op-tips-content").html(content);
        $("#op-tips-dialog").modal("show");
    }

    //修改用户密码
    $(function () {

        jQuery.validator.addMethod("notblank", function(value, element) {
            var pwdblank = /^\S*$/;
            return this.optional(element) ||(pwdblank.test(value));
        }, "密码不可包含空格");

        //本系统未使用
        jQuery.validator.addMethod("userrule", function(value, element) {
            var userblank = /^(?![0-9]+$)(?![a-z]+$)(?![A-Z]+$)[0-9A-Za-z]{5,10}$/;
            return this.optional(element) ||(userblank.test(value));
        }, "需包含数字和大小写字母中至少两种字符的5-10位字符");


        $("#update-password-form").validate({
            submitHandler:function() {
                //当前的form通过ajax方式提交
                var username=$(".update-password-form input[name='username']").val();
                var oldPassword=$(".update-password-form input[name='old_password']").val();
                var newPassword=$(".update-password-form input[name='new_password']").val();
                $.ajax({
                    url:"updatePassword",
                    data:{"username":username,"oldPassword":oldPassword,"newPassword":newPassword},
                    type:"POST",
                    dataType:"json",
                    success:function(data){
                        if(data===1){
                            showTips("恭喜你，密码修改成功！");
                            $(".close-tip").click(function () {
                                    setTimeout(function(){window.location.href="${path}/logout"},300);
                                }
                            )
                        }else if(data===0){
                            showTips("对不起，密码修改失败！");
                        }else if(data===2){
                            showTips("对不起，原密码错误！");
                    }

                    },
                    error:function(data){
                        // $("#add-user-dialog").modal("hide");
                        showTips("对不起，密码修改失败！");
                    }
                });
            },
            errorPlacement: function(error, element) {
                // Append error within linked label
                $(element).closest("form").find("label[for='"+ element.attr("id") + "']" ).append(error);
            },
            errorElement: "span",

            rules: {
                old_password: {
                    required: true,
                    minlength: 5
                },
                new_password: {
                    required: true,
                    minlength: 5,
                    notblank:true
                },
                confirm_password: {
                    required: true,
                    minlength: 5,
                    notblank:true,
                    equalTo: "#new_password"
                }

            },
            messages: {

                old_password: {
                    required: "原密码不能为空",
                    minlength: "密码长度不能小于5个字符"
                },
                new_password: {
                    required: "新密码不能为空",
                    minlength: "密码长度不能小于5个字符"
                },
                confirm_password: {
                    required: "确认密码不能为空",
                    minlength: "密码长度不能小于5个字符",
                    equalTo: "两次密码输入不一致"
                }
            }
        })
    });

</script>
</body>
</html>
