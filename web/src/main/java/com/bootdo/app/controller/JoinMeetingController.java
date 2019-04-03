package com.bootdo.app.controller;

import com.bootdo.app.domain.JoinMeetingDO;
import com.bootdo.app.service.JoinMeetingService;
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
 * 参与会议人员表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
 
@Controller
@RequestMapping("/app/joinMeeting")
public class JoinMeetingController {
	@Autowired
	private JoinMeetingService joinMeetingService;
	
	@GetMapping()
	//@RequiresPermissions("app:joinMeeting:joinMeeting")
	String JoinMeeting(){
	    return "app/joinMeeting/joinMeeting";
	}
	
	@ResponseBody
	@GetMapping("/list")
	//@RequiresPermissions("app:joinMeeting:joinMeeting")
	public PageUtils list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<JoinMeetingDO> joinMeetingList = joinMeetingService.list(query);
		int total = joinMeetingService.count(query);
		PageUtils pageUtils = new PageUtils(joinMeetingList, total);
		return pageUtils;
	}
	
	@GetMapping("/add")
	//@RequiresPermissions("app:joinMeeting:add")
	String add(){
	    return "app/joinMeeting/add";
	}

	@GetMapping("/edit/{id}")
	//@RequiresPermissions("app:joinMeeting:edit")
	String edit(@PathVariable("id") Long id,Model model){
		JoinMeetingDO joinMeeting = joinMeetingService.get(id);
		model.addAttribute("joinMeeting", joinMeeting);
	    return "app/joinMeeting/edit";
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	//@RequiresPermissions("app:joinMeeting:add")
	public R save( JoinMeetingDO joinMeeting){
		if(joinMeetingService.save(joinMeeting)>0){
			return R.ok();
		}
		return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	//@RequiresPermissions("app:joinMeeting:edit")
	public R update( JoinMeetingDO joinMeeting){
		joinMeetingService.update(joinMeeting);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	//@RequiresPermissions("app:joinMeeting:remove")
	public R remove( Long id){
		if(joinMeetingService.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	//@RequiresPermissions("app:joinMeeting:batchRemove")
	public R remove(@RequestParam("ids[]") Long[] ids){
		joinMeetingService.batchRemove(ids);
		return R.ok();
	}
	
}
