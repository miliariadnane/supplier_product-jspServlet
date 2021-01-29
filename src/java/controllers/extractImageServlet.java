package controllers;

import models.Product;
import services.ProductService;
import services.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@WebServlet("/extractImageServlet")
public class extractImageServlet extends HttpServlet {

    private static final String SAVE_DIR = "uploads";

    ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String appPath = request.getServletContext().getRealPath("/").replace("build\\", "");
        String savePath = appPath + "resources"  + File.separator + "images" + File.separator + SAVE_DIR;

        int id = Integer.parseInt(request.getParameter("productId"));

        Product product = productService.getProductById(id);

        response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        ServletOutputStream writer = response.getOutputStream();
        byte[] rawBytes = null;
        File file = null;

        file = new File(savePath+File.separator+ product.getPhoto());
        if(file.exists()){
            rawBytes = Files.readAllBytes(file.toPath());
            writer.write(rawBytes);
        }
    }
}
