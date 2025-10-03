package controllers;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download_pdf.do")
public class DownloadPdfServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pdfFile = request.getParameter("pdf");
        if (pdfFile == null || pdfFile.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid file name");
            return;
        }

        InputStream is = getServletContext().getResourceAsStream("/WEB-INF/uploads/" + pdfFile);
        if (is == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
            return;
        }

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + pdfFile + "\"");

        byte[] buffer = new byte[1024];
        int bytesRead;
        OutputStream os = response.getOutputStream();
        while ((bytesRead = is.read(buffer)) != -1) os.write(buffer, 0, bytesRead);

        is.close();
        os.flush();
        os.close();
    }
}
