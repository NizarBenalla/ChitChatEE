package com.nizar.chitchatee.dao.impl;

import com.nizar.chitchatee.dao.MessageDAO;
import com.nizar.chitchatee.models.Message;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;

import java.util.List;

public class MessageDAOImpl implements MessageDAO {
    private final EntityManagerFactory entityManagerFactory;

    public MessageDAOImpl() {
        entityManagerFactory = Persistence.createEntityManagerFactory("default");
    }

    @Override
    public void save(Message message) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(message);
            entityManager.getTransaction().commit();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public void update(Message message) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(message);
            entityManager.getTransaction().commit();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public void delete(Message message) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.remove(entityManager.merge(message));
            entityManager.getTransaction().commit();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public Message findById(Long id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.find(Message.class, id);
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<Message> findAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            CriteriaBuilder cb = entityManager.getCriteriaBuilder();
            CriteriaQuery<Message> query = cb.createQuery(Message.class);
            Root<Message> root = query.from(Message.class);
            query.select(root);
            return entityManager.createQuery(query).getResultList();
        } finally {
            entityManager.close();
        }
    }
}
