package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.Cart;
import models.User;

@WebServlet("/get_cart_items.do")
public class GetCartItemsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            int userId = user.getUserId();
            List<Cart> items = Cart.getCartItemsByUserId(userId);
            
            // Set the content type to application/json
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Create a JSON array from the cart items
            Gson gson = new Gson();
            String json = gson.toJson(items);

            // Send the JSON response to the client
            response.getWriter().write(json);
        } else {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User is not logged in");
        }
    }
}
