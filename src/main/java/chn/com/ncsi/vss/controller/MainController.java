package chn.com.ncsi.vss.controller;

import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONObject;

import chn.com.ncsi.vss.pojo.Student;
import chn.com.ncsi.vss.pojo.Visitor;
import chn.com.ncsi.vss.service.VisitorService;

@Controller
public class MainController {
	@Autowired(required=false)
private VisitorService  visitorService;
	@RequestMapping("welcome")
public String toWelcome() {
	return "welcome";
}
	@RequestMapping("upload")
public String toUploadPage(){
		return "upload";
	}
	@RequestMapping("uploadFile")
	public  String  upload(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile file = multipartRequest.getFile("upfile");
		if(file.isEmpty()){
			throw new Exception("empty");
		}
		String fileName = file.getOriginalFilename().toString();
		System.out.println(fileName);
		System.out.println(file.getName());
		List<String[]> list = new ArrayList<String[]>();
		// 准备要读取的文件流
		InputStream is = file.getInputStream();// 解析的是上传的xlsx文件
		// 创建读取对象
		Workbook workbook = WorkbookFactory.create(is);
		Sheet sheet = workbook.getSheetAt(0);  //示意访问sheet
		// 获取表里面有多少行
		int num = sheet.getLastRowNum();
		// 遍历行
		boolean flag=true;
		for (int i = 0; i < num; i++) {
			// 获取行对象
			Row row = sheet.getRow(i + 1);// 按照我们的规定上传的xlsx文件的包含表头的，排除表头i = 1
			if(row==null){
				break;
			}
			short cellNum = row.getLastCellNum();
			// 实例化数组
			String[] strings = new String[cellNum];
			for (int j = 0; j < cellNum; j++) {
				// 获取格子对象
				Cell cell = row.getCell(j);
				// 获格格子对象里面的数据
				cell.setCellType(Cell.CELL_TYPE_STRING);
				strings[j] = cell.getStringCellValue();
			}
			;
			for(int k=0;k<strings.length;k++) {
				if(strings[0].equals("进入NCS CD办公区域，请遵守新电信息科技（成都）有限公司的信息安全管理要求。")){
					flag=false;
				}
			}
			// 添加数据到集合
			if(flag==true){
				list.add(strings);
			}
		}
		List list2 = new ArrayList();
		List list3=new ArrayList();
		for (String[] strings : list) {
			Visitor visitor = new Visitor();
			visitor.setMOBILE(strings[3]);
			visitor.setSTATUS("P");
			list2.add(strings[2]);
			visitor=visitorService.findVisitorByTel(visitor);
			if(visitor!=null){
				continue;
			}
			Visitor visitor1 = new Visitor();
			list3.add(strings[2]);
			visitor1.setMOBILE(strings[3]);
			visitor1.setSTATUS("P");
			visitor1.setNAME(strings[2]);
			visitor1.setPURPOSE_CODE("I");
			visitor1.setJOB_POSITION(strings[6]);
			visitor1.setSTAFF_NAME(strings[9]);
			visitor1.setCREATED_ID("ORP");
			visitor1.setCREATED_DATE(new Timestamp(new Date().getTime()));
			visitorService.addInterviewr(visitor1);
		}
		model.addAttribute("totalList", list2);
		model.addAttribute("importList", list3);
		model.addAttribute("totalCount",list2.size());
		model.addAttribute("importCount", list3.size());
		return "uploadSuccess";
	}
	@RequestMapping("tologinPage")
public String toLoginPage() {
return "login";
}
@RequestMapping("tovue1")
public String tovuePage1() {
return "vueSubmitForm";
}
@RequestMapping("tovue2")
public String tovuePage2() {
return "vueReadDataFromBackend";
}
@RequestMapping(value="vuedemo",method=RequestMethod.GET)
@ResponseBody
public String findVisitor(Model model){
	Student student=new Student();
	student.setName("xia");
	student.setPassword("222");
	model.addAttribute("student", student);
	JSONObject jsonObject =new JSONObject();
	jsonObject.put("student", student);
	return jsonObject.toJSONString();
}
@RequestMapping("todataTable")
public String toDataTable() {
return "datatable";
}
}
