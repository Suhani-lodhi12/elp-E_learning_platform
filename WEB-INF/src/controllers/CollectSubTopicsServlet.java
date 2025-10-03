package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.SubTopic;

@WebServlet("/viewSubTopics.do")
public class CollectSubTopicsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int courseTopicId = Integer.parseInt(request.getParameter("course_topic_id"));

        String records = "khali";

        List<SubTopic> subTopics = SubTopic.getByCourseTopicId(courseTopicId);

        Gson gson = new Gson();
        records = gson.toJson(subTopics);
      

        response.getWriter().write(records);
    }
}

