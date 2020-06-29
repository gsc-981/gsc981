package com.jiudian.room.action;

import com.jiudian.room.entity.Room;
import com.jiudian.room.service.RoomManageService;
import com.jiudian.core.util.JsonReturn;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.IOException;

@Controller
@ParentPackage("my-default")
@Namespace("/")
@Scope("prototype")
public class RoomManageAction extends ActionSupport {

    @Autowired
    private RoomManageService roomManageService;

    private String id;
    private String roomName;
    private String roomPhone;
    private String roomTypeId;
    private Double roomPrice;
    private String roomAble;
    private String notes;
    private int limit;
    private int page;

    /**
     * 显示所有房间
     * */
    @Action(value = "/sys/room/room",
            interceptorRefs = {@InterceptorRef("MyInterceptor")},
            results = {@Result(name = "index", location = "/room/room.jsp")})
    public String index() {
        return "index";
    }

    /**
     * 房间分页返回json
     *
     */
    @Action(value = "/sys/room/findAllRoom",
            interceptorRefs = {@InterceptorRef("MyInterceptor")})
    public void findAllRoom() throws IOException {
        String keyword = ServletActionContext.getRequest().getParameter("keyword");
        String jsonstring = this.roomManageService.roomPagination(page, limit, keyword);
        ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().write(jsonstring);
    }

    /**
     * 分页返回空房json
     *
     */
    @Action(value = "/sys/room/findNullRoom",
            interceptorRefs = {@InterceptorRef("MyInterceptor")})
    public void findNullRoom() throws IOException {
        String jsonstring = this.roomManageService.nullroomPagination(page, limit);
        ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().write(jsonstring);
    }

    /**
     * 保存或新增房间类型
     * */
    @Action(value = "/sys/room/saveroom",
            interceptorRefs = {@InterceptorRef("MyInterceptor")},
            results = {@Result(name = "ok", location = "/sys/ok.jsp"),
                        @Result(name = "exist", location = "/room/exist.jsp")})
    public String saveroom() {
        String res = "ok";
        try {
            roomManageService.saveroom(id, roomName, roomPhone, roomTypeId, roomPrice, roomAble, notes);
        }catch (Exception e){
            res = "exist";
        }
        return res;
    }

    /**
     * 跳转到修改房间页面
     * */
    @Action(value = "/sys/room/getoneroom",
            interceptorRefs = {@InterceptorRef("MyInterceptor")},
            results = {@Result(name = "getoneroom", location = "/room/room-add.jsp")})
    public String getoneroom() {
        String typeid;
        Room room = roomManageService.get(id);
        ServletActionContext.getContext().put("room", room);
        if(room.getRoomTypeByRoomTypeId()==null) {
            typeid = "";
        }
        else {
            typeid = room.getRoomTypeByRoomTypeId().getId();
        }
        ServletActionContext.getContext().put("typeid", typeid);
        return "getoneroom";
    }

    /**
     * 跳转到新增一个房间页面
     * */
    @Action(value = "/sys/room/addroom",
            interceptorRefs = {@InterceptorRef("MyInterceptor")},
            results = {@Result(name = "toaddroom", location = "/room/room-add.jsp")})
    public String toaddroom() {
        ServletActionContext.getContext().put("room", null);
        ServletActionContext.getContext().put("typeid", null);
        return "toaddroom";
    }

    /**
     * 删除房间类型
     * */
    @Action(value = "/sys/room/deleteroom",
            interceptorRefs = {@InterceptorRef("MyInterceptor")})
    public void deleteroom() throws IOException {
        JsonReturn jsonReturn = new JsonReturn();
        try {
            Room room = roomManageService.get(id);
            roomManageService.deleteroom(room);
            jsonReturn.setMsg("success");
        }catch (Exception e) {
            jsonReturn.setMsg("error");
        }finally {
            ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
            ServletActionContext.getResponse().getWriter().write(jsonReturn.tojson());
        }
    }

    /**
     * 返回一种房型所有空房的json
     *
     */
    @Action(value = "/sys/room/getonetyperooms",
            interceptorRefs = {@InterceptorRef("MyInterceptor")})
    public void getonetyperooms() throws IOException {
        String jsonstring = this.roomManageService.getonetyperooms(roomTypeId);
        ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().write(jsonstring);
    }

    /**
     * 返回所有空房的json
     *
     */
    @Action(value = "/sys/room/getnullrooms",
            interceptorRefs = {@InterceptorRef("MyInterceptor")})
    public void getnullrooms() throws IOException {
        String jsonstring = this.roomManageService.getnullrooms();
        ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().write(jsonstring);
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public void setRoomPhone(String roomPhone) {
        this.roomPhone = roomPhone;
    }

    public void setRoomTypeId(String roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    public void setRoomPrice(Double roomPrice) {
        this.roomPrice = roomPrice;
    }

    public void setRoomAble(String roomAble) {
        this.roomAble = roomAble;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}

