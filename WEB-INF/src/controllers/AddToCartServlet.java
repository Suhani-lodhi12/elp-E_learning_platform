package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import models.Cart;
import models.CartItem;
import models.User;

@WebServlet("/add_to_cart.do")
public class AddToCartServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        String result = "false";
        if (user != null) {
            int userId = user.getUserId();
            int courseId = Integer.parseInt(request.getParameter("course_id"));
            int price = Integer.parseInt(request.getParameter("course_Price"));
            int discount = Integer.parseInt(request.getParameter("course_discount"));
            Cart cart = new Cart();


            int cartId = cart.getOrCreateCartId(userId);
            System.out.println(cartId);
            CartItem cartItem = new CartItem();

            if(cartItem.addCartItem(cartId, courseId, price, discount)){
                result = "true";
                cart.updateCartTotal(userId, price);  
                cart.incrementCourses(userId);
            }
            
            
            response.getWriter().write(result);
            // cart.incrementCourses(userId) ;
                     

        }
    }
}
