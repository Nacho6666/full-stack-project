package nacho404.web.fullstack.service;

import lombok.RequiredArgsConstructor;
import nacho404.web.fullstack.dtos.CredentialDto;
import nacho404.web.fullstack.dtos.SignUpDto;
import nacho404.web.fullstack.dtos.UserDto;
import nacho404.web.fullstack.entities.User;
import nacho404.web.fullstack.exceptions.AppException;
import nacho404.web.fullstack.mappers.UserMapper;
import nacho404.web.fullstack.repositories.UserRepository;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.nio.CharBuffer;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final UserMapper userMapper;

    public UserDto login(CredentialDto credentialDto) {
        User user = userRepository.findByLogin(credentialDto.login())
                .orElseThrow(() -> new AppException("Unknown user", HttpStatus.NOT_FOUND));

        if(passwordEncoder.matches(CharBuffer.wrap(credentialDto.password()),
                user.getPassword())) {
            return userMapper.toUserDto(user);
        }
        throw new AppException("Invalid password", HttpStatus.BAD_REQUEST);
    }

    public UserDto register(SignUpDto signUpDto) {
        Optional<User> oUser = userRepository.findByLogin(signUpDto.login());

        if( oUser.isPresent() ) {
            throw new AppException("Login already exist", HttpStatus.BAD_REQUEST);
        }

        User user = userMapper.signUpToUser(signUpDto);

        user.setPassword(passwordEncoder.encode(CharBuffer.wrap(signUpDto.password())));
        User savedUser = userRepository.save(user);

        return userMapper.toUserDto(savedUser);
    }
}
