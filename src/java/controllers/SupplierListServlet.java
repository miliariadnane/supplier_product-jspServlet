package controllers;

import services.SupplierService;
import services.SupplierServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.http.HttpSession;

@WebServlet("/supplier/list")
public class SupplierListServlet extends HttpServlet {

    SupplierService supplierService = new SupplierServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("suppliers", supplierService.getSuppliers());
        request.getRequestDispatcher("/views/list-suppliers.jsp")
                .forward(request,response);
    }
}
