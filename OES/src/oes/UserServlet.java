package oes;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void print(String str){
		System.out.println(str);
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		print("DOGET");
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		HttpSession session=request.getSession();
		String st[]={"y1","y2","y3"};
		//session.setMaxInactiveInterval(60*60*1);

		 try {
	            switch (action) {
	                case "login":
	                	System.out.println(action);
	                    User l=new User(request.getParameter("uname"),request.getParameter("pass"));
	                    UserDAO la=new UserDAO();
	                    la.table("staff");
	                    if(la.loginUser(l)){
	                    	switch (l.getLvl()) {
	                    	case "A":
	                    		System.out.println("a");
	                            session.setAttribute("id", l);
	                            session.setAttribute("datareturn", la.datareturn());
	                            request.getRequestDispatcher("admin.jsp").forward(request, response);	
	                    		break;
	                    		
	                    	case "T":
	                    		System.out.println("t");
	                            session.setAttribute("id", l);
	                            session.setAttribute("datareturn", la.datareturn());
	                            request.getRequestDispatcher("teacher.jsp").forward(request, response);		
	                    		break;
	                   
	                    	default:
	                    		break;
	                    	}
	                    }
	                    else{
	                 		
             
                    		System.out.println("s");
                    		for(String s:st){
    	                    	la.student(s);
    	                    	 if(la.loginUser(l)){
    	 	                            session.setAttribute("id", l);
    	 	                            ExamDAO ed=new ExamDAO();
    	 	                            ed.attendance(l.getId(), l.getYear(),"A");
    	 	                            while((ed.show(l.getYear(),l.getId())!=true)&&((ed.inTable(l.getId(), l.getYear()))!=false)){
    	 	                            }
    	 	                            try{Thread.sleep(1000);}catch(Exception e){}
    	 	                            if((ed.show(l.getYear(),l.getId())!=false)&&(ed.timeLeft()>0)){
       	 	                            System.out.println(ed.getPaperName()+"	okk");
       	 	                            session.setAttribute("questions", ed.examQuestions(ed.getSid()));
       	 	                            session.setAttribute("time", ed.timeLeft());
       	 	                            session.setAttribute("ExamDAO", ed);
       	 	                            session.setAttribute("qn", 0);
    	 	                            timer t= new timer(request,response);
    	 	                            session.setAttribute("timer", t);
       	 	                    		request.getRequestDispatcher("student.jsp").forward(request, response);
       	 	                    		break;
    	 	                            }
    	                    	 }
    	                    	 else{
	 	                            	request.getRequestDispatcher("index.html").forward(request, response);
	 	                            	break;
    	                    	 }
    	                    
    	                    }
                    
	                    }
	                    break;
	                case "home":
	                	System.out.println(action);
	                	User h=(User)session.getAttribute("id");
	                	UserDAO hd=new UserDAO();
	                	switch(h.getLvl()){
	                	case "A":
	                		hd.table("staff");
	                		session.setAttribute("datareturn", hd.datareturn());
	                		request.getRequestDispatcher("admin.jsp").forward(request, response);
	                		break;
	                	case "T":
	                		hd.table("staff");
	                		session.setAttribute("datareturn", hd.datareturn());
	                		request.getRequestDispatcher("teacher.jsp").forward(request, response);
	                		break;
	                	case "S":
	                		request.getRequestDispatcher("student.jsp").forward(request, response);
	                		break;
	                	}
	                	break;
	                case "logout":
	                	System.out.println(action);
	                	session.setAttribute("id", null);
	                	request.getRequestDispatcher("index.html").forward(request, response);
	                	break;
	                    
	                case "add_user_page": 	
	                	System.out.println(action);
	                	session.setAttribute("action", request.getParameter("action"));
	                	session.setAttribute("table", request.getParameter("table"));
	                	session.setAttribute("table_action", "No");
	                	request.getRequestDispatcher("edit_user.jsp").forward(request, response);
	                	break;
	                case "add_user":
	                	 System.out.println(action);
	                	 User at;
	                	 UserDAO ata = new UserDAO();	  
	                	 if(session.getAttribute("table").equals("staff")){
	                		 session.setAttribute("st", "No");
		                	 at=new User(request.getParameter("uname"),request.getParameter("pass"),"T",request.getParameter("name")); 
		                	 ata.table((String)(session.getAttribute("table")));
	                	 }
	                	 else{
	                		 String year=new String();
	                		 session.setAttribute("st", request.getParameter("table"));
		                	 ata.student((request.getParameter("table")));
		                	 
		                	 switch(request.getParameter("table")){
		                	 case "y1":
		                    		year="1st Year";
		                    		break;
		                	 case "y2":
		                		 	year="2nd Year";
		                    		break;
		                	 case "y3":
		                		 	year="3rd Year";
		                    		break;
		                    	default:
		                    		break;
		                	 }
		                	 at=new User(request.getParameter("uname"),request.getParameter("pass"),"S",request.getParameter("name"),request.getParameter("scheme")+":Scheme",year);         		 
		                	 
	                	 }
	                	 ata.insertUser(at);
	                	 session.setAttribute("user", at);
	                	 session.setAttribute("users", ata.selectAllUsers()); 
	                	 request.getRequestDispatcher("table.jsp").forward(request, response);
	                    break;
	             
	                case "edit_user_table":
	                	System.out.println(action);
	                	
	                	session.setAttribute("action", request.getParameter("action"));
	                	session.setAttribute("table", request.getParameter("table"));
	                	session.setAttribute("st", request.getParameter("st"));                	
	                	UserDAO eup = new UserDAO();
	                	if(((session.getAttribute("table"))).equals("staff")){
	                		System.out.println("edit teach");
	                		eup.table((String)(session.getAttribute("table")));
		                	session.setAttribute("users", (List<User>)eup.selectAllUsers());
		                	session.setAttribute("st", null);	                	}
	                	else{
	                			System.out.println("b st n");
	                			if(session.getAttribute("st")==null){
	                				System.out.println("i st null");
	                				session.setAttribute("st", "y1");
	                			}
	                			System.out.println(session.getAttribute("st"));
		                    	eup.student((String)session.getAttribute("st"));
		                    	session.setAttribute("users", (List<User>)eup.selectAllUsers());
		                    	 	                		    	 	     		
		                }	                		                	
	                	session.setAttribute("table_action", "edit_table");
	                	request.getRequestDispatcher("table.jsp").forward(request, response);
	                	break;  
	                	
	                case "edit_user_page":
	                	System.out.println(action);
	                	 UserDAO uda=new UserDAO();
	                	 if(session.getAttribute("table").equals("staff")){
		                 uda.table((String)(session.getAttribute("table")));
	                	 }
	                	 else{
	                	 uda.student((String)(session.getAttribute("st")));
	                	 }
		                 session.setAttribute("user", uda.selectUser((Integer.parseInt(request.getParameter("idn")))));
		                 session.setAttribute("action", action);
		                 request.getRequestDispatcher("edit_user.jsp").forward(request, response);
	                    break;
	                	
	                	case "edit_user_update":
	                		System.out.println(action);
	                    UserDAO etp=new UserDAO();
	                    User et;
	                    if(session.getAttribute("table").equals("staff")){
	                		 
		                	 et=new User(Integer.parseInt(request.getParameter("idn")),request.getParameter("uname"),request.getParameter("pass"),"T",request.getParameter("name")); 
		                	 etp.table("staff"); 
	                    }
	                	 else{
		                	 et=new User(Integer.parseInt(request.getParameter("idn")),request.getParameter("uname"),request.getParameter("pass"),"S",request.getParameter("name"),request.getParameter("scheme")+":Scheme");         		 
		                	 etp.student(request.getParameter("st"));
	                	 }
	                    etp.updateUser(et);
	                    List<User> susers=etp.selectAllUsers();
	                	session.setAttribute("users", susers);
	                	request.getRequestDispatcher("table.jsp").forward(request, response);	                    
	                    break;
                 
	               
	                case "delete":
	                	System.out.println(action);
	                    UserDAO dda=new UserDAO();
	                    if(session.getAttribute("table").equals("staff")){
		                    dda.table((String)(session.getAttribute("table")));
	                    }
	                    else{
	                    	dda.student((String)session.getAttribute("st"));
	                    }
	                    dda.deleteUser((Integer.parseInt(request.getParameter("idn"))));
	                    session.setAttribute("users", dda.selectAllUsers());
	                    request.getRequestDispatcher("table.jsp").forward(request, response);
	                    break;
	                    
	                default:
	                    System.out.println("Default");
	                    break;
	            }
	        } catch (SQLException ex) {
	            throw new ServletException(ex);
	        }
	}

}
