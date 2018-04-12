package com.ngoc.bookmanagement.validation;

import com.ngoc.bookmanagement.model.MessageResponse;

public interface UserValidation {

    MessageResponse checkUserIsExist(long userId);
}
