package com.bootdo.app.controller;

import com.bootdo.app.domain.MobileUserDO;
import com.bootdo.app.service.FilesService;
import com.bootdo.app.service.MobileUserService;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;
import com.bootdo.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 移动端用户表（用于app和小程序）
 *
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */

@Controller
@RequestMapping("/app/mobileUser")
public class MobileUserController {
    @Resource
    private MobileUserService mobileUserService;
    @Resource
    private FilesService filesService;

    @Value("${bootdo.imgHttp}")
    private String imgHttp;

    @GetMapping("/{type}")
        //@RequiresPermissions("app:mobileUser:mobileUser")
    String MobileUser(@PathVariable String type, Model model) {
        model.addAttribute("type", type);
        return "app/mobileUser/mobileUser";
    }

    @ResponseBody
    @GetMapping("/list")
    //@RequiresPermissions("app:mobileUser:mobileUser")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);
        List<MobileUserDO> mobileUserList = mobileUserService.list(query);

        mobileUserList
                .stream().
                filter(mobileUserDO ->
                        StringUtils.isNotBlank(mobileUserDO.getBusinessCard()))
                .forEach(mobileUserDO ->
                        mobileUserDO
                                .setBusinessCard(imgHttp + filesService.get(mobileUserDO.getBusinessCard()).getFilePath()));
        int total = mobileUserService.count(query);
        PageUtils pageUtils = new PageUtils(mobileUserList, total);
        return pageUtils;
    }


    @GetMapping("/edit/{id}")
        //@RequiresPermissions("app:mobileUser:edit")
    String edit(@PathVariable("id") Long id, Model model) {
        MobileUserDO mobileUser = mobileUserService.get(id);
        if (StringUtils.isNotBlank(mobileUser.getIdCardPositive())) {
            mobileUser.setIdCardPositive(imgHttp + filesService.get(mobileUser.getIdCardPositive()).getFilePath());
        }
        if (StringUtils.isNotBlank(mobileUser.getIdCardReverse())) {
            mobileUser.setIdCardPositive(imgHttp + filesService.get(mobileUser.getIdCardReverse()).getFilePath());
        }
        if (StringUtils.isNotBlank(mobileUser.getHandUpIdCard())) {
            mobileUser.setIdCardPositive(imgHttp + filesService.get(mobileUser.getHandUpIdCard()).getFilePath());
        }
        model.addAttribute("mobileUser", mobileUser);
        return "app/mobileUser/edit";
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    //@RequiresPermissions("app:mobileUser:edit")
    public R update(MobileUserDO mobileUser) {
        mobileUserService.update(mobileUser);
        return R.ok();
    }


}
