package com.bootdo.app.controller;

import com.bootdo.app.domain.VcardFloderDO;
import com.bootdo.app.service.VcardFloderService;
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
 * 名片夹
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
 
@Controller
@RequestMapping("/app/vcardFloder")
public class VcardFloderController {
	@Autowired
	private VcardFloderService vcardFloderService;
	
	@GetMapping()
	//@RequiresPermissions("app:vcardFloder:vcardFloder")
	String VcardFloder(){
	    return "app/vcardFloder/vcardFloder";
	}
	
	@ResponseBody
	@GetMapping("/list")
	//@RequiresPermissions("app:vcardFloder:vcardFloder")
	public PageUtils list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<VcardFloderDO> vcardFloderList = vcardFloderService.list(query);
		int total = vcardFloderService.count(query);
		PageUtils pageUtils = new PageUtils(vcardFloderList, total);
		return pageUtils;
	}
	
	@GetMapping("/add")
	//@RequiresPermissions("app:vcardFloder:add")
	String add(){
	    return "app/vcardFloder/add";
	}

	@GetMapping("/edit/{id}")
	//@RequiresPermissions("app:vcardFloder:edit")
	String edit(@PathVariable("id") Long id,Model model){
		VcardFloderDO vcardFloder = vcardFloderService.get(id);
		model.addAttribute("vcardFloder", vcardFloder);
	    return "app/vcardFloder/edit";
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	//@RequiresPermissions("app:vcardFloder:add")
	public R save( VcardFloderDO vcardFloder){
		if(vcardFloderService.save(vcardFloder)>0){
			return R.ok();
		}
		return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	//@RequiresPermissions("app:vcardFloder:edit")
	public R update( VcardFloderDO vcardFloder){
		vcardFloderService.update(vcardFloder);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	//@RequiresPermissions("app:vcardFloder:remove")
	public R remove( Long id){
		if(vcardFloderService.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	//@RequiresPermissions("app:vcardFloder:batchRemove")
	public R remove(@RequestParam("ids[]") Long[] ids){
		vcardFloderService.batchRemove(ids);
		return R.ok();
	}
	
}
