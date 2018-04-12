package com.ngoc.bookmanagement.validation;

import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.model.User;

public interface UserValidation {

    MessageResponse checkUserIsExist(long userId);

    MessageResponse validateUser(User user, Class classValidation);

    MessageResponse checkEmailIsExist(User user);

}
