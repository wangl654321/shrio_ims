$(function ($) {
    $(document).on('click', '.toolbar a[data-target]', function (e) {
        e.preventDefault();
        var target = $(this).data('target');
        $('.widget-box.visible').removeClass('visible');//hide others
        $(target).addClass('visible');//show target
    });
});

//自定义点击重发邮件链接时，切换到重发邮件页面
$(function ($) {
    $(".login-error-tip").on('click', 'a[data-target]', function (e) {
        e.preventDefault();
        var target = $(this).data('target');
        $('.widget-box.visible').removeClass('visible');//hide others
        $(target).addClass('visible');//show target
    });
});


// 展示提示框
function showTips(content){
    $("#op-tips-content").html(content);
    $("#op-tips-dialog").modal("show");
}

//找回密码（重置密码）
$(function () {
// 在键盘按下并释放及提交后验证提交表单
    $("#retrieve-password-form").validate({
        submitHandler :function() {  //验证通过后的执行方法
            //当前的form通过ajax方式提交
            $.ajax({
                url:"signUp",
                data:$(".retrieve-password-form").serialize(),
                type:"POST",
                dataType:"json",
                success:function(data){
                    // $("#add-user-dialog").modal("hide");
                    showTips("恭喜你，密码成功！");

                    $(".close-tip").click(function () {
                        $('.widget-box.visible').removeClass('visible');//hide others
                        $('#login-box').addClass('visible');//show target
                        }
                    )
                },
                error:function(data){
                    // $("#add-user-dialog").modal("hide");
                    showTips("对不起，密码失败！");
                }
            });
        },

        rules: {
            email: {
                required: true,
                email: true
            }
        },
        messages: {
            email: {
                required: "电子邮箱不能为空",
                email: "请输入一个正确的邮箱"
            }
        }
    });
});

//重发激活邮件
$(function () {
// 在键盘按下并释放及提交后验证提交表单
    jQuery.validator.addMethod("notblank", function(value, element) {
        var pwdblank = /^\S*$/;
        return this.optional(element) ||(pwdblank.test(value));
    }, "密码不可包含空格");

    //本系统未使用
    jQuery.validator.addMethod("userrule", function(value, element) {
        var userblank = /^(?![0-9]+$)(?![a-z]+$)(?![A-Z]+$)[0-9A-Za-z]{5,10}$/;
        return this.optional(element) ||(userblank.test(value));
    }, "需包含数字和大小写字母中至少两种字符的5-10位字符");

    $("#resend-email-form").validate({
        submitHandler :function() {  //验证通过后的执行方法
            //当前的form通过ajax方式提交
            var username=$(".resend-email-form input[type='text']").val();
            $.ajax({
                url:"resendEmail",
                data:{"username":username},
                type:"POST",
                dataType:"json",
                success:function(data){
                    if(data===1){
                        showTips("激活邮件已发送至帐号绑定邮箱，请注意查收！");
                        $(".close-tip").click(function () {
                                $('.widget-box.visible').removeClass('visible');//hide others
                                $('#login-box').addClass('visible');//show target
                            }
                        )
                    }else if(data===2){
                        showTips("对不起，激活邮件发送失败，请联系管理员！");
                    }else if(data===0){
                        showTips("对不起，激活邮件发送失败，请检查用户名是否正确以及帐户状态！");
                    }

                },
                error:function(data){
                    showTips("对不起，发送激活邮件请求失败，请联系管理员！");
                }
            });
        },

        rules: {
            username: {
                required: true
            }
        },
        messages: {
            username: {
                required: "请输入待激活用户名",
            }
        }
    });
});

