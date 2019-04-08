package com.ims.controller;

import com.github.pagehelper.PageInfo;
import com.ims.model.Role;
import com.ims.model.User;
import com.ims.service.RoleService;
import com.ims.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/***
 *
 *
 * 描    述：
 *
 * 创 建 者： @author wl
 * 创建时间： 2019/4/8 13:13
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
@Controller
@RequestMapping("/user")
public class UserController {
    protected Logger logger = LogManager.getLogger(this.getClass());

    @Resource
    private UserService userService;
    @Resource
    private RoleService roleService;

    @RequiresPermissions("user:show")
    @RequestMapping("/list")
    public ModelAndView showUserList(Integer pageNum, Integer pageSize) {
        pageNum = pageNum == null ? 1 : pageNum;
        pageSize = pageSize == null ? 8 : pageSize;
        PageInfo<User> users = userService.getAllUsersAndRoles(pageNum, pageSize);
        ModelAndView mav = new ModelAndView("module/user-list");
        mav.addObject("users", users);
        return mav;
    }

    @RequiresPermissions("user:add")
    @RequestMapping("/add")
    @ResponseBody
    public User addUser(User user, Long... roleIds) {
        Date date = new Date();
        user.setCreateTime(date);
        //设置日期格式（用于日志输出）
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        userService.addUser(user, roleIds);
        logger.info("添加新用户：" + user.getUsername() + "，时间：" + sdf.format(date));
        return user;
    }


    /**
     * 检测用户是否有权限（此方法不可加@RequiresPermissions）
     *
     * @param username
     * @return
     */
    @RequestMapping("/checkRoles")
    @ResponseBody
    public Integer checkRoles(String username) {
        List<Role> roleList = roleService.getRolesByUsername(username);
        if (roleList.size() == 0) {
            logger.error("检测到用户名：" + username + "没有角色及权限!");
            return 0;
        } else {
            return 1;
        }
    }

    @RequiresPermissions("user:show")
    @RequestMapping("/showRoles")
    @ResponseBody
    public List showRoles(String username) {
        return roleService.getRolesByUsername(username);
    }

    @RequiresPermissions("user:show")
    @RequestMapping("/getUser")
    @ResponseBody
    public User getUser(String username) {
        return userService.getUserByUsername(username);
    }

    @RequestMapping("/listRoles")
    @ResponseBody
    public List getRoles() {
        return roleService.getAllRoles();
    }

    @RequiresPermissions("user:delete")
    @RequestMapping("/delete")
    @ResponseBody
    public void deleteUser(Long userId) {
        userService.deleteUser(userId);
    }

    @RequiresPermissions("user:delete")
    @RequestMapping("/deleteMore")
    @ResponseBody
    public void deleteMoreUsers(Long... userIds) {
        userService.deleteMoreUsers(userIds);
    }

    @RequiresPermissions("user:update")
    @RequestMapping("/update")
    @ResponseBody
    public void updateUser(User user, Long... roleIds) {
        userService.updateUser(user, roleIds);
    }

    @RequiresPermissions("user:reset")
    @RequestMapping("/resetPassword")
    @ResponseBody
    public void resetPassword(String username) {
        logger.info("正在重置用户" + username + "的密码。");
        userService.resetPassword(username);
    }
}