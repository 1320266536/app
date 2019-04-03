package com.bootdo.app.controller;

import com.bootdo.app.domain.TagDictionaryDO;
import com.bootdo.app.service.TagDictionaryService;
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
 * 标签字典表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
 
@Controller
@RequestMapping("/app/tagDictionary")
public class TagDictionaryController {
	@Autowired
	private TagDictionaryService tagDictionaryService;
	
	@GetMapping()
	//@RequiresPermissions("app:tagDictionary:tagDictionary")
	String TagDictionary(){
	    return "app/tagDictionary/tagDictionary";
	}
	
	@ResponseBody
	@GetMapping("/list")
	//@RequiresPermissions("app:tagDictionary:tagDictionary")
	public PageUtils list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<TagDictionaryDO> tagDictionaryList = tagDictionaryService.list(query);
		int total = tagDictionaryService.count(query);
		PageUtils pageUtils = new PageUtils(tagDictionaryList, total);
		return pageUtils;
	}
	
	@GetMapping("/add")
	//@RequiresPermissions("app:tagDictionary:add")
	String add(){
	    return "app/tagDictionary/add";
	}

	@GetMapping("/edit/{id}")
	//@RequiresPermissions("app:tagDictionary:edit")
	String edit(@PathVariable("id") Long id,Model model){
		TagDictionaryDO tagDictionary = tagDictionaryService.get(id);
		model.addAttribute("tagDictionary", tagDictionary);
	    return "app/tagDictionary/edit";
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	//@RequiresPermissions("app:tagDictionary:add")
	public R save( TagDictionaryDO tagDictionary){
		if(tagDictionaryService.save(tagDictionary)>0){
			return R.ok();
		}
		return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	//@RequiresPermissions("app:tagDictionary:edit")
	public R update( TagDictionaryDO tagDictionary){
		tagDictionaryService.update(tagDictionary);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	//@RequiresPermissions("app:tagDictionary:remove")
	public R remove( Long id){
		if(tagDictionaryService.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	//@RequiresPermissions("app:tagDictionary:batchRemove")
	public R remove(@RequestParam("ids[]") Long[] ids){
		tagDictionaryService.batchRemove(ids);
		return R.ok();
	}
	
}
