package com.ims.dao;


import com.ims.model.Role;
import com.ims.model.RolePermission;

import java.util.List;

public interface SysRoleDao {
	void addRole(Role role);
	void deleteRole(Long id);
	Role findById(Long id);
	List<Role> findAllRoles();
	void updateRole(Role role);

	List<Role> findRolesByUsername(String username);

	void deleteUserRole(Long roleId);
	void deleteRolePermission(Long roleId);
	void addRolePermission(RolePermission rolePermission);
}
