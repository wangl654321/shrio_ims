package com.ims.controller;


import com.github.pagehelper.PageInfo;
import com.ims.model.Role;
import com.ims.service.PermissionService;
import com.ims.service.RoleService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    protected Logger logger = LogManager.getLogger(this.getClass());
    @Resource
    private RoleService roleService;
    @Resource
    private PermissionService permissionService;

    @RequiresPermissions("role:show")
    @RequestMapping("/list")
    public ModelAndView showRoleList(Integer pageNum, Integer pageSize) {
        pageNum = pageNum == null ? 1 : pageNum;
        pageSize = pageSize == null ? 8 : pageSize;
        PageInfo<Role> roles = roleService.getAllRolesList(pageNum, pageSize);
        ModelAndView mav = new ModelAndView("module/role-list");
        mav.addObject("roles", roles);
        return mav;
    }

    @RequiresPermissions("role:show")
    @RequestMapping("/listPerms")
    @ResponseBody
    public List getPerms() {
        return permissionService.getAllPermissions();
    }

    //得到所有权限/菜单
    @RequiresPermissions("role:show")
    @RequestMapping("/permsTree")
    @ResponseBody
    public List permsTree() {
        return permissionService.getPermissionsTree();
    }

    @RequiresPermissions("role:add")
    @RequestMapping("/add")
    @ResponseBody
    public Role addRole(Role role, String permIds) {
        roleService.addRole(role, permIds);
        return role;
    }

    @RequiresPermissions("role:delete")
    @RequestMapping("/delete")
    @ResponseBody
    public void deleteRole(Long roleId) {
        roleService.deleteRole(roleId);
    }

    @RequiresPermissions("role:delete")
    @RequestMapping("/deleteMore")
    @ResponseBody
    public void deleteMoreRoles(Long... roleIds) {
        roleService.deleteMoreRoles(roleIds);
    }

    @RequiresPermissions("role:show")
    @RequestMapping("/showRolePerms")
    @ResponseBody
    public List showRolePerms(Long roleId) {
        return permissionService.getPermissionsByRoleId(roleId);
    }

    @RequiresPermissions("role:show")
    @RequestMapping("/getRole")
    @ResponseBody
    public Role getRoleById(Long roleId) {
        return roleService.getRoleById(roleId);
    }

    @RequiresPermissions("role:update")
    @RequestMapping("/update")
    @ResponseBody
    public void updateRole(Role role, Long... permIds) {
        roleService.updateRole(role, permIds);
    }
}
