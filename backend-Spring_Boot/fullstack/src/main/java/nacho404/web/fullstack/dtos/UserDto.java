package nacho404.web.fullstack.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserDto {

    private long id;
    private String firstName;
    private String lastName;
    private String login;
    private String Token;
}
//UserDto is a POJO: a Plain old JAVA object

