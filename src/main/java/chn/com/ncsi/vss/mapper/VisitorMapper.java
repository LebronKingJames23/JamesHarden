package chn.com.ncsi.vss.mapper;

import java.util.List;

import chn.com.ncsi.vss.pojo.Visitor;

public interface VisitorMapper {

	void addVisitorMsg(Visitor visitor);

	Visitor findVisitorMsg(Visitor visitor);

	void checkOut(Visitor visitor);

	List<Visitor> findAllInterviewrs();

	Visitor findInterviewrMsg(Visitor visitor);

	void updateInterviewer(Visitor visitor);

	Visitor findVisitorByTel(Visitor visitor);

	void addInterviewr(Visitor visitor);

	Visitor findUserByUsername(Visitor visitor);

	List<Visitor> queryAllVisitors();

}
