package nacho404.web.fullstack.security.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;

@RequiredArgsConstructor
@EnableWebSecurity
@Configuration
public class SecurityConfig {

    private final UserAuthProvider userAuthProvider;
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        /**
         這段規則做了兩件事
         1. uri帶有 /auth 字串就必須經過驗證(登入)
         2. 其他則不需驗證就通過
         */
        http
                .addFilterBefore(new JwtAuthFilter(userAuthProvider), BasicAuthenticationFilter.class)
                .csrf(AbstractHttpConfigurer::disable)
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .cors(customizer -> customizer.configurationSource(corsConfigurationSource()))
                .authorizeHttpRequests((authorize) -> {
                    authorize
                            .requestMatchers(HttpMethod.POST, "/login", "register").permitAll()
                            .requestMatchers(HttpMethod.GET, "/messages").permitAll()
                            .requestMatchers("/auth*").authenticated()
                            .anyRequest().authenticated();
//                            .anyRequest().permitAll();
                });

        return http.build();
    }

    @Bean
    public UrlBasedCorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("http://localhost:4200", "http://localhost:5678")); // 允许的源
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE")); // 允许的HTTP方法
        configuration.setAllowedHeaders(Arrays.asList("Authorization", "Content-Type", "Accept")); // 允许的头部
        configuration.setAllowCredentials(true); // 允许凭证
        configuration.setMaxAge(3600L); // 预检请求的缓存时间

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration); // 对所有路径应用这个配置
        return source;
    }
}
