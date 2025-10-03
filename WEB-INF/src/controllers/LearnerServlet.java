package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import models.Course;
import models.User;

@WebServlet("/learner.do")
public class LearnerServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String nextPage = "index.do";

        if (user != null) {
            ArrayList<Course> courses = Course.collectAllCourses();

            request.setAttribute("courses", courses);
            System.out.println("~~~~~~" + courses);
            nextPage = "learner.jsp";
        }
        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}









