package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.CourseTopic;
import models.SubTopic;

@WebServlet("/collectAllCourseTopics.do")
public class CollectCourseTopicServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int courseId = Integer.parseInt(request.getParameter("course_id"));

        String records = "khali";

        List<CourseTopic> topicList = CourseTopic.getTopicsByCourseId(courseId);
        SubTopic.collectAllSubTopics(topicList);
        

        Gson gson = new Gson();
        records = gson.toJson(topicList);
        response.setContentType("application/json");
        System.out.println(records);

        response.getWriter().write(records);
    }
}
