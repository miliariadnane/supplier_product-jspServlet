package services;

import dao.SupplierDAO;
import dao.SupplierDAOHibernateImpl;
import models.Supplier;

import java.util.List;

public class SupplierServiceImpl implements SupplierService {

    private SupplierDAO supplierDAO = new SupplierDAOHibernateImpl();

    @Override
    public List<Supplier> getSuppliers() {
        return supplierDAO.getSuppliers();
    }

    @Override
    public void addSupplier(Supplier supplier) {
        supplierDAO.addSupplier(supplier);
    }

    @Override
    public void deleteSupplier(int id) {
        supplierDAO.deleteSupplier(id);
    }

    @Override
    public Supplier getSupplierById(int id) {
        return supplierDAO.getSupplierById(id);
    }
}
