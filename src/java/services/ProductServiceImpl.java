package services;

import dao.ProductDAO;
import dao.ProductDAOHibernateImpl;
import models.Product;

import java.util.List;

/**
 * after we have make dao interfaces and the implementations (in this part we communicate with the DB,
 * but now we will pass the infos from the dao layer (data layer) to service layer, after that those functions
 * will be resue it the controllers (servlet)
 */
public class ProductServiceImpl implements ProductService {

    private ProductDAO productDAO = new ProductDAOHibernateImpl();

    @Override
    public List<Product> getProducts() {
        return productDAO.getProducts();
    }

    @Override
    public void addProduct(Product product) {
        productDAO.addProduct(product);
    }
    
    @Override
    public void deleteProduct(int id) {
        productDAO.deleteProduct(id);
    }

    @Override
    public Product getProductById(int id) {
        return productDAO.getProductById(id);
    }
}
