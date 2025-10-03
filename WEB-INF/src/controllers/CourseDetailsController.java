package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.CourseTopic;
import models.SubTopic;
import models.Trainer;
import models.User;

@WebServlet("/CourseDetailsController.do")
public class CourseDetailsController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Trainer trainer = (Trainer) session.getAttribute("trainer");

        Integer courseId = (Integer) request.getAttribute("courseId");
        try {
            courseId = Integer.parseInt(request.getParameter("courseId"));
        } catch (NumberFormatException e) {
            response.sendRedirect("course.jsp");
            return;
        }

        // Validate courseId
        if (courseId == null || courseId == 0) {
            response.sendRedirect("course.jsp");
            return;
        }
        if (user != null) {
            if (trainer != null) {

                List<CourseTopic> topicList = CourseTopic.getTopicsByCourseId(courseId);

                int subtopicCount = SubTopic.getSubTopicCount(courseId);
                double totalDurationHours = SubTopic.getTotalDurationInHours(courseId);

                // You can even validate this ID against DB to make sure it's legit

                request.setAttribute("courseId", courseId);
                request.setAttribute("topicList", topicList);
                request.setAttribute("subtopicCount", subtopicCount);
                request.setAttribute("totalDurationHours", totalDurationHours);
                System.out.println(subtopicCount);
            }
        }

        request.getRequestDispatcher("courseTopic.jsp").forward(request, response);
    }
}
