package com.nizar.chitchatee.models;

import jakarta.persistence.*;

@Entity
@Table
public class Message {


    @Id
    private Long id;
    private String content;

    public Message() {
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