// 注册用户
$(function () {
// 在键盘按下并释放及提交后验证提交表单
    $("#sign-up-form").validate({
        submitHandler :function() {  //验证通过后的执行方法
            //当前的form通过ajax方式提交
            $.ajax({
                url:"signUp",
                data:$(".sign-up-form").serialize(),
                type:"POST",
                dataType:"json",
                success:function(data){
                    // $("#add-user-dialog").modal("hide");
                    showTips("恭喜你，注册成功！系统已向您的邮箱发送验证邮件，请注意查收并激活帐号！");
                    $(".close-tip").click(function () {
                            $('.widget-box.visible').removeClass('visible');//hide others
                            $('#login-box').addClass('visible');//show target
                        }
                    )
                },
                error:function(data){
                    // $("#add-user-dialog").modal("hide");
                    showTips("对不起，注册失败！");
                }
            });
        },
        errorPlacement: function(error, element) {
            // Append error within linked label
            $(element).closest("form").find("label[for='"+ element.attr("id") + "']" ).append(error);
        },
        errorElement: "span",

        rules: {
            email: {
                required: true,
                email: true,
                remote: {
                    url: "checkEmail",     //后台处理程序
                    type: "post",               //数据发送方式
                    dataType: "json",           //接受数据格式
                    data: {                     //要传递的数据
                        email: function() {
                            return $("#email").val();
                        }
                    }
                }
            },
            username: {
                required: true,
                minlength: 3,
                remote: {
                    url: "checkUsername",     //后台处理程序
                    type: "post",               //数据发送方式
                    dataType: "json",           //接受数据格式
                    data: {                     //要传递的数据
                        username: function() {
                            return $("#username").val();
                        }
                    }
                }
            },
            password: {
                required: true,
                minlength: 5
            },
            confirm_password: {
                required: true,
                minlength: 5,
                equalTo: "#password"
            },
            agree_ra: "required"
        },
        messages: {
            email: {
                required: "邮箱不能为空",
                email: "请输入一个正确的邮箱",
                remote: "邮箱地址已经被注册，请更换其他邮箱"
            },

            username: {
                required: "用户名不能为空",
                minlength: "用户名至少3个字符",
                remote: "用户名已经被注册"
            },
            password: {
                required: "密码不能为空",
                noblank:true,
                minlength: "密码长度不能小于5个字符"
            },
            confirm_password: {
                required: "确认密码不能为空",
                minlength: "密码长度不能小于5个字符",
                noblank:true,
                equalTo: "两次密码输入不一致"
            },

            agree_ra: "请阅读并同意本协议"
        }
    });
});

$('[data-rel=tooltip]').tooltip();
$('[data-rel=popover]').popover({html: true});

