package com.jiudian.room.action;

import com.alibaba.fastjson.JSON;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.UUID;

@Controller
@ParentPackage("my-default")
@Namespace("/")
@Scope("prototype")
public class RoomTypePicUploadAction {
    //上传文件
    private File file;
    //上传文件的类型
    private String fileContentType;
    //文件名
    private String fileFileName;

    @Action(value = "/sys/room/upload",
            interceptorRefs = {@InterceptorRef("MyInterceptor")})
    public void upload() throws Exception{
        HttpServletRequest request= ServletActionContext.getRequest();
        //获得项目中upload的路径
        String uploadPath=ServletActionContext.getServletContext().getRealPath("/upload");
        //获得一个唯一标识符用来作为上传后的文件名
        UUID uuid=UUID.randomUUID();
        String newFileName=uuid.toString();
        //截取后缀名
        String suffix=fileFileName.substring(fileFileName.lastIndexOf("."));
        //destFile是我们要移动到的目标文件
        File destFile = new File(uploadPath+"/"+newFileName+suffix);
        //将struts2给我们的myFile临时文件复制到destFile目标文件
        FileUtils.copyFile(file, destFile);
        HashMap<String, String> res = new HashMap<>();
        res.put("src", newFileName+suffix);
        String jsonstring = JSON.toJSONString(res);
        ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().write(jsonstring);
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }
}
