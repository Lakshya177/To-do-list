package dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.Task;
import util.HibernateUtil;

public class TaskDAO {

    public void saveTask(Task t) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        session.persist(t);

        tx.commit();
        session.close();
    }

    public List<Task> getTasks(int start){

        Session session = HibernateUtil.getSessionFactory().openSession();

        Query q = session.createQuery("from Task");
        q.setFirstResult(start);
        q.setMaxResults(5);

        List<Task> list = q.list();

        session.close();

        return list;
    }
}