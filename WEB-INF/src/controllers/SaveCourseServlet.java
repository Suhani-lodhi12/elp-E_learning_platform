package controllers;

import java.io.IOException;
import java.io.File;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

import models.Course;
import models.Trainer;
import models.User;

@WebServlet("/save_course.do")
public class SaveCourseServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        String resp = "expired";

        if (user != null) {
            if (ServletFileUpload.isMultipartContent(request)) {
                Course course = new Course();

                Trainer trainer = (Trainer) session.getAttribute("trainer");
                course.setTrainer(trainer);
                try {
                    List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                    FileItem thumbnailFile = null;
                    FileItem pdfFile = null;

                    for (FileItem item : items) {
                        if (item.isFormField()) {
                            String fieldName = item.getFieldName();
                            String fieldValue = item.getString();

                            switch (fieldName) {
                                case "course_name":
                                    course.setCourseName(fieldValue);
                                    break;
                                case "learning_outcomes":
                                    course.setLearningOutcome(fieldValue);
                                    break;
                                case "description":
                                    course.setDescription(fieldValue);
                                    break;
                                case "hidden_topics":
                                    course.setCourseTopic(fieldValue);
                                    course.getCourseTopic();
                                    break;
                                case "key_features":
                                    course.setKeyFeature(fieldValue);
                                    break;
                                case "certification":
                                    course.setCertification(fieldValue);
                                    break;
                                case "prerequisites":
                                    course.setPrerequisite(fieldValue);
                                    break;
                                case "refund_policy":
                                    course.setRefundPolicy(fieldValue);
                                    break;
                                case "price":
                                    course.setPrice(Integer.parseInt(fieldValue));
                                    break;
                            }
                        } else {
                            if (item.getFieldName().equals("thumbnail")) {
                                String thumbnailName = System.currentTimeMillis() + "_" + item.getName();
                                thumbnailFile = item;
                                course.setThumbnail(thumbnailName);
                            } else if (item.getFieldName().equals("pdf")) {
                                String pdfName = System.currentTimeMillis() + "_" + item.getName();
                                pdfFile = item;
                                course.setPdf(pdfName);
                            }
                        }
                    }

                    String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads");
                    String coursePath = user.getUserId() + "/courses/" + course.getCourseName();
                    File courseFolder = new File(uploadPath, coursePath);
                    if (!courseFolder.exists())
                        courseFolder.mkdirs(); // Ensure directories exist

                    if (thumbnailFile != null) {
                        course.setThumbnail(coursePath + "/" + course.getThumbnail());
                    }
                    if (pdfFile != null) {
                        course.setPdf(coursePath + "/" + course.getPdf());
                    }

                    if (course.saveCourse()) {
                        resp = "saved";
                        

                        if (thumbnailFile != null) {
                            File file = new File(uploadPath, course.getThumbnail());
                            thumbnailFile.write(file);
                        }

                        // Save PDF
                        if (pdfFile != null) {
                            File file = new File(uploadPath, course.getPdf());
                            pdfFile.write(file);
                        }
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