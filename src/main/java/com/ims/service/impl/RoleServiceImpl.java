package com.ims.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ims.service.RoleService;
import com.ims.dao.SysRoleDao;
import com.ims.model.Role;
import com.ims.model.RolePermission;
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
public class RoleServiceImpl implements RoleService {

	@Resource
	private SysRoleDao roleDao;
	
	@Override
	public Long addRole(Role role, String permissionIds) {
		roleDao.addRole(role);
		if(permissionIds!=null&&permissionIds.length()!=0){
            String [] permIds=permissionIds.split(",");
			for(String permId:permIds){
                Long permissionId=Long.valueOf(permId);
                roleDao.addRolePermission(new RolePermission(role.getId(),permissionId));
			}
		}
        return role.getId();
	}

	@Override
	public void deleteRole(Long roleId) {
		roleDao.deleteUserRole(roleId);
		roleDao.deleteRolePermission(roleId);
		roleDao.deleteRole(roleId);
	}

	@Override
	public void deleteMoreRoles(Long... roleIds) {
		if(roleIds!=null&&roleIds.length>0){
			for(Long roleId:roleIds){
				deleteRole(roleId);
			}
		}
	}

	@Override
	public Role getRoleById(Long roleId) {
		return roleDao.findById(roleId);
	}

	@Override
	public List<Role> getRolesByUsername(String username) {
		return roleDao.findRolesByUsername(username);
	}

	@Override
	public List<Role> getAllRoles() {
		return roleDao.findAllRoles();
	}

	@Override
	public PageInfo<Role> getAllRolesList(Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum,pageSize);
		List<Role> roles=roleDao.findAllRoles();
		return new PageInfo<>(roles);
	}
	@Override
	public void updateRole(Role role,Long...permIds) {
		roleDao.updateRole(role);
		roleDao.deleteRolePermission(role.getId());
		addRolePermissions(role.getId(),permIds);
	}

	@Override
	public void addRolePermissions(Long roleId, Long... permissionIds) {
		if(permissionIds!=null&&permissionIds.length>0){
			for(Long permissionId:permissionIds){
				roleDao.addRolePermission(new RolePermission(roleId,permissionId));
			}
		}
	}

}
