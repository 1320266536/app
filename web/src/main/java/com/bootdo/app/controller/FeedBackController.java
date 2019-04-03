package com.bootdo.app.controller;

import com.bootdo.app.domain.FeedBackDO;
import com.bootdo.app.service.FeedBackService;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 用户意见反馈表
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
 
@Controller
@RequestMapping("/app/feedBack")
public class FeedBackController {
	@Autowired
	private FeedBackService feedBackService;

	@GetMapping()
	//@RequiresPermissions("app:feedBack:feedBack")
	String FeedBack(){
	    return "app/feedBack/feedBack";
	}
	
	@ResponseBody
	@GetMapping("/list")
	//@RequiresPermissions("app:feedBack:feedBack")
	public PageUtils list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<FeedBackDO> feedBackList = feedBackService.list(query);
		int total = feedBackService.count(query);
		return new PageUtils(feedBackList, total);
	}

	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	//@RequiresPermissions("app:feedBack:remove")
	public R remove( Long id){
		if(feedBackService.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	//@RequiresPermissions("app:feedBack:batchRemove")
	public R remove(@RequestParam("ids[]") Long[] ids){
		feedBackService.batchRemove(ids);
		return R.ok();
	}
	
}
