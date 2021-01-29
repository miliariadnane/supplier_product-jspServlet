package dao;

import java.util.ArrayList;
import models.Product;
import org.hibernate.Session;

import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * Implementation of Dao interface which give us the possiblty the exchnage with dataBase by using
 * a hibernate sessions (execute queries)
 * (the part where we persist the data)
 */
public class ProductDAOHibernateImpl implements ProductDAO {
    @Override
    public List<Product> getProducts() {

        SessionFactory sf=new Configuration().configure().buildSessionFactory();
        Session currentSession =sf.openSession();
        currentSession.beginTransaction();
        List<Product> products = new ArrayList<>();
        products = currentSession.createQuery("from Product").list();
        currentSession.getTransaction().commit();
        return products;
    }

    /**
     * In this case, i haven't use the saveOrUpdate method because, in this module I use just the save method
     *
     */
    @Override
    public void addProduct(Product product) {
        
        SessionFactory sf=new Configuration().configure().buildSessionFactory();
        Session currentSession =sf.openSession();
        currentSession.beginTransaction();
        System.out.println(product);
        currentSession.save(product);
        currentSession.getTransaction().commit();
    }
    
    @Override
    public void deleteProduct(int id) {
        SessionFactory sf=new Configuration().configure().buildSessionFactory();
        Session currentSession =sf.openSession();
        currentSession.beginTransaction();
        Product product = (Product) currentSession.get(Product.class, id);
        currentSession.delete(product);
        currentSession.getTransaction().commit();
    }

    @Override
    public Product getProductById(int id) {
        
        SessionFactory sf=new Configuration().configure().buildSessionFactory();
        Session currentSession =sf.openSession();
        currentSession.beginTransaction();
        Product product = (Product) currentSession.get(Product.class, id);
        currentSession.getTransaction().commit();
        return product;
    }
}
