package services;

import models.Supplier;

import java.util.List;

public interface SupplierService {
    List<Supplier> getSuppliers();
    void addSupplier(Supplier supplier);
    void deleteSupplier(int id);
    Supplier getSupplierById(int id);
}
