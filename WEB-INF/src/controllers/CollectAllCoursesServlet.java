package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import models.Course;
import models.Trainer;

import com.google.gson.Gson;

@WebServlet("/collect_all_courses.do")
public class CollectAllCoursesServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        // User user = (User)session.getAttribute("user");
        Trainer trainer = (Trainer)session.getAttribute("trainer");

        String json = "expired";

        if(trainer != null) {
            ArrayList<Course> courses = Course.collectAllCourses(trainer);

            for (Course course : courses) {
                System.out.println("Videos: " + course.getVideo());
            }
        
        

            System.out.println("~~~~~~~" + courses);
            json = new Gson().toJson(courses);
        }

        response.getWriter().write(json);
    }
}
