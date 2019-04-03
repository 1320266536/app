package com.bootdo.system.shiro;

import com.bootdo.app.dao.MobileUserDao;
import com.bootdo.app.domain.MobileUserDO;
import com.bootdo.common.config.ApplicationContextRegister;
import com.bootdo.common.utils.MobileShiroUtils;
import com.bootdo.system.service.MenuService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class WxUserRealm extends AuthorizingRealm {

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
        Long userId = MobileShiroUtils.getUserId();
        MenuService menuService = ApplicationContextRegister.getBean(MenuService.class);
        Set<String> perms = menuService.listPerms(userId);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setStringPermissions(perms);
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        Map<String, Object> map = new HashMap<>(16);
        map.put("openId", username);
        String password = new String((char[]) token.getCredentials());

        MobileUserDao mobileUserDao = ApplicationContextRegister.getBean(MobileUserDao.class);
        // 查询用户信息
        MobileUserDO user = mobileUserDao.list(map).get(0);
        return new SimpleAuthenticationInfo(user, password, getName());
    }

}
