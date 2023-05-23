package com.nizar.chitchatee.dao;

import com.nizar.chitchatee.models.Message;

import java.util.List;

public interface MessageDAO {
    void save(Message message);

    void update(Message message);

    void delete(Message message);

    Message findById(Long id);

    List<Message> findAll();
}