$("#sign-on-ra").on(ace.click_event, function() {
    bootbox.dialog({
        message: "<h3 class='text-center header'>《信息管理系统用户注册协议》</h3>" +
        " <div class='space-6'></div>" +
        "            <div>" +
        "            <p>欢迎您访问信息管理系统！注册前请仔细阅读以下协议内容：</p>" +
        "            <p>本用户注册协议（以下简称“本协议”）是由用户（“您”）与信息管理系统（以下简称“本系统”）就本系统提供的服务所订立的相关权利和义务的规范，本服务条款对您和本系统均具有法律约束力。本系统发布的相关政策、规定构成本协议的一部分，您须同时遵守。" +
        "            </p>" +
        "            <h5>一、网站使用说明：</h5>" +
        "               <p> 1、 本系统是由东云工作室根据中华人民共和国法律成立的网站。<br>" +
        "                2、 本系统为您提供交流沟通和参与互动的平台服务。<br>" +
        "                3、 本系统的服务是通过互联网提供的，因此，您必须：<br>" +
        "                1）自行配备上网的所需设备，包括个人电脑、调制解调器或其它必备上网装置；<br>" +
        "                2）自行负担个人上网所支付的与此服务有关的网络费用及其他相关费<br>" +
        "                4、 同时，为了准确优质地向您提供服务，请确保：<br>" +
        "                1）注册资料的真实、准确、详尽；<br>" +
        "                2）注册信息如有变更，请及时更新。<br>" +
        "                5、 因本系统的扩展或者服务深化，本协议可能会不时更新，请予以关注，您同时认可更新的协议对您的约束力。" +
        "            </p>" +
        "                <h5>二、注册用户权利：</h5>" +
        "                <p>1. 东云工作室遵守国家法律法规，保护每一位注册用户的合法权利公平对待每一位注册用户，所有用户一律平等。<br>" +
        "                2. 东云工作室遵守对您的所有承诺，如有本系统赠送的优惠券和积分等，在活动有效期内，东云工作室将严格按照活动规则执行。<br>" +
        "                3. 东云工作室尊重用户的肖像权及对发布内容的所有权，未经您的同意，东云工作室将不用作任何商业用途。<br>" +
        "                4. 东云工作室尊重用户的隐私权，您的个人信息只有在下述情况中部分或全部被披露：<br>" +
        "                1) 经您同意，向第三人披露。<br>" +
        "                2) 您与任何第三人产生权利纠纷，为便于双方处理纠纷而作的相应披露。<br>" +
        "                3) 根据法律的有关规定，或者行政或司法机构的要求，向第三人或者行政、司法机构披露。<br>" +
        "                4) 如果您出现违反中国有关法律或者网站政策的情况，需要向第三方披露。<br>" +
        "                5) 为提供你所要求的产品或服务，而必须和第三方分享的您的个人信息。<br>" +
        "                6) 其他本系统根据法律或者网站政策认为合适的披露。" +
        "                </p>" +
        "            <h5>三、注册用户义务：</h5>" +
        "               <p> 1. 用户名、昵称和头像的注册与使用应符合网络道德，遵守中华人民共和国的相关法律法规；用户名、昵称和头像中不能含有威胁、淫秽、漫骂、非法、侵害他人权益或者可能让人产生上述联想的的文字或图片。<br>" +
        "                2. 注册成功后，您必须保护好自己的帐号和密码，因您本人泄露而造成的任何损失由会员本人负责。同时，通过您的个人账户在本系统上发生的所有活动产生的责任，应由您承担。<br>" +
        "                3. 原则上，您仅可以注册一个账户，对于您恶意超出数量注册的账户，本系统有权予以封闭，造成的任何损失或责任，应由您自行承担。<br>" +
        "                4. 您不得冒充他人注册本系统，也不得盗用他人帐号，如有该行为，造成的任何法律责任将由您自行承担。<br>" +
        "                5. 您须对在本系统的活动及发布内容持客观和公正的态度并不得发布含有有损东云工作室形象或违反相关活动精神的内容。<br>" +
        "                6. 您不得利用本站进行违法犯罪、危害国家安全、泄露国家秘密、侵犯他人合法权益的活动并不得利用本站制作、复制和传播下列信息：<br>" +
        "                1) 煽动抗拒、破坏宪法和法律、行政法规实施的；<br>" +
        "                2) 煽动颠覆国家政权，推翻社会主义制度的；<br>" +
        "                3) 煽动分裂国家、破坏国家统一的；<br>" +
        "                4) 煽动民族仇恨、民族歧视，破坏民族团结的；<br>" +
        "                5) 捏造或者歪曲事实，散布谣言，扰乱社会秩序的；<br>" +
        "                6) 宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；<br>" +
        "                7) 公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；<br>" +
        "                8) 侵犯任何个人或实体的隐私、肖像权、版权、商标权、合同权利或其他任何合法权利的；<br>" +
        "                9) 损害国家机关信誉的；<br>" +
        "                10) 含有病毒的；<br>" +
        "                11) 含有商业广告的；<br>" +
        "                12) 其他违反宪法、法律或行政法规的信息。<br>" +
        "                6、 对于转载的信息，请您写明转载和出处，标明作者，尊重作者的版权。<br>" +
        "                7、 未经本站的授权或许可，任何注册会员不得借用本站的名义从事任何商业活动，也不得将本站作为从事商业活动的场所、平台或其他任何形式的媒介；禁止将本站用作从事各种非法活动的场所、平台或者其他任何形式的媒介。<br>" +
        "                8、 对侵害东云工作室用户权益的信息，请向网站管理员举报。<br>" +
        "                对于本系统禁止发布的内容，一经发现，本系统有权将其进行编辑或者直接删除，如有触犯法律的行为，将移送司法机关处理。" +
        "            </p>" +
        "                <h5>四、 知识产权：</h5>" +
        "                <p>1、 本系统上的所有内容，如商标、文字、图片、标识、广告都是东云工作室或者其内容提供者的排他性财产，您不可以未经授权擅自使用，同时，这些内容不可以被用于任何可能引起消费者对东云工作室的服务引起混淆或者贬低的商品或者服务上。<br>" +
        "                2、 未经东云工作室书面同意，您不可以用任何方式对本系统内容进行修改，也不可复制、下载本系统网页内容、数据、信息进行转售或商业利用。" +
        "            </p>" +
        "               <h5> 五、 免责条款：</h5>" +
        "                <p>1、 虽然本系统已将所有信息和资料进行过认真编辑与审查，但是仍然可能存在错误或不准确的信息。本系统不保证以下各项：信息和资料中包含的功能将不受干扰或没有错误；信息和资料将符合用户的特定要求；缺陷将被纠正；本系统或提供本系统的服务器没有病毒或其它有害成分；通过本系统传送的讯息将能维持保密。就本系统中信息和资料的正确性、准确性、可靠性或其它方面而言，东云工作室概不对本系统中的信息和资料的使用或使用后果做出任何保证。<br>" +
        "                2、 对于因病毒、系统缺陷、人对计算机系统的作为或不作为、电话线、硬件、软件、程序出错或其它由于使用本系统而引起的计算机传输或网络连接错误、失败或延迟造成的损害，本系统也不承担责任，即便这些损害是由于用户登陆或使用本系统。东云工作室不保证本系统的使用是持续的、不中断的或安全的。<br>" +
        "                3、 由于您的的保管疏忽导致帐号、密码遭他人非法使用。东云工作室不承担任何法律责任。<br>" +
        "                4、 东云工作室对本系统任何可能含有的第三方网站的内容、隐私权政策或操作不享有控制权，亦不承担任何责任。此外，东云工作室亦无法审查或编辑任何第三方网站的相关内容。东云工作室概不负责因您使用本系统上连接的第三方网站所产生的任何全部责任。因此，我们希望您留意自己何时离开本系统并阅读您所访问的任一其他网站的使用条款与隐私权政策。" +
        "                </p>" +
        "                   <h5> 六、 其他：</h5>" +
        "                <p>1、 本协议的订立、执行、解释及争议解决均适用中华人民共和国法律（不包括香港、澳门、台湾地区）。本协议条款具有可分性，部分无效不影响其它部分效力。<br>" +
        "                2、 如果您是本系统的注册用户，本协议条款将对您持续有效，有效期至您注销或者被关闭账户后，但知识产权相关条款在此后继续有效。<br>" +
        "                3、 如有任何争议，应先友好协商解决，协商不成，应提交北京仲裁委员会仲裁。" +
        "            </p>",
        buttons:
            {
                "success" :
                    {
                        "label" : "同意",
                        "className" : "btn-sm btn-success btn-agree-ra",
                        "callback": function() {
                            // 点击同意协议后自动点选
                            $("input[name='agree_ra']").prop("checked",true);
                        }
                    },
                "danger" :
                    {
                        "label" : "不同意",
                        "className" : "btn-sm btn-danger btn-refuse-ra",
                        "callback": function() {
                            // 点击不同意协议后自动取消点选
                            $("input[name='agree_ra']").prop("checked",false);
                        }
                    }
            }
    });
});