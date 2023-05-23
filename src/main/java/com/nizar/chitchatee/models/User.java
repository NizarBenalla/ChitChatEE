package com.nizar.chitchatee.models;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table
public class User {

    private String sessionID;
    private String username;
    @OneToMany
    private List<Message> messages;
    @Id
    @GeneratedValue
    private Long id;

    public User() {
    }

    public String getSessionID() {
        return sessionID;
    }

    public void setSessionID(String sessionID) {
        this.sessionID = sessionID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<Message> getMessages() {
        return messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}
