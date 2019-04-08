package com.ims.dao;

import com.ims.model.LoginLog;

import java.util.List;

public interface LoginLogDao {
    void addLoginLog(LoginLog loginLog);
    void deleteLoginLog(Long id);
    LoginLog findLoginLogByUsername(String username);
    List<LoginLog> findAllLoginLog();
}
