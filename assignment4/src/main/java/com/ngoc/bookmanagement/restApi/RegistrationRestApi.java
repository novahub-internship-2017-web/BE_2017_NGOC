package com.ngoc.bookmanagement.restApi;

import com.ngoc.bookmanagement.constant.RoleConstant;
import com.ngoc.bookmanagement.model.Role;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.RoleRepository;
import com.ngoc.bookmanagement.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@RestController
public class RegistrationRestApi {

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private UserRepository userRepository;

    @PostMapping(value = "/api/registration",  produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<?> registrationPost(@RequestBody @Valid User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            ArrayList<String> listErrors = new ArrayList<>();

            for(ObjectError objectError : bindingResult.getAllErrors()){
                listErrors.add( objectError.toString());
            }

            return new ResponseEntity<List<String>>( listErrors, HttpStatus.BAD_REQUEST);
        } else {

            // TODO: check user is exists

            Role role = new Role();
            role.setName(RoleConstant.ROLE_USER);
            role = roleRepository.save(role);

            user.setRoleId(role.getId());
            user = userRepository.save(user);

            return new ResponseEntity<User>(user, HttpStatus.OK);
        }
    }
}
