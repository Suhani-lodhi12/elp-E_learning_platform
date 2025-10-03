package controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import models.Course;
import models.CourseTopic;
import models.User;

@WebServlet("/addCourseTopic.do")
public class AddCourseTopicServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String topicName = request.getParameter("topicName");
        String courseIdStr = request.getParameter("courseId");

        if (user != null) {
            if (courseIdStr != null && !courseIdStr.trim().isEmpty()) {
                try {
                    int courseId = Integer.parseInt(courseIdStr.trim());

                    CourseTopic courseTopic = new CourseTopic(topicName, new Course(courseId));
                    if (courseTopic.saveCourseTopic()) {
                        

                        response.sendRedirect("CourseDetailsController.do?courseId=" + courseId);
                        return;
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Invalid courseId: '" + courseIdStr + "'");
                    e.printStackTrace();
                }
            } else {
                System.out.println("courseId is missing or empty.");
            }
        }

        response.sendRedirect("error.jsp"); 
    }
}
