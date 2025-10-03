package controllers;

import models.Subscription;
import models.User;
import utils.EmailSender;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet("/SaveSubscription.do")
public class SaveSubscriptionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        int userId = user.getUserId();
        String userEmail = user.getEmail();  // Make sure your User model has getEmail()

        System.out.println(">>> User ID: " + userId);
        String[] courseIds = request.getParameterValues("course_ids[]");

        int price = (int) Double.parseDouble(request.getParameter("price"));
        System.out.println(">>> Price: " + price);

        try {
            Timestamp purchaseDate = new Timestamp(new Date().getTime());
            int validityDays = 365;
            int statusId = 5;

            StringBuilder courseList = new StringBuilder();

            if (courseIds != null) {
                for (String courseIdStr : courseIds) {
                    int courseId = Integer.parseInt(courseIdStr);
                    Subscription.save(userId, courseId, purchaseDate, price, validityDays, statusId);
                    courseList.append(courseId).append(", ");
                }
            }

            // ✅ Send confirmation email
            String subject = "Course Purchase Confirmation";
            String body = "Dear " + user.getName() + ",\n\n" +
                          "Thank you for your purchase!\n" +
                          "Courses Purchased: " + courseList.toString() + "\n" +
                          "Total Amount: ₹" + price + "\n\n" +
                          "We appreciate your support.\n\n" +
                          "Best regards,\nYour Course Team";

            EmailSender.sendEmail(userEmail, subject, body);

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("success");

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error saving subscription or sending email.");
        }
    }
}
