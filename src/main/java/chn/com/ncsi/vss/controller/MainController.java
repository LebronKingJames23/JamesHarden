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
		List<String[]> list = new ArrayList<String[]>();
		InputStream is = file.getInputStream();// 瑙ｆ瀽鐨勬槸涓婁紶鐨剎lsx鏂囦欢
		
		// 鍒涘缓璇诲彇瀵硅薄
		Workbook workbook = WorkbookFactory.create(is);  
		Sheet sheet = workbook.getSheetAt(0);  //绀烘剰璁块棶sheet  
		// 鑾峰彇琛ㄩ噷闈㈡湁澶氬皯琛�
		int num = sheet.getLastRowNum();
		// 閬嶅巻琛�
		boolean flag=true;
		for (int i = 0; i < num; i++) {
			// 鑾峰彇琛屽璞�
			Row row = sheet.getRow(i + 1);// 鎸夌収鎴戜滑鐨勮瀹氫笂浼犵殑xlsx鏂囦欢鐨勫寘鍚〃澶寸殑锛屾帓闄よ〃澶磇 = 1
			if(row==null){
			break;
			}
			short cellNum = row.getLastCellNum();
			// 瀹炰緥鍖栨暟缁�
			String[] strings = new String[cellNum];
			for (int j = 0; j < cellNum; j++) {
				// 鑾峰彇鏍煎瓙瀵硅薄
				Cell cell = row.getCell(j);
				// 鑾锋牸鏍煎瓙瀵硅薄閲岄潰鐨勬暟鎹�
				   cell.setCellType(Cell.CELL_TYPE_STRING);
				strings[j] = cell.getStringCellValue();
			}
			;
			for(int k=0;k<strings.length;k++) {
				if(strings[0].equals("杩涘叆NCS CD鍔炲叕鍖哄煙锛岃閬靛畧鏂扮數淇℃伅绉戞妧锛堟垚閮斤級鏈夐檺鍏徃鐨勪俊鎭畨鍏ㄧ鐞嗚姹傘�")){
					flag=false;
				}
				}
			// 娣诲姞鏁版嵁鍒伴泦鍚�
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
