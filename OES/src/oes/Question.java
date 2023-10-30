package oes;

public class Question {
private int id,m,sm;
private String qt,q,a,b,c,d,ans,sans;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getQt() {
	return qt;
}
public void setQt(String qt) {
	this.qt = qt;
}
public String getQ() {
	return q;
}
public void setQ(String q) {
	this.q = q;
}
public String getA() {
	return a;
}
public void setA(String a) {
	this.a = a;
}
public String getB() {
	return b;
}
public void setB(String b) {
	this.b = b;
}
public String getC() {
	return c;
}
public void setC(String c) {
	this.c = c;
}
public String getD() {
	return d;
}
public void setD(String d) {
	this.d = d;
}
public String getAns() {
	return ans;
}
public void setAns(String ans) {
	this.ans = ans;
}
public int getM() {
	return m;
}
public void setM(int m) {
	this.m = m;
}

public int getSm() {
	return sm;
}
public void setSm(int sm) {
	this.sm = sm;
}
public String getSans() {
	return sans;
}
public void setSans(String sans) {
	this.sans = sans;
}
public Question(String qt, String q, String a, String b, String c, String d, String ans, int m) {
	super();
	this.qt = qt;
	this.q = q;
	this.a = a;
	this.b = b;
	this.c = c;
	this.d = d;
	this.ans = ans;
	this.m = m;
}
public Question(int id, String qt, String q, String a, String b, String c, String d, String ans, int m) {
	super();
	this.id = id;
	this.qt = qt;
	this.q = q;
	this.a = a;
	this.b = b;
	this.c = c;
	this.d = d;
	this.ans = ans;
	this.m = m;
}
public Question(int id, String qt, String q, String a, String b, String c, String d, String ans, int m, String sans,
		int sm) {
	super();
	this.id = id;
	this.qt = qt;
	this.q = q;
	this.a = a;
	this.b = b;
	this.c = c;
	this.d = d;
	this.ans = ans;
	this.m = m;
	this.sans = sans;
	this.sm = sm;
}

}
