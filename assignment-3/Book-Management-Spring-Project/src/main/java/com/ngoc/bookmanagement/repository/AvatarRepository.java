package com.ngoc.bookmanagement.repository;

import com.ngoc.bookmanagement.model.Avatar;

import java.util.List;

public interface AvatarRepository {

    Avatar get(long id);

    List<Avatar> list();

    void update(long id, Avatar avatar);

    long save(Avatar avatar);

    void delete(long id);
}
