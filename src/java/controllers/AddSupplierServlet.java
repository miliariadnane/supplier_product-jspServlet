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

@WebServlet("/supplier/add")
public class AddSupplierServlet extends HttpServlet {

    SupplierService supplierService = new SupplierServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/views/supplier-form.jsp")
                .forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Supplier supplier = new Supplier();

        if (request.getParameter("supplierId") != null && !request.getParameter("supplierId").isEmpty()) {
            supplier.setId(Integer.parseInt(request.getParameter("supplierId")));
        }

        supplier.setFirstName(request.getParameter("firstName"));
        supplier.setLastName(request.getParameter("lastName"));
        supplier.setEmail(request.getParameter("email"));
        supplier.setPhone(request.getParameter("phone"));
        supplier.setAddress(request.getParameter("address"));
        supplierService.addSupplier(supplier);
        response.sendRedirect("list");
    }
}
