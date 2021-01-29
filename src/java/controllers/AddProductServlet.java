package controllers;

import models.Product;
import services.ProductService;
import services.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/product/add")
@MultipartConfig(fileSizeThreshold=1024*1024*10,    // 10 MB 
                 maxFileSize=1024*1024*50,          // 50 MB
                 maxRequestSize=1024*1024*100,      // 100 MB
                 location="/")
public class AddProductServlet extends HttpServlet {

    /**
     * Name of the directory where uploaded files will be saved, relative to
     * the web application directory.
     */
    private static final String SAVE_DIR = "uploads";
    
    private final static Logger LOGGER = Logger.getLogger(AddProductServlet.class.getCanonicalName());

    ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/views/product-form.jsp")
                .forward(request,response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        Product product = new Product();
        
        String title = request.getParameter("title");
        System.out.println("title"+ title);
        String description = request.getParameter("description");
        System.out.println("description"+ description);
        double price = Double.parseDouble(request.getParameter("price"));
        System.out.println("price"+ price);
        
        /** upload file */

        /** get the real path of the application */
        String appPath = request.getServletContext().getRealPath("/").replace("build\\", "");
        System.out.println("path : "+appPath);
        /** specify the path where we would create the directory to store the files (images in our case) */
        String savePath = appPath + "resources"  + File.separator + "images" + File.separator + SAVE_DIR;
        System.out.println("savePath : "+savePath);
        /** ensure if the directory is already exists. */
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        
        
        Part part = request.getPart("file");
        System.out.println("filePart"+part);
        //String fileName = new File(extractFileName(filePart)).getName();
        String fileName = extractFileName(part);
        System.out.println("file name"+ fileName);
        
        //filePart.write(savePath + File.separator + fileName);

        
        OutputStream out = null;
        InputStream filecontent = null;
        final PrintWriter writer = response.getWriter();
        
        try {   
            out = new FileOutputStream(new File(savePath + File.separator + fileName));
            
            filecontent = part.getInputStream();
            int read = 0;
            final byte[] bytes = new byte[1024];
            
            while ((read = filecontent.read(bytes)) != -1) {
                
                out.write(bytes, 0, read);
            }
            writer.println("New file " + fileName + " created at " + savePath);
            LOGGER.log(Level.INFO, "File{0}being uploaded to {1}", new Object[]{fileName, savePath});
            
        }catch (FileNotFoundException fne) {
            writer.println("<br/> ERROR: " + fne.getMessage());
        }
        
        
        request.setAttribute("message", "Upload has been done successfully !");
        product.setTitle(title);
        product.setDescription(description);
        product.setPrice(price);
        product.setPhoto(fileName);
        productService.addProduct(product);
        response.sendRedirect("list");
    }
    
    /**
     * this function help to extract the file name from the hearders, so in this part we can retreive the file name
     * and in my case i change the name of the file by the current time in milliseconds
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                String orignalName = s.substring(s.indexOf("=") + 2, s.length()-1);
                String imageExtension = orignalName.split("\\.")[1];
                long time = System.currentTimeMillis();

                return time + "." + imageExtension;
            }
        }
        return "";
    }
}
