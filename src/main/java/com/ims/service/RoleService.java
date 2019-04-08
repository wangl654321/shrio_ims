package com.ims.service;


import com.github.pagehelper.PageInfo;
import com.ims.model.Role;

import java.util.List;

public interface RoleService {
	Long addRole(Role role, String permissionIds);
	void deleteRole(Long roleId);
	void deleteMoreRoles(Long... roleIds);
	Role getRoleById(Long roleId);
	List<Role> getRolesByUsername(String username);
	List<Role> getAllRoles();//用于用户页面获取角色
	PageInfo<Role> getAllRolesList(Integer pageNum, Integer pageSize);//用于角色列表分页展示
	void updateRole(Role role, Long... permIds);

	void addRolePermissions(Long roleId, Long... permissionIds);
}
