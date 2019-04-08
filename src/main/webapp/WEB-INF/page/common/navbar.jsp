<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<div id="navbar" class="navbar navbar-default ace-save-state navbar-fixed-top">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">切换栏</span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>
        </button>

        <div class="navbar-header pull-left">
            <a href="${path}/index" class="navbar-brand">
                <small>
                    <i class="fa fa-leaf"></i>
                    ${title}
                </small>
            </a>
        </div>

        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">

                <!--
                <li class="grey dropdown-modal">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="ace-icon fa fa-tasks"></i>
                        <span class="badge badge-grey">4</span>
                    </a>

                    <ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
                        <li class="dropdown-header">
                            <i class="ace-icon fa fa-check"></i>
                            4项任务
                        </li>

                        <li class="dropdown-content">
                            <ul class="dropdown-menu dropdown-navbar">
                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">软件更新</span>
                                            <span class="pull-right">65%</span>
                                        </div>

                                        <div class="progress progress-mini">
                                            <div style="width:65%" class="progress-bar"></div>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">硬件升级</span>
                                            <span class="pull-right">35%</span>
                                        </div>

                                        <div class="progress progress-mini">
                                            <div style="width:35%" class="progress-bar progress-bar-danger"></div>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">单元测试</span>
                                            <span class="pull-right">15%</span>
                                        </div>

                                        <div class="progress progress-mini">
                                            <div style="width:15%" class="progress-bar progress-bar-warning"></div>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">错误修复</span>
                                            <span class="pull-right">90%</span>
                                        </div>

                                        <div class="progress progress-mini progress-striped active">
                                            <div style="width:90%" class="progress-bar progress-bar-success"></div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="dropdown-footer">
                            <a href="#">
                                查看任务详情
                                <i class="ace-icon fa fa-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="purple dropdown-modal">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="ace-icon fa fa-bell icon-animated-bell"></i>
                        <span class="badge badge-important">8</span>
                    </a>

                    <ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
                        <li class="dropdown-header">
                            <i class="ace-icon fa fa-exclamation-triangle"></i>
                            8条通知
                        </li>

                        <li class="dropdown-content">
                            <ul class="dropdown-menu dropdown-navbar navbar-pink">
                                <li>
                                    <a href="#">
                                        <div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-pink fa fa-comment"></i>
														新评论
													</span>
                                            <span class="pull-right badge badge-info">+12</span>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <i class="btn btn-xs btn-primary fa fa-user"></i>
                                        新用户注册...
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>
														新订单
													</span>
                                            <span class="pull-right badge badge-success">+8</span>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-info fa fa-twitter"></i>
														粉丝
													</span>
                                            <span class="pull-right badge badge-info">+11</span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="dropdown-footer">
                            <a href="#">
                                查看所有通知
                                <i class="ace-icon fa fa-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="green dropdown-modal">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
                        <span class="badge badge-success">5</span>
                    </a>

                    <ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
                        <li class="dropdown-header">
                            <i class="ace-icon fa fa-envelope-o"></i>
                            5条消息
                        </li>

                        <li class="dropdown-content">
                            <ul class="dropdown-menu dropdown-navbar">
                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="assets/images/avatars/avatar.png" class="msg-photo"
                                             alt="Alex's Avatar"/>
                                        <span class="msg-body">
													<span class="msg-title">
														<span class="blue">小明:</span>
														这是一个不错的模板呦...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>刚刚</span>
													</span>
												</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="assets/images/avatars/avatar3.png" class="msg-photo"
                                             alt="Susan's Avatar"/>
                                        <span class="msg-body">
													<span class="msg-title">
														<span class="blue">苏珊:</span>
														该模板可到东云网进行下载...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>20分钟前</span>
													</span>
												</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="assets/images/avatars/avatar4.png" class="msg-photo"
                                             alt="Bob's Avatar"/>
                                        <span class="msg-body">
													<span class="msg-title">
														<span class="blue">鲍勃:</span>
														这个模板是基于Bootstrap开发的...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>下午3:15</span>
													</span>
												</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="assets/images/avatars/avatar2.png" class="msg-photo"
                                             alt="Kate's Avatar"/>
                                        <span class="msg-body">
													<span class="msg-title">
														<span class="blue">凯特:</span>
														这个留言的功能很不错呢...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>下午1:33</span>
													</span>
												</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="assets/images/avatars/avatar5.png" class="msg-photo"
                                             alt="Fred's Avatar"/>
                                        <span class="msg-body">
													<span class="msg-title">
														<span class="blue">福瑞德:</span>
														精美的模板...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>上午10:09</span>
													</span>
												</span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="dropdown-footer">
                            <a href="inbox.html">
                                查看所有消息
                                <i class="ace-icon fa fa-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>
                -->

                <li class="light-blue dropdown-modal">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="${path}/assets/images/avatars/user.jpg" alt="用户头像"/>
                        <span class="user-info">
									<small>欢迎,</small>
									<shiro:principal/>
								</span>

                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="javascript:alert('预留功能,待开发');">
                                <i class="ace-icon fa fa-cog"></i>
                                设置
                            </a>
                        </li>

                        <li>
                            <a href="#update-password-div" data-toggle="modal">
                                <i class="ace-icon fa fa-key"></i>
                                修改密码
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="${path}/logout">
                                <i class="ace-icon fa fa-power-off"></i>
                                退出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div><!-- /.navbar-container -->
</div>

