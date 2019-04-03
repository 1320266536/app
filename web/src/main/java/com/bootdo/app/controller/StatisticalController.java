package com.bootdo.app.controller;

import com.bootdo.app.domain.StatisticalDO;
import com.bootdo.app.service.StatisticalService;
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
 * 用户统计表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
 
@Controller
@RequestMapping("/app/statistical")
public class StatisticalController {
	@Autowired
	private StatisticalService statisticalService;
	
	@GetMapping()
	//@RequiresPermissions("app:statistical:statistical")
	String Statistical(){
	    return "app/statistical/statistical";
	}
	
	@ResponseBody
	@GetMapping("/list")
	//@RequiresPermissions("app:statistical:statistical")
	public PageUtils list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<StatisticalDO> statisticalList = statisticalService.list(query);
		int total = statisticalService.count(query);
		PageUtils pageUtils = new PageUtils(statisticalList, total);
		return pageUtils;
	}
	
	@GetMapping("/add")
	//@RequiresPermissions("app:statistical:add")
	String add(){
	    return "app/statistical/add";
	}

	@GetMapping("/edit/{id}")
	//@RequiresPermissions("app:statistical:edit")
	String edit(@PathVariable("id") Long id,Model model){
		StatisticalDO statistical = statisticalService.get(id);
		model.addAttribute("statistical", statistical);
	    return "app/statistical/edit";
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	//@RequiresPermissions("app:statistical:add")
	public R save( StatisticalDO statistical){
		if(statisticalService.save(statistical)>0){
			return R.ok();
		}
		return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	//@RequiresPermissions("app:statistical:edit")
	public R update( StatisticalDO statistical){
		statisticalService.update(statistical);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	//@RequiresPermissions("app:statistical:remove")
	public R remove( Long id){
		if(statisticalService.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	//@RequiresPermissions("app:statistical:batchRemove")
	public R remove(@RequestParam("ids[]") Long[] ids){
		statisticalService.batchRemove(ids);
		return R.ok();
	}
	
}
