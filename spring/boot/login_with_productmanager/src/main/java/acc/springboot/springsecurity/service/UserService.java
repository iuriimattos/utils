package acc.springboot.springsecurity.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import acc.springboot.springsecurity.model.User;
import acc.springboot.springsecurity.web.dto.UserRegistrationDto;

public interface UserService extends UserDetailsService {

    User findByEmail(String email);

    User save(UserRegistrationDto registration);
}

