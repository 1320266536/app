package com.bootdo.app.controller;

import com.bootdo.app.domain.BlcakListDO;
import com.bootdo.app.service.BlcakListService;
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
 * 黑名单
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
 
@Controller
@RequestMapping("/app/blcakList")
public class BlcakListController {
	@Autowired
	private BlcakListService blcakListService;
	
	@GetMapping()
	//@RequiresPermissions("app:blcakList:blcakList")
	String BlcakList(){
	    return "app/blcakList/blcakList";
	}
	
	@ResponseBody
	@GetMapping("/list")
	//@RequiresPermissions("app:blcakList:blcakList")
	public PageUtils list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<BlcakListDO> blcakListList = blcakListService.list(query);
		int total = blcakListService.count(query);
		PageUtils pageUtils = new PageUtils(blcakListList, total);
		return pageUtils;
	}
	
	@GetMapping("/add")
	//@RequiresPermissions("app:blcakList:add")
	String add(){
	    return "app/blcakList/add";
	}

	@GetMapping("/edit/{id}")
	//@RequiresPermissions("app:blcakList:edit")
	String edit(@PathVariable("id") Long id,Model model){
		BlcakListDO blcakList = blcakListService.get(id);
		model.addAttribute("blcakList", blcakList);
	    return "app/blcakList/edit";
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	//@RequiresPermissions("app:blcakList:add")
	public R save( BlcakListDO blcakList){
		if(blcakListService.save(blcakList)>0){
			return R.ok();
		}
		return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	//@RequiresPermissions("app:blcakList:edit")
	public R update( BlcakListDO blcakList){
		blcakListService.update(blcakList);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	//@RequiresPermissions("app:blcakList:remove")
	public R remove( Long id){
		if(blcakListService.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	//@RequiresPermissions("app:blcakList:batchRemove")
	public R remove(@RequestParam("ids[]") Long[] ids){
		blcakListService.batchRemove(ids);
		return R.ok();
	}
	
}
