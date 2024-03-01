package nacho404.web.fullstack.dtos;


//User record because "Record is immutable"
public record CredentialDto(String login, char[] password) {
}
