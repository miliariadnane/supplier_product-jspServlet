package controllers;

import models.Supplier;
import services.SupplierService;
import services.SupplierServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/supplier/update")
public class UpdateSupplierServlet extends HttpServlet {

    private SupplierService supplierService = new SupplierServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("supplierId");
        Supplier supplier = supplierService.getSupplierById(Integer.parseInt(id));
        request.setAttribute("supplier", supplier);
        request.getRequestDispatcher("/views/supplier-form.jsp")
                .forward(request,response);
    }
}
