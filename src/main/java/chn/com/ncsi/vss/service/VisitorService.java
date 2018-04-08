package chn.com.ncsi.vss.service;

import java.util.List;

import chn.com.ncsi.vss.pojo.Visitor;

public interface VisitorService {

	void addVisitorMsg(Visitor visitor);

	Visitor findVisitorMsg(Visitor visitor);

	void checkOut(Visitor visitor);

	List<Visitor> findAllInterviewrs();

	Visitor findInterviewrMsg(Visitor visitor);

	void updateInterviewer(Visitor visitor);

	Visitor findVisitorByTel(Visitor visitor);

	void addInterviewr(Visitor visitor1);

	List<Visitor> queryAllVisitors();

}
