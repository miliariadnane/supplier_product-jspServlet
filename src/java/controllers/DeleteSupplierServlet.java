package controllers;

import services.SupplierService;
import services.SupplierServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/supplier/delete")
public class DeleteSupplierServlet extends HttpServlet {

    private SupplierService supplierService = new SupplierServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String id = request.getParameter("supplierId");
        supplierService.deleteSupplier(Integer.parseInt(id));
        response.sendRedirect("list");

    }
}
