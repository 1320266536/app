package com.bootdo.app.controller;

import com.bootdo.app.domain.CareMeDO;
import com.bootdo.app.service.CareMeService;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 关注表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
 
@Controller
@RequestMapping("/app/careMe")
public class CareMeController {
	@Autowired
	private CareMeService careMeService;
	
	@GetMapping()
	//@RequiresPermissions("app:careMe:careMe")
	String CareMe(){
	    return "app/careMe/careMe";
	}
	
	@ResponseBody
	@GetMapping("/list")
	//@RequiresPermissions("app:careMe:careMe")
	public PageUtils list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<CareMeDO> careMeList = careMeService.list(query);
		int total = careMeService.count(query);
		PageUtils pageUtils = new PageUtils(careMeList, total);
		return pageUtils;
	}
	
	@GetMapping("/add")
	//@RequiresPermissions("app:careMe:add")
	String add(){
	    return "app/careMe/add";
	}

	@GetMapping("/edit/{id}")
	//@RequiresPermissions("app:careMe:edit")
	String edit(@PathVariable("id") Long id,Model model){
		CareMeDO careMe = careMeService.get(id);
		model.addAttribute("careMe", careMe);
	    return "app/careMe/edit";
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	//@RequiresPermissions("app:careMe:add")
	public R save( CareMeDO careMe){
		if(careMeService.save(careMe)>0){
			return R.ok();
		}
		return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	//@RequiresPermissions("app:careMe:edit")
	public R update( CareMeDO careMe){
		careMeService.update(careMe);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	//@RequiresPermissions("app:careMe:remove")
	public R remove( Long id){
		if(careMeService.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	//@RequiresPermissions("app:careMe:batchRemove")
	public R remove(@RequestParam("ids[]") Long[] ids){
		careMeService.batchRemove(ids);
		return R.ok();
	}
	
}
