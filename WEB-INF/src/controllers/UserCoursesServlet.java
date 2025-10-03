package controllers;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Course;
import models.CourseTopic;
import models.SubTopic;
import models.User;

@WebServlet("/user_courses.do")
public class UserCoursesServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            int courseId = Integer.parseInt(request.getParameter("courseId"));
            System.out.println("+++" + courseId);

            // Course course = Course.getCourseById(courseId);
            List<CourseTopic> topicList = CourseTopic.getTopicsByCourseId(courseId);
            System.out.println("****" + topicList);

            SubTopic.collectAllSubTopics(topicList);

            // request.setAttribute("course", course);
            // request.setAttribute("courseTopic", courseTopics);
            request.setAttribute("topicList", topicList);
        }

        request.getRequestDispatcher("user_course_details.jsp").forward(request, response);
    }
}
