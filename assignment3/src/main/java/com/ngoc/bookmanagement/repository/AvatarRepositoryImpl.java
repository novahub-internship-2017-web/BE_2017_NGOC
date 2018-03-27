package com.ngoc.bookmanagement.repository;

import com.ngoc.bookmanagement.model.Avatar;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional(readOnly = true)
public class AvatarRepositoryImpl implements AvatarRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public Avatar get(long id) {
        return sessionFactory.getCurrentSession().get(Avatar.class, id);
    }

    @Transactional
    public List<Avatar> list() {
        Session session = sessionFactory.getCurrentSession();

        Query<Avatar> query = session.createQuery("SELECT avatar FROM Avatar avatar JOIN User user ON avatar.user_id = user.id", Avatar.class);
        List<Avatar> avatarList = query.list();

        return avatarList;
    }

    @Transactional
    public void update(long id, Avatar avatar) {
        Session session = sessionFactory.getCurrentSession();
        Avatar avatarUpdating = session.get(Avatar.class, id);
        avatarUpdating.setUrl(avatar.getUrl());
        session.flush();
    }

    @Transactional
    public long save(Avatar avatar) {
        sessionFactory.getCurrentSession().save(avatar);
        return avatar.getId();
    }

    @Transactional
    public void delete(long id) {
        Session session = sessionFactory.getCurrentSession();
        Avatar avatar = session.byId(Avatar.class).load(id);
        session.delete(avatar);
    }
}
