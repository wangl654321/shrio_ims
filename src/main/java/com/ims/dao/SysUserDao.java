package com.ims.dao;

import com.ims.model.User;
import com.ims.model.UserRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysUserDao {
	boolean addUser(User user);
	void deleteUser(Long id);
	User findUserByEmail(String email);
	User findUserByCode(String code);
	User findUserByUsername(String username);
	List<User> findAllUsers();

	List<User> findAllUsersAndRoles();

	boolean updateUser(User user);

	void resetPassword(User user);
	void updateState(@Param("username")String username, @Param("state")Integer state);

	void deleteUserRole(Long userId);
	void addUserRole(UserRole userRole);
	
	List<String> findRolesCodeByUsername(String username);
	List<String> findPermissionsCodeByUsername(String username);
}
