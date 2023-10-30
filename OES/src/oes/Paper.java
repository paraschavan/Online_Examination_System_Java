package oes;

public class Paper {
private int id;
private String tt,sub,subcode,year,tableName;
public String getTt() {
	return tt;
}
public void setTt(String tt) {
	this.tt = tt;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getSub() {
	return sub;
}
public void setSub(String sub) {
	this.sub = sub;
}
public String getSubcode() {
	return subcode;
}
public void setSubcode(String subcode) {
	this.subcode = subcode;
}
public String getYear() {
	return year;
}
public void setYear(String year) {
	this.year = year;
}
public String getTableName() {
	return tableName;
}
public void setTableName(String tableName) {
	this.tableName = tableName;
}
public Paper(String tt, String sub, String subcode, String year, String tableName) {
	super();
	this.tt = tt;
	this.sub = sub;
	this.subcode = subcode;
	this.year = year;
	this.tableName = tableName;
}

public Paper(int id, String tt, String sub, String subcode, String year, String tableName) {
	super();
	this.id = id;
	this.tt = tt;
	this.sub = sub;
	this.subcode = subcode;
	this.year = year;
	this.tableName = tableName;
}



}
