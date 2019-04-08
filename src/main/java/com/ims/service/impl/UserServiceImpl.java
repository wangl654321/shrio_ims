package com.ims.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ims.dao.SysPermissionDao;
import com.ims.dao.SysRoleDao;
import com.ims.dao.SysUserDao;
import com.ims.model.*;
import com.ims.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/***
 *
 *
 * 描    述：
 *
 * 创 建 者： @author wl
 * 创建时间： 2019/4/8 13:04
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
public class UserServiceImpl implements UserService {
    protected Logger logger = LogManager.getLogger(this.getClass());
    @Resource
    private SysUserDao userDao;
    @Resource
    private SysRoleDao roleDao;
    @Resource
    private SysPermissionDao permissionDAO;
    @Resource
    private PasswordService passwordService;

    @Override
    public boolean addUser(User user, Long... roleIds) {
        passwordService.encryptPassword(user);
        if (userDao.addUser(user)) {
            if (roleIds != null && roleIds.length > 0) {
                for (Long roleId : roleIds) {
                    userDao.addUserRole(new UserRole(user.getId(), roleId));
                }
            }
            return true;
        }
        return false;
    }

    @Override
    public void deleteUser(Long userId) {
        userDao.deleteUserRole(userId);
        userDao.deleteUser(userId);
    }

    @Override
    public void deleteMoreUsers(Long... userIds) {
        if (userIds != null && userIds.length > 0) {
            for (Long userId : userIds) {
                deleteUser(userId);
            }
        }
    }

    @Override
    public User getUserByEmail(String email) {
        return userDao.findUserByEmail(email);
    }

    @Override
    public User getUserByUsername(String username) {
        return userDao.findUserByUsername(username);
    }

    @Override
    public List<User> getAllUsers() {
        return userDao.findAllUsers();
    }

    @Override
    public PageInfo<User> getAllUsersAndRoles(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<User> users = userDao.findAllUsersAndRoles();
        return new PageInfo<>(users);
    }

    @Override
    public void updateUser(User user, Long... roleIds) {
        userDao.updateUser(user);
        userDao.deleteUserRole(user.getId());
        if (roleIds != null && roleIds.length > 0) {
            for (Long roleId : roleIds) {
                userDao.addUserRole(new UserRole(user.getId(), roleId));
            }
        }
    }

    @Override
    public void resetPassword(String username) {
        User user = new User();
        user.setUsername(username);
        user.setPassword("123456");

        PasswordService passwordService = new PasswordService();
        passwordService.encryptPassword(user);

        userDao.resetPassword(user);
        logger.info("用户" + user.getUsername() + "的密码已重置为123456");
    }

    @Override
    public void updateState(String username, Integer state) {
        userDao.updateState(username, state);
        logger.info("用户" + username + "的状态已更改为" + state);
    }

    @Override
    public Set<String> findRolesCodeByUsername(String username) {
        return new HashSet<String>(userDao.findRolesCodeByUsername(username));
    }

    @Override
    public Set<String> findPermissionsCodeByUsername(String username) {
        return new HashSet<String>(userDao.findPermissionsCodeByUsername(username));
    }

    @Override
    public List<Navigation> getNavigationBar(String username) {
        List<Navigation> navigationBar = new ArrayList<Navigation>();
        Navigation navigation;
        List<Role> roles = roleDao.findRolesByUsername(username);
        for (Role role : roles) {
            Long pId = new Long((long) 0);
            Long roleId = role.getId();
            List<Permission> perms = permissionDAO.findNavByRoleIdAndPId(roleId, pId);
            for (Permission perm : perms) {
                navigation = new Navigation();
                navigation.setNavId(perm.getId());
                navigation.setNavigationName(perm.getName());
                navigation.setNavIcon(perm.getIcon());
                navigation.setChildNavigations(permissionDAO.findNavByRoleIdAndPId(roleId, perm.getId()));
                navigationBar.add(navigation);
            }
        }
        logger.info("UserServiceImpl→getNavigationBar已成功获取菜单数据。");
        return navigationBar;
    }

    /**
     * 激活
     *
     * @param code
     * @return
     */
    @Override
    public String processActivate(String code) {
        String activationResult = null;
        User user = userDao.findUserByCode(code);
        if (user != null) {
            //验证用户激活状态
            if (user.getState() == 0) {
                //没激活 //获取当前时间
                Date currentTime = new Date();
                //验证链接是否过期
                if (currentTime.after(user.getCreateTime()) && currentTime.before(user.getActivateTime())) {
                    //验证激活码是否正确
                    if (code.equals(user.getCode())) {
                        //激活成功，并更新用户的激活状态为已激活1
                        //把状态改为激活
                        user.setState(1);
                        //把激活码清空
                        user.setCode("");
                        userDao.updateUser(user);
                        logger.warn("帐号激活成功");
                        activationResult = "帐号激活成功";
                    } else {
                        logger.warn("激活链接不正确");
                        activationResult = "激活链接不正确";
                    }
                } else {
                    logger.warn("激活链接已过期");
                    activationResult = "激活链接已过期";
                }
            } else {
                logger.warn("帐户已是激活状态，请直接登录");
                activationResult = "帐户已是激活状态，请直接登录";
            }
        } else {
            logger.warn("激活链接已失效");
            activationResult = "激活链接已失效";
        }
        return activationResult;

    }
}
