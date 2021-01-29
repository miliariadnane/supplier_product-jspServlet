package dao;


import models.Supplier;
import java.util.List;

/**
 * simple DAO class that will take care of keeping these components neatly decoupled from each other.
 */
public interface SupplierDAO {
    List<Supplier> getSuppliers();
    void addSupplier(Supplier supplier);
    void deleteSupplier(int id);
    Supplier getSupplierById(int id);
}
