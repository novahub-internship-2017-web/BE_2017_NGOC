package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.model.Avatar;

import java.util.List;

public interface AvatarService {

    Avatar get(long id);

    List<Avatar> list();

    void update(long id, Avatar avatar);

    long save(Avatar avatar);

    void delete(long id);
}
