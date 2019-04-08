package com.ims.controller;

import com.ims.model.Role;
import com.ims.model.User;
import com.ims.service.RoleService;
import com.ims.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/testuser")
public class TestController {

    protected Logger logger = LogManager.getLogger(this.getClass());
    @Resource
    private UserService userService;
    @Resource
    private RoleService roleService;

    @RequestMapping("/showroles1")
    @ResponseBody
    public List showRoles(String username) {
        username="pyd";
        return roleService.getRolesByUsername(username);
    }
    public static void main(String[] args) {
        Calendar cd = Calendar.getInstance();
        int m_iEndtday = cd.getActualMaximum(Calendar.DATE);
        System.out.println(m_iEndtday);
        System.out.println(cd);
    }

    @RequestMapping("/testadd")
    @ResponseBody
    public User addUser(User user, Long... roleIds) {
        user.setPassword("123456");
        userService.addUser(user, roleIds);
        return user;
    }

    @RequestMapping("/testupdaterole")
    @ResponseBody()
    public void updateRole(Role role, Long...permIds){
        roleService.updateRole(role,permIds);
    }
}
