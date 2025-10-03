package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Trainer;
import models.User;

@WebServlet("/signin.do")
public class SigninServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        String nextPage = "index.do?signin_status=";

        String email = request.getParameter("signin_email");
        String password = request.getParameter("signin_password");

        User user = new User(email, password);
        user.signinUser();
        int status = user.getStatus().getStatusId();
        switch (status) {
            case 1:
                session.setAttribute("user", user);
                // ------------------------------
                // Check if the signed-in user is a trainer
                if (user.getUserType().getUserTypeId() == 1) { // Assuming 2 is Trainer
                    Trainer trainer = Trainer.getTrainerByUserId(user.getUserId());
                    if (trainer != null) {
                        session.setAttribute("trainer", trainer);
                    }
                }
                // ------------------------------

                nextPage = "dashboard.do?user_type=" + user.getUserType().getUserTypeId();
                break;
            default:
                nextPage += (status + "&email=" + user.getEmail());
        }
        response.sendRedirect(nextPage);
    }
}