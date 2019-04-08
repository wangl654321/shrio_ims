package com.ims.dao;

import com.ims.model.Permission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysPermissionDao {
	void addPermission(Permission permission);
	void deletePermission(Long permissionId);
	Permission findById(Long permId);

	List<Permission> findNavByRoleIdAndPId(@Param("roleId")Long roleId, @Param("pId")Long pId);
	List<Permission> findPermissionsByRoleId(Long roleId);
	List<Permission> findAllPermissions();
    List<Permission> findPermissionsTree();
	void updatePermission(Permission permission);
	
	void deleteRolePermission(Long permissionId);
}
