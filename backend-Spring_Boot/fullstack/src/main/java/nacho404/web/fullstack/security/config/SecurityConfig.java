package nacho404.web.fullstack.security.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@EnableWebSecurity
@Configuration
public class SecurityConfig {
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        /**
         這段規則做了兩件事
         1. uri帶有 /auth 字串就必須經過驗證(登入)
         2. 其他則不需驗證就通過
         */
        http.authorizeHttpRequests((authorize) -> {
            authorize
                    .requestMatchers("/auth*").authenticated()
                    .anyRequest().permitAll();
        });

        return http.build();
    }
}
