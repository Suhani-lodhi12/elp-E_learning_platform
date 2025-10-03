package listeners;

import java.util.TreeSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import models.Country;
import models.CourseTopic;
import utils.DBConnect;

@WebListener
public class AppListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent ev) {
        ServletContext context = ev.getServletContext();

        // -- ############# Setup BMT DB ############# --
        DBConnect.dbURL = context.getInitParameter("dburl");
        DBConnect.dbUser = context.getInitParameter("dbuser");
        DBConnect.dbPassword = context.getInitParameter("dbpassword");

        // -- ############# Collect Countries ############ --
        TreeSet<Country> countries = Country.collectCountries();
        context.setAttribute("countries", countries);

        
    }

    public void contextDestroyed(ServletContextEvent ev) {
        
    }
}