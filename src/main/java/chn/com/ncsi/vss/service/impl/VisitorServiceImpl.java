package chn.com.ncsi.vss.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import chn.com.ncsi.vss.mapper.VisitorMapper;
import chn.com.ncsi.vss.pojo.Visitor;
import chn.com.ncsi.vss.service.VisitorService;

@Service
@Transactional
public class VisitorServiceImpl implements VisitorService{
@Autowired
private VisitorMapper visitorMapper;
	public void addVisitorMsg(Visitor visitor) {
		visitorMapper.addVisitorMsg(visitor);
	}
	public Visitor findVisitorMsg(Visitor visitor) {
		return visitorMapper.findVisitorMsg(visitor);
	}
	public void checkOut(Visitor visitor) {
		visitorMapper.checkOut(visitor);
	}
	public List<Visitor> findAllInterviewrs() {
		return visitorMapper.findAllInterviewrs();
	}
	public Visitor findInterviewrMsg(Visitor visitor) {
		return visitorMapper.findInterviewrMsg(visitor);
	}
	public void updateInterviewer(Visitor visitor) {
		visitorMapper.updateInterviewer(visitor);
	}
	public Visitor findVisitorByTel(Visitor visitor) {
		return visitorMapper.findVisitorByTel(visitor);
	}
	public void addInterviewr(Visitor visitor) {
		visitorMapper.addInterviewr(visitor);
		
	}
	public void find(Visitor visitor){
		visitorMapper.findUserByUsername(visitor);
	}
	public List<Visitor> queryAllVisitors() {
		
		return visitorMapper.queryAllVisitors();
	}

}
