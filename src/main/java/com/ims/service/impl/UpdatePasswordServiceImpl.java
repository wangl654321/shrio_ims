package com.ims.service.impl;

import com.ims.dao.SysUserDao;
import com.ims.model.User;
import com.ims.service.UpdatePasswordService;
import com.ims.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/***
 *
 *
 * 描    述：
 *
 * 创 建 者： @author wl
 * 创建时间： 2019/4/8 13:02
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
public class UpdatePasswordServiceImpl implements UpdatePasswordService {

    protected Logger logger = LogManager.getLogger(this.getClass());

    @Resource
    private UserService userService;
    @Resource
    private SysUserDao userDao;

    private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();

    private String algorithmName = "md5";
    private int hashIterations = 2;

    /**
     * 验证密码（用于用户修改密码对原密码的验证）
     *
     * @param username
     * @param oldPassword
     * @return
     */
    @Override
    public boolean validationPassword(String username, String oldPassword) {

        String algorithmName = "md5";
        int hashIterations = 2;

        User user = userService.getUserByUsername(username);
        String salt = user.getSalt();
        String oldDataBasePassword = user.getPassword();

        String newPassword = new SimpleHash(
                algorithmName,
                oldPassword,
                ByteSource.Util.bytes(username + salt),
                hashIterations).toHex();

        if (oldDataBasePassword.equals(newPassword)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 修改密码
     *
     * @param username
     * @param newPassword
     * @return
     */
    @Override
    public boolean updatePassword(String username, String newPassword) {

        User user = userDao.findUserByUsername(username);
        String salt = randomNumberGenerator.nextBytes().toHex();
        user.setSalt(salt);
        newPassword = new SimpleHash(
                algorithmName,
                newPassword,
                ByteSource.Util.bytes(username + salt),
                hashIterations).toHex();
        user.setPassword(newPassword);

        boolean updatePasswordResult = userDao.updateUser(user);
        if (updatePasswordResult) {
            logger.info("用户" + username + "密码修改成功！");
            return true;
        } else {
            logger.info("用户" + username + "密码修改失败！");
            return false;
        }
    }

}
