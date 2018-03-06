package com.ngoc.bookmanagement.repository;

import com.ngoc.bookmanagement.constant.Constant;
import com.ngoc.bookmanagement.exception.DuplicateEmailException;
import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.service.PasswordService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

@Repository
@Transactional(readOnly = true)
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private PasswordService passwordService;

    @Transactional
    public User getUserByEmail(String email){
        User user = null;

        Session session = sessionFactory.getCurrentSession();

        Query<User> query = session.createQuery("FROM User user WHERE user.email = :email", User.class);
        query.setParameter("email", email);
        List<User> users = query.getResultList();

        if(!users.isEmpty())
            user = users.get(0);

        return user;
    }

    @Transactional
    public User getUserByEmailAndPassword(String email, String password){
        User user = null;

        Session session = sessionFactory.getCurrentSession();

        Query<User> query = session.createQuery("FROM User user WHERE user.email = :email AND user.encryptingPassword = :encryptingPassword AND user.status = :status", User.class);
        query.setParameter("email", email);
        query.setParameter("encryptingPassword", passwordService.encryptPassword(password));
        query.setParameter("status", Constant.UNLOCK);
        List<User> users = query.getResultList();

        if(!users.isEmpty())
            user = users.get(0);

        return user;
    }

    @Transactional
    public User get(long id){
        return sessionFactory.getCurrentSession().get(User.class, id);
    }

    @Transactional
    public List<User> list(){
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<User> criteriaQuery = criteriaBuilder.createQuery(User.class);
        Root<User> root = criteriaQuery.from(User.class);
        criteriaQuery.select(root);
        Query<User> query = session.createQuery(criteriaQuery);
        return query.getResultList();
    }

    @Transactional
    public List<User> listWithUserRole() {
        Session session = sessionFactory.getCurrentSession();

        Query<User> query = session.createQuery("SELECT user FROM  User user WHERE user.role = :role", User.class);
        query.setParameter("role", Constant.USER_ROLE);
        List<User> userList = query.list();

        return userList;

    }

    @Transactional
    public void update(long id, User user){
        Session session = sessionFactory.getCurrentSession();

        String hqlUpdate = "UPDATE User user " +
                            "SET user.encryptingPassword = :encryptingPassword, user.firstName = :firstName, user.lastName = :lastName " +
                            "WHERE user.id = :id";

        session.createQuery(hqlUpdate)
                .setParameter("encryptingPassword", user.getEncryptingPassword())
                .setParameter("firstName", user.getFirstName())
                .setParameter("lastName", user.getLastName())
                .setParameter("id", id)
                .executeUpdate();
    }

    @Transactional
    public void updateProfile(long id, User user){
        Session session = sessionFactory.getCurrentSession();

        String hqlUpdate = "UPDATE User user " +
                "SET user.firstName = :firstName, user.lastName = :lastName " +
                "WHERE user.id = :id";

        session.createQuery(hqlUpdate)
                .setParameter("firstName", user.getFirstName())
                .setParameter("lastName", user.getLastName())
                .setParameter("id", id)
                .executeUpdate();
    }

    @Transactional
    public void updatePassword(long id, String password){
        Session session = sessionFactory.getCurrentSession();

        String hqlUpdate = "UPDATE User user " +
                "SET user.encryptingPassword = :encryptingPassword " +
                "WHERE user.id = :id";

        session.createQuery(hqlUpdate)
                .setParameter("encryptingPassword", passwordService.encryptPassword(password))
                .setParameter("id", id)
                .executeUpdate();
    }

    @Transactional
    public void updateStatus(long id, Boolean status){
        Session session = sessionFactory.getCurrentSession();

        String hqlUpdate = "UPDATE User user " +
                "SET user.status = :status " +
                "WHERE user.id = :id";

        session.createQuery(hqlUpdate)
                .setParameter("status", status)
                .setParameter("id", id)
                .executeUpdate();
    }

    @Transactional
    public long save(User user) throws DuplicateEmailException{

        if(getUserByEmail(user.getEmail()) != null)
            throw new DuplicateEmailException("Duplicate email");
        else {
            user.setEncryptingPassword(passwordService.encryptPassword(user.getPassword()));
            sessionFactory.getCurrentSession().save(user);
        }

        return user.getId();
    }

    @Transactional
    public void delete(long id){
        Session session = sessionFactory.getCurrentSession();
        User user = session.byId(User.class).load(id);
        session.delete(user);
    }
}
