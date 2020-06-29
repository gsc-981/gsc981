package com.jiudian.room.action;

import com.jiudian.room.vo.RoomTypeVo;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jiudian.core.base.BaseAction;
import com.jiudian.room.entity.RoomType;
import com.jiudian.room.service.RoomTypeManageService;
import com.opensymphony.xwork2.ActionContext;

@Controller
@ParentPackage("struts-default")
@Namespace("/")
@Scope("prototype")
public class ShowRoomDetail extends BaseAction {

	@Autowired
	private RoomTypeManageService roomTypeManageService;
	
	@Action(value = "/sys/showroom/show",results={@Result(name="show",location = "/front/room-detail.jsp")})
	public String show()
	{
		RoomType roomType = roomTypeManageService.get(request.getParameter("id"));

		ActionContext.getContext().getValueStack().set("roomType", new RoomTypeVo(roomType));
		return "show";
	}
	
}
