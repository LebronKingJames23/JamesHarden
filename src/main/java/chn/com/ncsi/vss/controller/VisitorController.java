package chn.com.ncsi.vss.controller;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import chn.com.ncsi.vss.pojo.Visitor;
import chn.com.ncsi.vss.service.VisitorService;
import chn.com.ncsi.vss.service.impl.VisitorServiceImpl;

@Controller
@RequestMapping("visitor")
public class VisitorController {
@Autowired(required=false)
private VisitorService visitorService;
@RequestMapping("/inPage")
public String toMainPage(Model model,String V_PASS) {
	Date date = new Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	model.addAttribute("SIGN_IN_DATE",dateFormat.format(date));
	model.addAttribute("V_PASS", V_PASS);
	return "checkin";
}
@RequestMapping("/checkin")
public String checkin(Visitor visitor,String NAMEs) {
	if(!visitor.getPURPOSE_CODE().equals("I")) {
		visitor.setCREATED_ID("WEB");
		visitor.setSTATUS("I");
		visitor.setCREATED_DATE(new Timestamp(new Date().getTime()));
		visitorService.addVisitorMsg(visitor);
	}else {
		visitor.setNAME(NAMEs);
		visitorService.updateInterviewer(visitor);
	}
	return "checkinsuccess";

}
@RequestMapping("/outPage")
public String toCheckOut(Model model,String V_PASS) {
	Visitor visitor = new Visitor();
	visitor.setV_PASS(V_PASS);
	visitor.setSTATUS("I");
	visitor=visitorService.findVisitorMsg(visitor);
	model.addAttribute("visitor", visitor);
	return "checkout";
}
@RequestMapping("/checkout")
public String checkOut(String V_PASS) {
	Visitor visitor = new Visitor();
	visitor.setV_PASS(V_PASS);
	visitor.setSIGN_OFF_DATE(new Timestamp(new Date().getTime()));
	visitorService.checkOut(visitor);
	return "checkoutsuccess";
}
@RequestMapping("/findAllInterviewrs")
@ResponseBody
public List<Visitor> findAllInterviewrs() {
	List<Visitor>list =visitorService.findAllInterviewrs();
return list	;
}
@RequestMapping("/findInterviewrMsg")
@ResponseBody
public Visitor findInterviewrMsg(Visitor visitor) {
	visitor.setSTATUS("P");
	return visitorService.findInterviewrMsg(visitor);

}
@RequestMapping(value="datatableQuery",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
@ResponseBody
public String datatableQuery(Model model) {
    JSONObject result = new JSONObject();
    JSONArray visitArray = new JSONArray();
    List<Visitor> visitList = visitorService.queryAllVisitors();
    if(visitList!= null && visitList.size() >0) {
        for(Visitor visit :visitList) {
            JSONObject visitJSON = new JSONObject();
            visitJSON.put("visitName", visit.getNAME());
            visitJSON.put("visitGender", visit.getGENDER());
            visitJSON.put("visitStaff", visit.getSTAFF_NAME());
            visitJSON.put("visitMobile", visit.getMOBILE());
           visitArray.add(visitJSON);
        }
    }
    result.put("visitList", visitArray);
    return  result.toJSONString();
}
}
