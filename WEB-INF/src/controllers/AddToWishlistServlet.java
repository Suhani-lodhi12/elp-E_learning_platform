package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import models.Course;
import models.User;
import models.WishList;

@WebServlet("/add_to_wishlist.do")
public class AddToWishlistServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            int userId = user.getUserId();
            int courseId = Integer.parseInt(request.getParameter("course_id"));
            
            WishList wishList = new WishList();
            
            // Check if the course is already in the wishlist
            if (wishList.isCourseInWishlist(userId, courseId)) {
                // If course is already in the wishlist, remove it
                wishList.removeFromWishlist(userId, courseId);
                response.getWriter().write("removed");
            } else {
                // If course is not in the wishlist, add it
                wishList.addToWishlist(userId, courseId);
                response.getWriter().write("added");
            }
        } else {
            response.getWriter().write("user_not_found");
        }
    }
}

