package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.model.Avatar;
import com.ngoc.bookmanagement.repository.AvatarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AvatarServiceImpl implements AvatarService{

    @Autowired
    private AvatarRepository avatarRepository;

    public Avatar get(long id) {
        return avatarRepository.get(id);
    }

    public List<Avatar> list() {
        return avatarRepository.list();
    }

    public void update(long id, Avatar avatar) {
        avatarRepository.update(id, avatar);
    }

    public long save(Avatar avatar) {
        avatarRepository.save(avatar);
        return avatar.getId();
    }

    public void delete(long id) {
        avatarRepository.delete(id);
    }
}
