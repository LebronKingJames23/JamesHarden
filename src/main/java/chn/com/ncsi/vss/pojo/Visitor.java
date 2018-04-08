package chn.com.ncsi.vss.pojo;

import java.sql.Timestamp;
import java.util.Date;

public class Visitor {
	private Integer SN;
	private String V_PASS;
	private String STATUS;
	private String NAME;
	private String GENDER;
	private String MOBILE;
	private String PURPOSE_CODE;
	private String JOB_POSITION;
	private String VISITOR_COMPANY;
	private String STAFF_NAME;
	private String SIGN_IN_DATE;
	private Timestamp SIGN_OFF_DATE;
	private String CREATED_ID;
	private Timestamp CREATED_DATE;
	public Integer getSN() {
		return SN;
	}
	public void setSN(Integer sN) {
		SN = sN;
	}
	public String getV_PASS() {
		return V_PASS;
	}
	public void setV_PASS(String v_PASS) {
		V_PASS = v_PASS;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getGENDER() {
		return GENDER;
	}
	public void setGENDER(String gENDER) {
		GENDER = gENDER;
	}
	public String getMOBILE() {
		return MOBILE;
	}
	public void setMOBILE(String mOBILE) {
		MOBILE = mOBILE;
	}
	public String getPURPOSE_CODE() {
		return PURPOSE_CODE;
	}
	public void setPURPOSE_CODE(String pURPOSE_CODE) {
		PURPOSE_CODE = pURPOSE_CODE;
	}
	public String getJOB_POSITION() {
		return JOB_POSITION;
	}
	public void setJOB_POSITION(String jOB_POSITION) {
		JOB_POSITION = jOB_POSITION;
	}
	public String getVISITOR_COMPANY() {
		return VISITOR_COMPANY;
	}
	public void setVISITOR_COMPANY(String vISITOR_COMPANY) {
		VISITOR_COMPANY = vISITOR_COMPANY;
	}
	public String getSTAFF_NAME() {
		return STAFF_NAME;
	}
	public void setSTAFF_NAME(String sTAFF_NAME) {
		STAFF_NAME = sTAFF_NAME;
	}
	public String getSIGN_IN_DATE() {
		return SIGN_IN_DATE;
	}
	public void setSIGN_IN_DATE(String sIGN_IN_DATE) {
		SIGN_IN_DATE = sIGN_IN_DATE;
	}
	public Timestamp getSIGN_OFF_DATE() {
		return SIGN_OFF_DATE;
	}
	public void setSIGN_OFF_DATE(Timestamp sIGN_OFF_DATE) {
		SIGN_OFF_DATE = sIGN_OFF_DATE;
	}
	public String getCREATED_ID() {
		return CREATED_ID;
	}
	public void setCREATED_ID(String cREATED_ID) {
		CREATED_ID = cREATED_ID;
	}
	public Timestamp getCREATED_DATE() {
		return CREATED_DATE;
	}
	public void setCREATED_DATE(Timestamp cREATED_DATE) {
		CREATED_DATE = cREATED_DATE;
	}
}
