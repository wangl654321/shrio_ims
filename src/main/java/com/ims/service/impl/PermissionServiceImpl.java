package com.ims.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ims.service.PermissionService;
import com.ims.dao.SysPermissionDao;
import com.ims.model.Permission;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/***
 *
*
* 描    述：
*
* 创 建 者： @author wl
* 创建时间： 2019/4/8 13:05
* 创建描述：
*
* 修 改 者：
* 修改时间：
* 修改描述：
*
* 审 核 者：
* 审核时间：
* 审核描述：
*
 */
@Service
public class PermissionServiceImpl implements PermissionService {

	@Resource
	private SysPermissionDao permissionDao;
	
	@Override
	public Long addPermission(Permission permission) {
		permissionDao.addPermission(permission);
		return permission.getId();
	}

	@Override
	public void deletePermission(Long permissionId) {
		permissionDao.deleteRolePermission(permissionId);
		permissionDao.deletePermission(permissionId);
	}

	@Override
	public void deleteMorePermissions(Long... permIds) {
		if(permIds!=null&&permIds.length>0){
			for(Long permId:permIds){
				deletePermission(permId);
			}
		}
	}

	@Override
	public Permission findById(Long permId) {
		return permissionDao.findById(permId);
	}

	@Override
	public List<Permission> getPermissionsByRoleId(Long roleId) {
		return permissionDao.findPermissionsByRoleId(roleId);
	}

	@Override
	public List<Permission> getAllPermissions() {
		return permissionDao.findAllPermissions();
	}

	@Override
	public PageInfo<Permission> getAllPermissionsList(Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum,pageSize);
		List<Permission> Permissions=permissionDao.findAllPermissions();
		return new PageInfo<>(Permissions);
	}

	@Override
	public List<Permission> getPermissionsTree() {
		return permissionDao.findPermissionsTree();
	}

	@Override
	public void updatePermission(Permission permission) {
		permissionDao.updatePermission(permission);
	}

}
