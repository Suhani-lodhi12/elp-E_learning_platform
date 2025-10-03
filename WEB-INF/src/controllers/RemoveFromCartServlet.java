package controllers;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import models.CartItem;
import models.Cart;
import models.User;

@WebServlet("/remove_from_cart.do")
public class RemoveFromCartServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            Integer courseId = Integer.parseInt(request.getParameter("course_id"));
            int userId = user.getUserId();
            System.out.println("++++" + userId);

            int cartId = Cart.getCartId(userId);
            if (cartId == -1) {
                response.getWriter().write("fail: cart not found");
                System.out.println("++++");
                return;
            }
            System.out.println("++++" + cartId);
            
            double coursePrice = CartItem.getItemPrice(courseId);
            if (coursePrice == -1) {
                System.out.println("++++%");
                response.getWriter().write("fail: course not found with ID " + courseId);
                return;
            }
            System.out.println("++++%" + coursePrice);

            boolean itemDeleted = CartItem.deleteCartItemById(cartId,courseId);
            System.out.println("####%" + itemDeleted);
            
            if (itemDeleted) {
                System.out.println("####%" + itemDeleted);
                // Update the cart total after deletion
                boolean totalUpdated = Cart.updateCartTotal(cartId, coursePrice);
                System.out.println("####%%" + totalUpdated);


                if (totalUpdated) {
                    response.getWriter().write("success");
                } else {
                    response.getWriter().write("total_update_failed");
                }
            } else {
                response.getWriter().write("delete_failed");
            }
        } else {
            response.getWriter().write("user_not_logged_in");
        }
    }
}
