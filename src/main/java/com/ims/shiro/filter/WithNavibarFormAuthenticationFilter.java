package com.ims.shiro.filter;


import com.ims.service.LoginLogService;
import com.ims.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public class WithNavibarFormAuthenticationFilter extends FormAuthenticationFilter {
    protected Logger logger = LogManager.getLogger(this.getClass());
	@Resource
	private UserService userService;
	@Resource
	private LoginLogService loginLogService;
	@Override
	protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request,
                                     ServletResponse response) throws Exception {
		HttpServletRequest httpReq=(HttpServletRequest)request;
        HttpSession session=((HttpServletRequest) request).getSession();

		String username=(String) SecurityUtils.getSubject().getPrincipal();
		List navigationBar=userService.getNavigationBar(username);
		httpReq.getSession().setAttribute("navBar", navigationBar);

        session.setAttribute("username",username);
        //Begin：将用户登录信息写入数据库，如不需要写入，可删除此部分
        loginLogService.addLoginLog(httpReq,username);
        //End：将用户登录信息写入数据库，如不需要写入，可删除此部分
        logger.info("用户"+username+"已成功登录，登录数据已写入数据库。");

		return super.onLoginSuccess(token, subject, request, response);
	}

}
