package oes;

public class Result {
private int id;
private String name,uname,marks,paperName,sid,scheme;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}

public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getMarks() {
	return marks;
}
public void setMarks(String marks) {
	this.marks = marks;
}
public String getPaperName() {
	return paperName;
}
public void setPaperName(String paperName) {
	this.paperName = paperName;
}
public String getSid() {
	return sid;
}
public void setSid(String sid) {
	this.sid = sid;
}
public String getScheme() {
	return scheme;
}
public void setScheme(String scheme) {
	this.scheme = scheme;
}
public Result(int id, String uname, String name, String marks, String paperName, String sid, String scheme) {
	super();
	this.id = id;
	this.name = name;
	this.uname = uname;
	this.marks = marks;
	this.paperName = paperName;
	this.sid = sid;
	this.scheme = scheme;
}

}
