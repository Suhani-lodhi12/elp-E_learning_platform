package controllers;

import models.Course;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.google.gson.Gson;

import java.io.File;
import java.io.IOException;
import java.util.List;
import models.Subscription;

@WebServlet("/myCourses.do")
public class MyCoursesServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String records = "[]";
        if(user != null){
            int userId = user.getUserId();
            System.out.println(userId);

            List<Subscription> enrolledCourses = Subscription.getEnrolledCoursesByUserId(userId);
            System.out.println(enrolledCourses);
 
            // request.setAttribute("enrolledCourses", enrolledCourses);

            Gson gson = new Gson();
            records = gson.toJson(enrolledCourses);
            response.setContentType("application/json");
            System.out.println(records + "-");

        }
        response.getWriter().write(records);
    }
}
