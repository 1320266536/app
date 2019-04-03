package com.bootdo.app;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import com.alibaba.fastjson.JSON;
import com.bootdo.app.domain.AlbumDO;
import com.bootdo.app.domain.MobileUserDO;
import com.bootdo.app.service.AlbumService;
import com.bootdo.app.service.FilesService;
import com.bootdo.app.service.MobileUserService;
import com.bootdo.common.utils.*;
import com.bootdo.easemob.entity.EasemobResponse;
import com.bootdo.easemob.util.EasemobUtil;
import com.bootdo.system.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.jasypt.encryption.StringEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/user")
public class UserController extends BaseController {
    @Value("${bootdo.imgHttp}")
    private String imgHttp;
    @Resource
    MobileUserService mobileUserService;
    @Resource
    AlbumService albumService;
    @Resource
    FilesService filesService;


    /**
     * app用户注册
     *E10ADC3949BA59ABBE56E057F20F883E  E10ADC3949BA59ABBE56E057F20F883E
     * @param mobileUserDO
     * @return
     */
    @PostMapping("/userRegister")
    public ResponseResult userRegister(MobileUserDO mobileUserDO) {
        log.info("用户注册:" + JSON.toJSONString(mobileUserDO));
        String result = dealVerCode(mobileUserDO.getPhone(), mobileUserDO.getVerCode());
        if (StringUtils.isBlank(result)) {
            map.clear();
            map.put("phone", mobileUserDO.getPhone());
            if (mobileUserService.list(map).size() > 0) {
                return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "手机号重复");
            }
//            String newPwd = MD5Utils.encrypt(mobileUserDO.getPassword());
//            mobileUserDO.setPassword(newPwd);
            mobileUserDO.setRealFlag(0);
            mobileUserDO.setStatus(1);
            mobileUserDO.setCreateDate(new Date());
            mobileUserDO.setUserFrom("app");
            if (mobileUserService.save(mobileUserDO) > 0) {
                //                绑定环信
                EasemobResponse easemobResponse = EasemobUtil.RegisterUser(mobileUserDO.getId().toString(), mobileUserDO.getPassword());
                if (easemobResponse.getError() != null) {
                    return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, easemobResponse);
                }
                return RestResultGenerator.genResult(HttpStatus.OK, mobileUserDO);
            }
            return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR);
        } else if (result.equals("0")) {
            return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "验证码过期");
        } else {
            return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "验证码错误");
        }

    }

    /**
     * 用户验证码登录
     *
     * @param phone
     * @param code
     * @return
     */
    @PostMapping("/codeLogin/{phone}/{code}")
    public ResponseResult codeLogin(@PathVariable String phone, @PathVariable String code) {
        log.info("验证码登录，手机号：" + phone + "登录", "验证码：" + code);
        String result = dealVerCode(phone, code);
        if (StringUtils.isBlank(result)) {
            MobileUserDO mobileUserDO = mobileUserService.getByPhone(phone);
            if (ObjectUtil.isNull(mobileUserDO)) {
                return RestResultGenerator.genResult(HttpStatus.NON_AUTHORITATIVE_INFORMATION, "该用户未注册");
            }
            //处理图片信息
            dealUserPicInfo(mobileUserDO);

            return login(mobileUserDO);
        } else if (result.equals("0")) {
            return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "验证码过期");
        } else {
            return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "验证码错误");
        }

    }

    /**
     * 密码登录
     *
     * @param phone
     * @param pwd
     * @return
     * 383f0244-c118-44fd-9279-e41aa5f27e8e
     * 383f0244-c118-44fd-9279-e41aa5f27e8e
     */
    @PostMapping("/pwdLogin/{phone}/{pwd}")
    public ResponseResult pwdLogin(HttpServletRequest request, @PathVariable String phone, @PathVariable String pwd) {
        log.info("密码登录，手机号：" + phone);
        System.out.println(JSON.toJSONString(request.getSession().getId()));

        MobileUserDO userDO = mobileUserService.getByPhone(phone);
        if (ObjectUtil.isNull(userDO)) {
            return RestResultGenerator.genResult(HttpStatus.NON_AUTHORITATIVE_INFORMATION, "该用户未注册");
        }
        if (!pwd.equals(userDO.getPassword())) {
            return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "密码错误");
        }

        dealUserPicInfo(userDO);

        return login(userDO);
    }


    /**
     * 用于修改用户密码，用户手机号，忘记密码前的验证码校验
     * 返回用户id
     *
     * @param phone
     * @param code
     * @return
     */
    @PostMapping("/checkVerCode/{phone}/{code}")
    public ResponseResult checkVerCode(@PathVariable String phone, @PathVariable String code) {
        log.info("检验验证码，手机号：" + phone);
        String result = dealVerCode(phone, code);
        if (StringUtils.isBlank(result)) {
            MobileUserDO mobileUserDO = mobileUserService.getByPhone(phone);
            if (ObjectUtil.isNull(mobileUserDO)) {
                return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "该用户未注册");
            }
            return RestResultGenerator.genResult(HttpStatus.OK, mobileUserDO.getId());

        } else if (result.equals("0")) {
            return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "验证码过期");
        } else {
            return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "验证码错误");
        }
    }

    /**
     * 用于用户修改信息
     *
     * @param mobileUserDO
     * @return
     */
    @PostMapping("/modfiyUserInfo")
    public ResponseResult modfiyUserPwd(MobileUserDO mobileUserDO) {
        log.info("用户修改信息" + JSON.toJSONString(mobileUserDO));
//        加密密码
        if (StringUtils.isNotBlank(mobileUserDO.getPassword())) {
            mobileUserDO.setPassword(MD5Utils.encrypt(mobileUserDO.getPassword()));
        }
        mobileUserDO.setPhone(null);
        if (mobileUserService.update(mobileUserDO) > 0) {
            return RestResultGenerator.genResult(HttpStatus.OK);
        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "修改失败");

    }

    /**
     * 微信登陆，传输openid
     *
     * @param openId
     * @return
     */
    @PostMapping("/wxLogin/{openId}")
    public ResponseResult wxLogin(@PathVariable String openId) {
        log.info("微信登陆：openid：" + openId);
        MobileUserDO mobileUserDO = mobileUserService.getByOpenId(openId);
        if (ObjectUtil.isNotNull(mobileUserDO)) {
            dealUserPicInfo(mobileUserDO);
            return login(mobileUserDO);
        }
        return RestResultGenerator.genResult(HttpStatus.NON_AUTHORITATIVE_INFORMATION, "该微信未注册");
    }

    /**
     * 微信注册，若手机号已存在，那么合并信息
     *
     * @param mobileUserDO
     * @return
     */
    @PostMapping("/wxRegister")
    public ResponseResult wxRegister(MobileUserDO mobileUserDO) {
        log.info("微信注册：openid：" + mobileUserDO.getOpenId());
        String result = dealVerCode(mobileUserDO.getPhone(), mobileUserDO.getVerCode());
        if (StringUtils.isBlank(result)) {
            MobileUserDO userDO = mobileUserService.getByPhone(mobileUserDO.getPhone());
            if (ObjectUtil.isNotNull(userDO)) {
                userDO.setOpenId(mobileUserDO.getOpenId());
                if (mobileUserService.update(userDO) > 0) {
                    return RestResultGenerator.genResult(HttpStatus.OK, "已合并该手机号");
                }
            }
//            mobileUserDO.setPassword(MD5Utils.encrypt(mobileUserDO.getPassword()));
            mobileUserDO.setRealFlag(0);
            mobileUserDO.setStatus(1);
            mobileUserDO.setCreateDate(new Date());
            mobileUserDO.setUserFrom("app");
            if (mobileUserService.save(mobileUserDO) > 0) {
                //                绑定环信
//                EasemobResponse easemobResponse = EasemobUtil.RegisterUser(mobileUserDO.getId().toString(), mobileUserDO.getPassword());
//                if (easemobResponse.getError() != null) {
//                    return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, easemobResponse);
//                }
                dealUserPicInfo(mobileUserDO);
                return RestResultGenerator.genResult(HttpStatus.OK, mobileUserDO);
            }
        } else if (result.equals("0")) {
            return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "验证码过期");
        } else {
            return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "验证码错误");
        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "注册失败");

    }

    /**
     * 检验用户是否存在
     *
     * @param phone
     * @return
     */
    @PostMapping("/checkPhoneExist/{phone}")
    public ResponseResult checkPhoneExist(@PathVariable String phone) {
        log.info("检验手机号重复" + phone);
        if (ObjectUtil.isNotNull(mobileUserService.getByPhone(phone))) {
            return RestResultGenerator.genResult(HttpStatus.OK, 1);
        }
        return RestResultGenerator.genResult(HttpStatus.OK, 0);
    }



    /**
     * 查看当前用户的图集
     *
     * @return
     */
    @PostMapping("/album/albumList")
    public ResponseResult albumList() {
        map.clear();
        map.put("userId", MobileShiroUtils.getUserId());
        map.put("sort", "sort");
        map.put("order", "asc");
        List<AlbumDO> list = albumService.list(map);
        if (CollectionUtil.isNotEmpty(list)) {
            list.forEach(albumDO -> albumDO.setPicId(imgHttp + filesService.get(albumDO.getPicId()).getFilePath()));
            return RestResultGenerator.genResult(HttpStatus.OK, list);
        }
        return RestResultGenerator.genResult(HttpStatus.OK, "暂无");
    }

    /**
     * 用户修改图集
     * 先清空之前所有的图片，重新保存
     *
     * @param list
     * @return
     */
    @PostMapping("/album/modifyUserAlbum")
    public ResponseResult albumList(List<AlbumDO> list) {
        if (CollectionUtil.isNotEmpty(list)) {
            albumService.removeByUserId(MobileShiroUtils.getUserId());
            list.forEach(albumDO -> {
                albumDO.setUserId(MobileShiroUtils.getUserId());
                albumService.save(albumDO);
            });
            return RestResultGenerator.genResult(HttpStatus.OK, "修改成");

        }
        return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "至少新增一张图集");

    }



    /**
     * 处理验证码信息
     *
     * @param phone
     * @param code
     */
    private String dealVerCode(String phone, String code) {
        String verCode = getRedisClient().get(phone + (new SimpleDateFormat("yyyyMMddhh").format(new Date())));
        if (StringUtils.isBlank(verCode)) {
//            验证码空了，说明失效了
            return "0";
        }
        if (!verCode.equals(code)) {
//            验证码不对
            return "1";
        }
//        没卵事
        return null;
    }

    /**
     * 处理登录信息
     *
     * @param mobileUserDO
     * @return ResponseResult
     */
    private ResponseResult login(MobileUserDO mobileUserDO) {
        try {
            UsernamePasswordToken token = new UsernamePasswordToken(mobileUserDO.getPhone(), mobileUserDO.getPassword());
            token.setRememberMe(true);
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
        } catch (Exception e) {
            log.error(e.getMessage());
            return RestResultGenerator.genResult(HttpStatus.INTERNAL_SERVER_ERROR, "登录失败");
        }

        log.debug(JSON.toJSONString(mobileUserDO));
        return RestResultGenerator.genResult(HttpStatus.OK, mobileUserDO);
    }

}
