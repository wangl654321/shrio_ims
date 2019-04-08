package com.ims.controller;

import com.ims.model.User;
import com.ims.service.SystemService;
import com.ims.service.UpdatePasswordService;
import com.ims.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authc.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

/***
 *
 *
 * 描    述：
 *
 * 创 建 者： @author wl
 * 创建时间： 2019/4/8 13:16
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
public class IndexController {

    protected Logger logger = LogManager.getLogger(this.getClass());

    @Resource
    private UserService userService;

    @Resource
    private SystemService systemService;

    @Resource
    private UpdatePasswordService updatePasswordService;

    @RequestMapping(value = {"/", "/index"})
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("index");
        return mav;
    }

    @RequestMapping("/main")
    public String main() {
        return "module/main";
    }

    @RequestMapping("/unauthorized")
    public String unauthorized() {
        return "unauthorized";
    }

    @RequestMapping("/module-maintenance")
    public String moduleMaintenance() {
        return "module/maintenance";
    }

    @RequestMapping("/website-maintenance")
    public String websiteMaintenance() {
        return "maintenance";
    }

    @RequestMapping("/activation-result")
    public String activationResult() {
        return "/activation-result";
    }

    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest req) {

        String error = null;
        String exceptionClassName = (String) req.getAttribute("shiroLoginFailure");
        if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
            logger.error("用户名不存在!");
            error = "用户名或密码错误!";
        } else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
            logger.error("密码错误!");
            error = "用户名或密码错误!";
        } else if (ExcessiveAttemptsException.class.getName().equals(exceptionClassName)) {
            logger.error("密码尝试次数超限，用户已锁定!");
            error = "密码尝试次数超限，用户已锁定!";
        } else if (LockedAccountException.class.getName().equals(exceptionClassName)) {
            logger.error("帐户未激活!");
            error = "帐户未激活!";
        } else if (DisabledAccountException.class.getName().equals(exceptionClassName)) {
            logger.error("帐户被禁用!");
            error = "帐户被禁用，请联系管理员!";
        } else if (exceptionClassName != null) {
            logger.error("未知错误：" + exceptionClassName);
            error = "未知错误，请联系管理员!";
        }
        ModelAndView mav = new ModelAndView("login");
        mav.addObject("error", error);

        return mav;
    }

    /**
     * 注册验证邮箱是否存在
     *
     * @param email
     * @return
     */
    @RequestMapping("/checkEmail")
    @ResponseBody
    public boolean checkEmail(String email) {
        User user = userService.getUserByEmail(email);
        if (user != null) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 注册验证用户名是否存在
     *
     * @param username
     * @return
     */
    @RequestMapping("/checkUsername")
    @ResponseBody
    public boolean checkUsername(String username) {
        User user = userService.getUserByUsername(username);
        if (user != null) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 注册新用户
     *
     * @param user
     * @return
     */
    @RequestMapping("/signUp")
    @ResponseBody
    public User signUp(User user) {
        Date date = new Date();
        user.setCreateTime(date);
        //设置日期格式（用于日志输出）
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Calendar c = Calendar.getInstance();
        c.setTime(date);
        // 今天+1天
        c.add(Calendar.DAY_OF_MONTH, 1);

        Date activateTime = c.getTime();
        user.setActivateTime(activateTime);

        String code = UUID.randomUUID().toString() + UUID.randomUUID().toString();
        code = code.replaceAll("-", "");
        user.setCode(code);

        user.setState(0);

        // 注册新用户是默认不设置权限，所以权限置空
        Long roleIds = null;
        boolean signUpResult = userService.addUser(user, roleIds);
        if (signUpResult) {
            logger.info("新用户注册：" + user.getUsername() + "，注册时间：" + sdf.format(date) + "激活过期时间:" + sdf.format(activateTime));
            String path = "http://dev.pydyun.com:8080/ims/activation";
            String username = user.getUsername();
            String email = user.getEmail();
            boolean sendSignUpMailResult = systemService.sendSignUpMail(path, username, email, code);
            if (sendSignUpMailResult) {
                logger.info("用户" + username + "邮箱验证邮件发送成功！");
            } else {
                logger.info("用户" + username + "邮箱验证邮件发送失败！");
            }

        }
        return user;
    }

    /**
     * 邮箱激活账号
     *
     * @param code
     * @return
     */
    @RequestMapping("/activation")
    @ResponseBody
    public ModelAndView activation(String code) {
        logger.info("激活码[" + code + "]正在激活用户...");
        String activationResult = userService.processActivate(code);

        ModelAndView mav = new ModelAndView("activation-result");
        mav.addObject("activationResult", activationResult);
        return mav;
    }

    @RequestMapping("/resendEmail")
    @ResponseBody
    public Integer resendEmail(String username) {
        logger.info("正在重发用户" + username + "的激活邮件。");
        String path = "http://dev.pydyun.com:8080/ims/activation";
        User user = userService.getUserByUsername(username);
        if (user != null && user.getState() == 0) {
            String email = user.getEmail();
            String code = user.getCode();
            boolean sendSignUpMailResult = systemService.sendSignUpMail(path, username, email, code);
            if (sendSignUpMailResult) {
                logger.info("用户" + username + "邮箱验证邮件发送成功！");
                return 1;
            } else {
                logger.info("用户" + username + "邮箱验证邮件发送失败！");
                return 2;
            }
        } else {
            logger.info("用户" + username + "未注册或帐号不是未注册状态，不能发送激活邮件！");
            return 0;
        }
    }

    @RequestMapping("/updatePassword")
    @ResponseBody
    public Integer updatePassword(String username, String oldPassword, String newPassword) {
        boolean validationPassword = updatePasswordService.validationPassword(username, oldPassword);
        if (validationPassword) {
            boolean updatePasswordResult = updatePasswordService.updatePassword(username, newPassword);
            if (updatePasswordResult) {
                logger.info("修改密码成功！");
                return 1;
            } else {
                logger.info("修改密码失败！");
                return 0;
            }
        } else {
            logger.info("原密码输入错误！");
            return 2;
        }
    }

}