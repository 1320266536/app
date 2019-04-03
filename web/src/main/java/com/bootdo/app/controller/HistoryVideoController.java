package com.bootdo.app.controller;

import com.bootdo.app.domain.HistoryVideoDO;
import com.bootdo.app.service.HistoryVideoService;
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
 * 用户视频历史表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
 
@Controller
@RequestMapping("/app/historyVideo")
public class HistoryVideoController {
	@Autowired
	private HistoryVideoService historyVideoService;
	
	@GetMapping()
	//@RequiresPermissions("app:historyVideo:historyVideo")
	String HistoryVideo(){
	    return "app/historyVideo/historyVideo";
	}
	
	@ResponseBody
	@GetMapping("/list")
	//@RequiresPermissions("app:historyVideo:historyVideo")
	public PageUtils list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<HistoryVideoDO> historyVideoList = historyVideoService.list(query);
		int total = historyVideoService.count(query);
		PageUtils pageUtils = new PageUtils(historyVideoList, total);
		return pageUtils;
	}
	
	@GetMapping("/add")
	//@RequiresPermissions("app:historyVideo:add")
	String add(){
	    return "app/historyVideo/add";
	}

	@GetMapping("/edit/{id}")
	//@RequiresPermissions("app:historyVideo:edit")
	String edit(@PathVariable("id") Long id,Model model){
		HistoryVideoDO historyVideo = historyVideoService.get(id);
		model.addAttribute("historyVideo", historyVideo);
	    return "app/historyVideo/edit";
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	//@RequiresPermissions("app:historyVideo:add")
	public R save( HistoryVideoDO historyVideo){
		if(historyVideoService.save(historyVideo)>0){
			return R.ok();
		}
		return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	//@RequiresPermissions("app:historyVideo:edit")
	public R update( HistoryVideoDO historyVideo){
		historyVideoService.update(historyVideo);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	//@RequiresPermissions("app:historyVideo:remove")
	public R remove( Long id){
		if(historyVideoService.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	//@RequiresPermissions("app:historyVideo:batchRemove")
	public R remove(@RequestParam("ids[]") Long[] ids){
		historyVideoService.batchRemove(ids);
		return R.ok();
	}
	
}
