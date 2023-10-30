package oes;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Exam")
public class Exam extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int idn;
	private String tt,resultAction;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		System.out.println("Action=   "+action);
		HttpSession session=request.getSession();
		idn=(((User)session.getAttribute("id")).getId());
		tt="t"+idn;
		session.setAttribute("table", tt);
		ExamDAO ap=new ExamDAO();
		//session.setMaxInactiveInterval(60*60*1);
		 try {
	            switch (action) {
	                case "add_paper_page":
	                	 session.setAttribute("action", action);
	                	 request.getRequestDispatcher("add_paper.jsp").forward(request, response);
	                	break;
	                case "add_paper":
	 
	                	Paper pp=new Paper(tt,request.getParameter("sub"),request.getParameter("subCode"),request.getParameter("year"),request.getParameter("sub")+request.getParameter("subCode")+tt);
	          
	                	if(ap.insertSub(pp)){
	                	session.setAttribute("papers", ap.selectAllPapers(tt));
	                	session.setAttribute("table_action", "No");
	                	request.getRequestDispatcher("paper_table.jsp").forward(request, response);
	                	}
	                	else{
	                	request.getRequestDispatcher("add_paper.jsp").forward(request, response);
	                	}
	                	break;
	                case "edit_paper_page":
	                	session.setAttribute("action", action);
	                	 session.setAttribute("papers", ap.selectAllPapers(tt));
	                	 session.setAttribute("table_action", "edit_table");
	                	 request.getRequestDispatcher("paper_table.jsp").forward(request, response);
	                	
	                	break;
	                case "edit_paper":
	                	 session.setAttribute("action", request.getParameter("action"));
	                	 session.setAttribute("paper",  ap.selectPaper(Integer.parseInt(request.getParameter("idn")), tt));
	                	 request.getRequestDispatcher("add_paper.jsp").forward(request, response);
	                	break;
	            
	                case "delete":
	                	ap.deletePage(Integer.parseInt(request.getParameter("idn")), tt);
	                	session.setAttribute("papers", ap.selectAllPapers(tt));
	                	session.setAttribute("table_action", "edit_table");
	                	request.getRequestDispatcher("paper_table.jsp").forward(request, response);
	                	break;
	                	
	                case "delete_q":
	                	System.out.println("delete_Q");
	                	System.out.println((Integer.parseInt(request.getParameter("idn"))));
	                	System.out.println( (String)session.getAttribute("tableName"));
	                	ap.deleteQuestion(Integer.parseInt(request.getParameter("idn")), (String)session.getAttribute("tableName"));
	                	if(request.getParameter("qt")==null){
	                		session.setAttribute("qt", "MCQ");
	                	}
	                	else{
	                		if(request.getParameter("qt").equals("MCQ")){
	                			session.setAttribute("qt", "MCQ");
	                		}
	                		else{
	                		session.setAttribute("qt", "Q&A");
	                		}
	                	}
	                	session.setAttribute("questions", ap.selectAllQuestion((String)session.getAttribute("tableName")));
	                	session.setAttribute("paper_action", "paper");
	                	
	                	request.getRequestDispatcher("paper.jsp").forward(request, response);
	                	break;
	                	
	                case "paper":
	                	if(request.getParameter("tableName")!=null){
	                	session.setAttribute("tableName", request.getParameter("tableName"));
	                	}
	                	
	                	//session.setAttribute("idn", request.getParameter("idn"));//may be delete
	                	if(request.getParameter("qt")==null){
	                		session.setAttribute("qt", "MCQ");
	                	}
	                	else{
	                		if(request.getParameter("qt").equals("MCQ")){
	                			session.setAttribute("qt", "MCQ");
	                		}
	                		else{
	                		session.setAttribute("qt", "Q&A");
	                		}
	                	}
	                	String tableNamep=(String)session.getAttribute("tableName");
                		ExamDAO edp=new ExamDAO();
                		session.setAttribute("questions",(List<Question>) edp.selectAllQuestion(tableNamep));
                		session.setAttribute("paper_action", "paper");
                		session.setAttribute("selectedQ", "-1");
	                	request.getRequestDispatcher("paper.jsp").forward(request, response);
	                	
	                	break;
	                	
	                case "add_q":
	                		
	                		String tableName=(String)session.getAttribute("tableName");
	                		ExamDAO ed=new ExamDAO();
	                		Question q=new Question(request.getParameter("qt"),request.getParameter("q"),request.getParameter("a"),request.getParameter("b"),request.getParameter("c"),request.getParameter("d"),request.getParameter("ch"),Integer.parseInt(request.getParameter("m")));
	                		ed.insertQ(q, tableName);
	                		session.setAttribute("questions",(List<Question>) ed.selectAllQuestion(tableName));
	                		session.setAttribute("paper_action", "paper");
	                		request.getRequestDispatcher("paper.jsp").forward(request, response);
	                	break;
	                	
	                case "edit_q":
	                	String tableNamee=(String)session.getAttribute("tableName");
                		ExamDAO ede=new ExamDAO();
                		session.setAttribute("question",(Question) ede.selectQuestion(Integer.parseInt(request.getParameter("idn")), tableNamee));
                		session.setAttribute("selectedQ", request.getParameter("idn"));
                		session.setAttribute("questions",(List<Question>) ede.selectAllQuestion(tableNamee));
                		session.setAttribute("paper_action", "edit_q");
                		request.getRequestDispatcher("paper.jsp").forward(request, response);
	                	break;
	                case "update_q":
	                	String tableNameu=(String)session.getAttribute("tableName");
                		ExamDAO edu=new ExamDAO();
                		Question qu=new Question(Integer.parseInt(request.getParameter("idn")),request.getParameter("qt"),request.getParameter("q"),request.getParameter("a"),request.getParameter("b"),request.getParameter("c"),request.getParameter("d"),request.getParameter("ch"),Integer.parseInt(request.getParameter("m")));
                		System.out.println("ok 		"+request.getParameter("q"));
                		edu.updateQuestion(qu, tableNameu);
                		session.setAttribute("questions",(List<Question>) edu.selectAllQuestion(tableNameu));
                		session.setAttribute("paper_action", "paper");
                		request.getRequestDispatcher("paper.jsp").forward(request, response);
	                	break;
	                	 
	            	case "select":
	            		String year=null;
	            		switch((String)request.getParameter("year")){
	            		case"1st Year":
	            			year="y1";
	            		break;
	            			
	            		case"2nd Year":
	            			year="y2";
		            	break;
		          
	            		case"3rd Year":
	            			year="y3";
		            	break;
		          
		            	default:
		            	break;
	            		}
	            		ExamDAO es=new ExamDAO();
	            
	            		es.setPaper(request.getParameter("tableName"), year);
	            		session.setAttribute("tableName", request.getParameter("tableName"));
	            		System.out.println(year);
	            		session.setAttribute("year", year);
	            		session.setAttribute("paper", es.selectPaper(Integer.parseInt(request.getParameter("idn")), tt));
	            		//session.setAttribute("paper", es.selectPaper(Integer.parseInt(request.getParameter("idn")), request.getParameter("tableName")));
	            		request.getRequestDispatcher("dashboard.jsp").forward(request, response);
	            		break;
	            		
	            	case"remove_student":
	            		ExamDAO er=new ExamDAO();
	            		er.attendance(Integer.parseInt(request.getParameter("idn")), request.getParameter("year"), "R");
	            		request.getRequestDispatcher("dashboard.jsp").forward(request, response);
	            		break;
	            		
	            	case"start":
	            		ExamDAO se=new ExamDAO();
	            		se.insertStudentTable((Paper)session.getAttribute("paper"), Integer.parseInt(request.getParameter("time")));
	            		se.setPaper((String)session.getAttribute("tableName"), (String)session.getAttribute("year"));
	            		request.getRequestDispatcher("dashboard.jsp").forward(request, response);
	            		break;	
	            		
	            	case"button":
	            		ExamDAO bd=(ExamDAO)session.getAttribute("ExamDAO");
                           session.setAttribute("ExamDAO", bd);
                           int pn=Integer.parseInt(request.getParameter("qn"));
                           if(pn!=(int)session.getAttribute("qn")){
                        	   session.setAttribute("qn",pn++);
                           }
                   		request.getRequestDispatcher("student.jsp").forward(request, response);
                   		break;	
	            	case"answer":
	            		ExamDAO ad=(ExamDAO)session.getAttribute("ExamDAO");
	            			ad.answer(request.getParameter("sans"), Integer.parseInt(request.getParameter("idn")));
	            			 session.setAttribute("questions", ad.examQuestions(ad.getSid()));
	                   		request.getRequestDispatcher("student.jsp").forward(request, response);
                   		break;
	            	case"result":
	            		ExamDAO rd=new ExamDAO();
	            		resultAction=request.getParameter("resultAction");
	            		System.out.println(resultAction);
	            		if(resultAction.equals("show")){
	            			System.out.println("if");
		            		rd=(ExamDAO)session.getAttribute("ExamDAO");
	            			rd.result();
		            		session.setAttribute("result", rd.list());
		            		session.setAttribute("resultAction", resultAction);
	            		}
	            		else{
		            		System.out.println("else");
		            		if(request.getParameter("listName")!=null){
		            			session.setAttribute("result", rd.list(request.getParameter("listName")));
		            			session.setAttribute("listName",request.getParameter("listName") );
		            		}
		            		else{
		            			session.setAttribute("result",rd.list((String)session.getAttribute("listName")));
		            		}
		            		session.setAttribute("resultAction", resultAction);
	            		}
	            		request.getRequestDispatcher("result.jsp").forward(request, response);
                   		break;
	            	
	            	case"deletePaper":
	            		ExamDAO dd=new ExamDAO();
	            		dd.deletePaper(request.getParameter("paperName"), request.getParameter("sid"));
	            		
	            		session.setAttribute("result", dd.list(request.getParameter("paperName")));
		            	session.setAttribute("resultAction", resultAction);
	            		
	            		request.getRequestDispatcher("result.jsp").forward(request, response);
                   		break;
	            	case"showPaper":
	            		 ExamDAO sp=new ExamDAO();
	            		 session.setAttribute("ExamDAO", sp);
	            		 session.setAttribute("questions", sp.examQuestions(request.getParameter("sid")));
	                     session.setAttribute("qn", 0);
	                     session.setAttribute("name", request.getParameter("name"));
	                     session.setAttribute("uname", request.getParameter("uname"));
	                     session.setAttribute("sid",request.getParameter("sid"));
	                     request.getRequestDispatcher("showPaper.jsp").forward(request, response);
                   		break;
                   		
	            	case"sbutton":
                           int sn=Integer.parseInt(request.getParameter("qn"));
                           System.out.println(sn);
                           if(sn!=(int)session.getAttribute("qn")){
                        	   session.setAttribute("qn",sn++);
                           }
                   		request.getRequestDispatcher("showPaper.jsp").forward(request, response);
                   		break;	
	            	case"marks":
	            		System.out.println("Marks saving");
                       ExamDAO me=new ExamDAO();
                       me.marks((String)session.getAttribute("sid"), (String)session.getAttribute("tableName"), Integer.parseInt(request.getParameter("m")),  Integer.parseInt(request.getParameter("idn")));
                       session.setAttribute("questions", me.examQuestions((String)session.getAttribute("sid")));
                       request.getRequestDispatcher("showPaper.jsp").forward(request, response);
                		break;	
	                default:
	                    System.out.println("Default");
	                    break;
	            }
	        } catch (Exception ex) {
	            throw new ServletException(ex);
	        }
	}
	
}
