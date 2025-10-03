package controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.SubTopic;

@WebServlet("/togglePreview.do")
public class TogglePreviewServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int subTopicId = Integer.parseInt(request.getParameter("subTopicId"));
    boolean currPreview = Boolean.parseBoolean(request.getParameter("currPreview"));

    SubTopic subTopic = SubTopic.getPreviewById(subTopicId);

    if (subTopic != null) {
        boolean newPreview = !currPreview; // toggle preview
        subTopic.setPreview(newPreview);
        subTopic.updatePreview();

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(Boolean.toString(newPreview)); // 👈 Clean plain output
    } else {
        response.setContentType("text/plain");
        response.getWriter().write("failed");
    }
    }
}
