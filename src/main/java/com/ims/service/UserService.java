package com.ims.service;


import com.github.pagehelper.PageInfo;
import com.ims.model.Navigation;
import com.ims.model.User;

import java.util.List;
import java.util.Set;

public interface UserService {
	boolean addUser(User user, Long...roleIds);//添加用户
	void deleteUser(Long userId);//删除用户
	void deleteMoreUsers(Long...userIds);//批量删除用户
	User getUserByEmail(String email);//根据邮箱获取用户
	User getUserByUsername(String username);//根据用户名获取用户
	List<User> getAllUsers();//获取所有用户详细信息
	PageInfo<User> getAllUsersAndRoles(Integer pageNum, Integer pageSize);//获取所有用户以及角色信息

	void updateUser(User user,Long...roleIds);//更新用户
	void resetPassword(String username);//重置密码
	void updateState(String username,Integer state);//更改用户状态
	Set<String> findRolesCodeByUsername(String username);//根据用户名获取用户所有角色Code
	Set<String> findPermissionsCodeByUsername(String username);//根据用户名获取用户所有权限Code

	List<Navigation> getNavigationBar(String username);//获取导航栏内容
	String processActivate(String code);
}
