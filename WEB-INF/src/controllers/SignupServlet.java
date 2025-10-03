package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import models.UserType;
import models.Country;

@WebServlet("/signup.do")
public class SignupServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        Integer countryId = Integer.parseInt(request.getParameter("country_id"));
        Integer userTypeId = Integer.parseInt(request.getParameter("user_type_id"));
        
        String nextPage = "index.do?signup=false";

        User user = new User(name, email, password, new Country(countryId), phone, new UserType(userTypeId));
        if(user.saveUser()) {
            nextPage = "index.do?signup=true";
        } 
        response.sendRedirect(nextPage);
    }
}