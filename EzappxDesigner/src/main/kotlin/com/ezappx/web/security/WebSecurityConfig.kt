package com.ezappx.web.security

import com.ezappx.web.services.EzappUserDetailService
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
class WebSecurityConfig : WebSecurityConfigurerAdapter() {

    @Bean
    override fun userDetailsService() = EzappUserDetailService()

    override fun configure(http: HttpSecurity?) {
        http!!.csrf().disable()
        http.authorizeRequests()
                .antMatchers("/", "/register").permitAll()
                .antMatchers("/css/**", "/js/**").permitAll()
                .antMatchers("/upload/**").permitAll()
                .antMatchers("/resource/static/**").permitAll()
                .anyRequest().authenticated().and()
                .formLogin().loginPage("/login")
                .defaultSuccessUrl("/designer", true)
                .permitAll().and()
                .logout().logoutUrl("/logout").permitAll()
        http.authorizeRequests().and().rememberMe()
        http.logout().logoutSuccessUrl("/")
    }

    override fun configure(auth: AuthenticationManagerBuilder?) {
        auth?.userDetailsService(userDetailsService())
    }
}
