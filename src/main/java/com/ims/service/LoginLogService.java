package com.ims.service;

import com.github.pagehelper.PageInfo;
import com.ims.model.LoginLog;

import javax.servlet.http.HttpServletRequest;

public interface LoginLogService {
	void addLoginLog(HttpServletRequest request,String username);//添加用户登录日志
	void deleteLoginLog(Long id);//删除用户登录日志
	void deleteMoreLoginLog(Long... ids);//批量删除用户登录日志

	LoginLog getLoginLogByUsername(String username);//根据用户名获取用户登录日志

	PageInfo<LoginLog> getAllLoginLog(Integer pageNum, Integer pageSize);//获取所有用户登录日志
}
