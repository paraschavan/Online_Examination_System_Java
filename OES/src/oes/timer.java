package oes;
import java.io.IOException;
import java.sql.SQLException;

import javax.script.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

public class timer implements Runnable{
	Object w;
	ExamDAO ed;
	boolean con=true;
	Thread t;
	int time;
	HttpSession session;
	public int time_(){	
		return time;
	}
	public timer(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		session=request.getSession();
		ed=(ExamDAO) session.getAttribute("ExamDAO");
		t=new Thread(this);
		t.start();
	}
	public void run(){
		while(con){
		try {
			if(ed.timeLeft()==0){
				con=false;
				t.stop();
			}
			else{
			time=ed.time_();
			}
			t.sleep(1000);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
}