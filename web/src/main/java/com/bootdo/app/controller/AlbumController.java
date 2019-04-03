package com.bootdo.app.controller;

import com.bootdo.app.domain.AlbumDO;
import com.bootdo.app.service.AlbumService;
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
 * 用户图集
 * 
 * @author Lambda
 * @email 18744422377@163.com
 * @date 2019-02-26 15:17:36
 */
 
@Controller
@RequestMapping("/app/album")
public class AlbumController {
	@Autowired
	private AlbumService albumService;
	
	@GetMapping()
	//@RequiresPermissions("app:album:album")
	String Album(){
	    return "app/album/album";
	}
	
	@ResponseBody
	@GetMapping("/list")
	//@RequiresPermissions("app:album:album")
	public PageUtils list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<AlbumDO> albumList = albumService.list(query);
		int total = albumService.count(query);
		PageUtils pageUtils = new PageUtils(albumList, total);
		return pageUtils;
	}
	
	@GetMapping("/add")
	//@RequiresPermissions("app:album:add")
	String add(){
	    return "app/album/add";
	}

	@GetMapping("/edit/{id}")
	//@RequiresPermissions("app:album:edit")
	String edit(@PathVariable("id") Long id,Model model){
		AlbumDO album = albumService.get(id);
		model.addAttribute("album", album);
	    return "app/album/edit";
	}


	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	//@RequiresPermissions("app:album:add")
	public R save( AlbumDO album){
		if(albumService.save(album)>0){
			return R.ok();
		}
		return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	//@RequiresPermissions("app:album:edit")
	public R update( AlbumDO album){
		albumService.update(album);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	//@RequiresPermissions("app:album:remove")
	public R remove( Long id){
		if(albumService.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	//@RequiresPermissions("app:album:batchRemove")
	public R remove(@RequestParam("ids[]") Long[] ids){
		albumService.batchRemove(ids);
		return R.ok();
	}
	
}
