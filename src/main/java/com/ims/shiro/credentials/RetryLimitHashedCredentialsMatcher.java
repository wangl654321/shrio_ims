package com.ims.shiro.credentials;

import com.ims.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;

import javax.annotation.Resource;
import java.util.concurrent.atomic.AtomicInteger;

/***
 *
*
* 描    述：密码重试5次次数限制
*
* 创 建 者： @author wl
* 创建时间： 2019/4/8 14:09
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
public class RetryLimitHashedCredentialsMatcher extends HashedCredentialsMatcher {

    protected Logger logger = LogManager.getLogger(this.getClass());

    private Cache<String, AtomicInteger> passwordRetryCache;

    @Resource
    private UserService userService;

    public RetryLimitHashedCredentialsMatcher(CacheManager cacheManager) {
        passwordRetryCache = cacheManager.getCache("passwordRetryCache");
    }

    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {

        String username = (String) token.getPrincipal();
        AtomicInteger retryCount = passwordRetryCache.get(username);
        //	设置密码错误尝试次数
        int maxRetryCount = 5;

        if (retryCount == null) {
            retryCount = new AtomicInteger(0);
            passwordRetryCache.put(username, retryCount);
        }
        if (retryCount.incrementAndGet() > maxRetryCount) {
            throw new ExcessiveAttemptsException();
        }
        //	密码剩余尝试次数
        int remainRetryCount = maxRetryCount - Integer.parseInt(retryCount.toString());
        logger.info("密码剩余尝试次数：" + remainRetryCount);
        //   此处控制密码输错5次后，更改数据库用户状态为锁定！如不需要，可取消（在ecache.xml中将timeToIdleSeconds="0"设置为300，实现5分钟后重试的效果）
        if(remainRetryCount==0){
            userService.updateState(username,2);
            logger.info("用户"+username+"已被锁定！");
        }

        boolean matches = super.doCredentialsMatch(token, info);
        if (matches) {
            passwordRetryCache.remove(username);
        }
        return matches;
    }
}
