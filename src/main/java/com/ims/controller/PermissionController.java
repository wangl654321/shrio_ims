package com.ims.controller;

import com.github.pagehelper.PageInfo;
import com.ims.model.Permission;
import com.ims.service.PermissionService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/***
 * 
* 
* 描    述：
*
* 创 建 者： @author wl
* 创建时间： 2019/4/8 13:17
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
@RequestMapping("/perm")
public class PermissionController {
	protected Logger logger = LogManager.getLogger(this.getClass());
	@Resource
	private PermissionService permissionService;
	
	@RequiresPermissions("perm:show")
	@RequestMapping("/list")
	public ModelAndView showRoleList(Integer pageNum, Integer pageSize){
		pageNum = pageNum == null ? 1 : pageNum;
		pageSize = pageSize == null ? 8 : pageSize;
		PageInfo<Permission> Permissions = permissionService.getAllPermissionsList(pageNum, pageSize);
		ModelAndView mav=new ModelAndView("module/permission-list");
		mav.addObject("perms", Permissions);
		return mav;
	}

	@RequiresPermissions("perm:add")
	@RequestMapping("/add")
	@ResponseBody
	public Permission addPermission(Permission permission){
		permissionService.addPermission(permission);
		return permission;
	}
	
	@RequiresPermissions("perm:delete")
	@RequestMapping("/delete")
	@ResponseBody
	public void deletePermission(Long permId){
		permissionService.deletePermission(permId);
	}
	
	@RequiresPermissions("perm:delete")
	@RequestMapping("/deleteMore")
	@ResponseBody
	public void deleteMorePerms(Long...permIds){
		permissionService.deleteMorePermissions(permIds);
	}
	
	@RequiresPermissions("perm:show")
	@RequestMapping("/getPerm")
	@ResponseBody
	public Permission getPermById(Long permId){
		return permissionService.findById(permId);
	}

	@RequiresPermissions("perm:update")
	@RequestMapping("/update")
	@ResponseBody
	public void updatePermission(Permission permission){
		permissionService.updatePermission(permission);
	}
}
