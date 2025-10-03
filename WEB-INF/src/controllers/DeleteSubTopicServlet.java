package controllers;

import models.SubTopic;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/deleteSubTopic.do")
public class DeleteSubTopicServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        Integer subTopicId = Integer.parseInt(request.getParameter("sub_topic_id"));

        if (user != null) {

            // Get full subtopic details (with video path)
            SubTopic subtopic = SubTopic.getById(subTopicId); // You should already have this static method
            if (subtopic == null) {
                response.getWriter().write("not_found");
                return;
            }

            // Resolve video path
            String videoPath = subtopic.getVideo(); // Example: "5/courses/Java/Intro/filename.mp4"
            System.out.println("#####"+videoPath);
            String fullVideoPath = getServletContext().getRealPath("/WEB-INF/uploads/" + videoPath);

            // Delete the file
            File videoFile = new File(fullVideoPath);
            if (videoFile.exists()) {
                videoFile.delete();
            }

            // Delete the subtopic record from DB
            boolean deleted = SubTopic.deleteSubTopicById(subTopicId);

            if (deleted) {
                response.getWriter().write("success");
            } else {
                response.getWriter().write("db_error");
            }
        }
    }
}
