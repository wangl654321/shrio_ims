package com.ims.controller;

import com.github.pagehelper.PageInfo;
import com.ims.model.LoginLog;
import com.ims.service.LoginLogService;
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
* 创建时间： 2019/4/8 13:11
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
@RequestMapping("/loginLog")
public class LoginLogController {

    protected Logger logger = LogManager.getLogger(this.getClass());

    @Resource
    private LoginLogService loginLogService;

    @RequiresPermissions("loginLog:show")
    @RequestMapping("/list")
    public ModelAndView showLoginLogList(Integer pageNum, Integer pageSize) {
        pageNum = pageNum == null ? 1 : pageNum;
        pageSize = pageSize == null ? 8 : pageSize;
        PageInfo<LoginLog> loginLogs = loginLogService.getAllLoginLog(pageNum, pageSize);
        ModelAndView mav = new ModelAndView("module/login-log");
        mav.addObject("loginLogs", loginLogs);
        return mav;
    }

    @RequiresPermissions("loginLog:delete")
    @RequestMapping("/delete")
    @ResponseBody
    public void deleteLoginLog(Long id) {
        loginLogService.deleteLoginLog(id);
    }

    @RequiresPermissions("loginLog:delete")
    @RequestMapping("/deleteMore")
    @ResponseBody
    public void deleteMoreLoginLog(Long... ids) {
        loginLogService.deleteMoreLoginLog(ids);
    }
}