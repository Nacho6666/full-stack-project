package nacho404.web.fullstack.mappers;

import nacho404.web.fullstack.dtos.SignUpDto;
import nacho404.web.fullstack.dtos.UserDto;
import nacho404.web.fullstack.entities.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface UserMapper {
    UserDto toUserDto(User user);

    //because password is char[] in SignUpDto, but String in class User
    @Mapping(target = "password", ignore = true)
    User signUpToUser(SignUpDto signUpDto);
}
