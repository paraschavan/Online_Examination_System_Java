package oes;

public class User {
	private int id;
	private String uname,pass,lvl,name,year,scheme;
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
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getScheme() {
		return scheme;
	}
	public void setScheme(String scheme) {
		this.scheme = scheme;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getLvl() {
		return lvl;
	}
	public void setLvl(String lvl) {
		this.lvl = lvl;
	}
	public String getLvlF() {
		switch(lvl){
		case"A":
			return "Administrator";
	
		case"T":
			return "Teacher";
		case"S":
			return "Student";
		}
		return lvl;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public User(String uname, String pass) {
		super();
		this.uname = uname;
		this.pass = pass;
	}
	
	public User(String uname, String pass, String lvl, String name) {
		super();
		this.uname = uname;
		this.pass = pass;
		this.lvl = lvl;
		this.name = name;
	}
	
	public User(String uname, String pass, String lvl, String name, String scheme, String year) {
		super();
		this.uname = uname;
		this.pass = pass;
		this.lvl = lvl;
		this.name = name;
		this.scheme = scheme;
		this.year = year;
	}
	public User(int id, String uname, String pass, String lvl, String name) {
		super();
		this.id = id;
		this.uname = uname;
		this.pass = pass;
		this.lvl = lvl;
		this.name = name;
	}
	
	public User(int id, String uname, String pass, String lvl, String name, String scheme) {
		super();
		this.id = id;
		this.uname = uname;
		this.pass = pass;
		this.lvl = lvl;
		this.name = name;
		this.scheme = scheme;
	}
	public User(int id, String uname, String pass, String lvl, String name, String scheme, String year) {
		super();
		this.id = id;
		this.uname = uname;
		this.pass = pass;
		this.lvl = lvl;
		this.name = name;
		this.scheme = scheme;
		this.year = year;
	}
	public String show(){
		
		return (String)( id +"	"+  uname+"	"+  pass+"	"+ lvl+"	"+  name+"	"+  scheme+"	"+  year);
	}
}
