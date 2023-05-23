package com.nizar.chitchatee.dao;

import com.nizar.chitchatee.models.User;

import java.util.List;

public interface UserDAO {

    void save(User message);

    void update(User message);

    void delete(User message);

    User findById(int id);

    List<User> findAll();
}