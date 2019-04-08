package com.ims.shiro.realm;

import com.ims.model.User;
import com.ims.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import javax.annotation.Resource;

/***
 * 
* 
* 描    述：
*
* 创 建 者： @author wl
* 创建时间： 2019/4/8 14:22
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
public class UserRealm extends AuthorizingRealm {

    @Resource
    private UserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String) principals.getPrimaryPrincipal();

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.setRoles(userService.findRolesCodeByUsername(username));
        authorizationInfo.setStringPermissions(userService.findPermissionsCodeByUsername(username));

        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        String username = (String) token.getPrincipal();
        User user = userService.getUserByUsername(username);

        if (user == null) {
            throw new UnknownAccountException();
        }
        // 如果帐号锁定，输出
        if(user.getState()==2){
            throw new DisabledAccountException();
        }

        //  如果帐号未激活，输出
        if(user.getState()==0){
            throw new LockedAccountException();
        }

        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                user.getUsername(),
                user.getPassword(),
                ByteSource.Util.bytes(user.getUsername() + user.getSalt()),
                getName());
        return authenticationInfo;
    }
}
