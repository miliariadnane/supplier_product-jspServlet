package dao;

import models.Product;

import java.util.List;

/**
 * simple DAO class that will take care of keeping these components neatly decoupled from each other.
 */
public interface ProductDAO {
    List<Product> getProducts();
    void addProduct(Product post);
    void deleteProduct(int id);
    Product getProductById(int id);
}
