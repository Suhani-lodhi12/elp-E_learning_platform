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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import models.CourseTopic;
import models.SubTopic;
import models.Trainer;
import models.User;

@WebServlet("/addSubTopic.do")
public class AddSubTopicServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String resp = "expired";

        if (user != null) {
            if (ServletFileUpload.isMultipartContent(request)) {
                SubTopic subtopic = new SubTopic();

                Trainer trainer = (Trainer) session.getAttribute("trainer");
                try {

                    List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                    FileItem videoFile = null;
                    String courseTopicName = null;

                    for (FileItem item : items) {
                        if (item.isFormField()) {
                            String fieldName = item.getFieldName();
                            String fieldValue = item.getString();

                            switch (fieldName) {
                                case "title":
                                    subtopic.setTitle(fieldValue);
                                    break;
                                case "duration":
                                    if (fieldValue != null && !fieldValue.trim().isEmpty()) {
                                        subtopic.setDuration(Integer.parseInt(fieldValue.trim()));
                                    } else {
                                        subtopic.setDuration(0); // default or handle appropriately
                                    }
                                    break;

                                case "course_topic_id":
                                    subtopic.setCourseTopic(new CourseTopic(Integer.parseInt(fieldValue)));
                                    break;
                                case "course_topic_name":
                                    courseTopicName = fieldValue;
                                    break;
                            }
                        } else {
                            if (item.getFieldName().equals("videoFile")) {
                                String videoName = System.currentTimeMillis() + "_" + item.getName();
                                videoFile = item;
                                subtopic.setVideo(videoName);
                            }
                        }
                    }

                    String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads");
                    String subTopicPath = user.getUserId() + "/courses/" + courseTopicName + "/" + subtopic.getTitle();
                    File subTopicFolder = new File(uploadPath, subTopicPath);
                    if (!subTopicFolder.exists())
                        subTopicFolder.mkdirs(); // Ensure directories exist

                    if (videoFile != null) {
                        subtopic.setVideo(subTopicPath + "/" + subtopic.getVideo());
                    }

                    if (subtopic.saveSubTopic()) {
                        resp = "saved";
                        CourseTopic fullTopic = CourseTopic.getById(subtopic.getCourseTopic().getCourseTopicId());
                        int courseId = fullTopic.getCourse().getCourseId();

                        if (videoFile != null) {
                            File file = new File(uploadPath, subtopic.getVideo());
                            videoFile.write(file);
                        }

                        response.sendRedirect("CourseDetailsController.do?courseId=" + courseId);
                        return;
                    } else {
                        response.sendRedirect("error.jsp");
                    }
                } catch (FileUploadException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        response.getWriter().write(resp);

    }

}
