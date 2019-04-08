package com.ims.service;


import com.github.pagehelper.PageInfo;
import com.ims.model.Permission;

import java.util.List;

public interface PermissionService {
	Long addPermission(Permission permission);
	void deletePermission(Long permissionId);
	void deleteMorePermissions(Long... permIds);
	Permission findById(Long permId);
	List<Permission> getPermissionsByRoleId(Long roleId);
	List<Permission> getAllPermissions();//用于角色页面获取权限
	PageInfo<Permission> getAllPermissionsList(Integer pageNum, Integer pageSize);//用于权限列表分页展示

    List<Permission> getPermissionsTree();
	void updatePermission(Permission permission);
}
