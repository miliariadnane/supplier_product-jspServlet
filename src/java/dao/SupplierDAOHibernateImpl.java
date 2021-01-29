package dao;

import java.util.ArrayList;
import models.Supplier;
import org.hibernate.Session;

import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * Implementation of Dao interface which give us the possiblty the exchnage with dataBase by using
 * a hibernate sessions (execute queries)
 * (the part where we persist the data)
 */
public class SupplierDAOHibernateImpl implements SupplierDAO {
    

    @Override
    public List<Supplier> getSuppliers() {
        SessionFactory sf=new Configuration().configure().buildSessionFactory();

        Session currentSession =sf.openSession();
        currentSession.beginTransaction();
        
        List<Supplier> suppliers = new ArrayList<>();
        suppliers = currentSession.createQuery("from Supplier").list();
        
        return suppliers;
    }

    /**
     * Here we use the function saveOrUpdate to reduce the code, so we can pass the save and update
     * methods with the same function, and to make the differance beetween those two methods we will
     * hidden input
     */
    @Override
    public void addSupplier(Supplier supplier) {
        
        SessionFactory sf=new Configuration().configure().buildSessionFactory();
        Session currentSession =sf.openSession();
        currentSession.beginTransaction();
        System.out.println(supplier);
        currentSession.saveOrUpdate(supplier);
        currentSession.getTransaction().commit();
    }

    /**
     * When we try to delete an object we just need to retrieve the id
     */
    @Override
    public void deleteSupplier(int id) {
        SessionFactory sf=new Configuration().configure().buildSessionFactory();
        Session currentSession =sf.openSession();
        currentSession.beginTransaction();
        Supplier supplier = (Supplier) currentSession.get(Supplier.class, id);
        currentSession.delete(supplier);
        currentSession.getTransaction().commit();
    }

    @Override
    public Supplier getSupplierById(int id) {
        SessionFactory sf=new Configuration().configure().buildSessionFactory();
        Session currentSession =sf.openSession();
        currentSession.beginTransaction();
        Supplier supplier = (Supplier) currentSession.get(Supplier.class, id);
        currentSession.getTransaction().commit();
        return supplier;
    }
}
