package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Trainer;
import models.User;

@WebServlet("/trainer_detail.do")
public class TrainerDetailServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        String nextPage = "index.do";

        if(user != null){
            if(user.getUserType().getUserTypeId() == 2){
                String experience = request.getParameter("experience");
                String skills = request.getParameter("skills");
                Integer launchedCourse = Integer.parseInt(request.getParameter("launched_courses"));
                String profession = request.getParameter("profession");
                String education = request.getParameter("education");

                Trainer trainer = new Trainer(experience,skills,launchedCourse,profession,education,user);
                if(trainer.saveDetail()){
                    user.updateUserTypeId();
                    
                    nextPage = "dashboard.do?user_type="+user.getUserType().getUserTypeId();
                } 
            }
        }
        response.sendRedirect(nextPage);
    }
}
