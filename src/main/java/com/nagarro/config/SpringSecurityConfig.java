package com.nagarro.config;

import org.springframework.context.annotation.Bean;


import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter{

	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.csrf().disable().authorizeRequests()
        .antMatchers("/anonymous*").anonymous()
        .antMatchers("/login*").permitAll()
        .antMatchers("/resources/**").permitAll()
        .anyRequest()
        .authenticated().and().httpBasic()
        .and().formLogin().loginPage("/login")
        .loginProcessingUrl("/perform_login")
        .defaultSuccessUrl("/home", true)
        .and()
        .logout()
        .logoutUrl("/perform_logout")
        .invalidateHttpSession(true)
        .logoutSuccessUrl("/login");
        
		
		/*
		http.authorizeRequests().antMatchers("/anonymous*").anonymous().antMatchers("/login*").permitAll()
		.antMatchers("/resources/*").permitAll().anyRequest()
		.authenticated().and().httpBasic().and().formLogin().loginPage("/login")
		.loginProcessingUrl("/perform_login").defaultSuccessUrl("/home", true);
		*/
		
	}
	
	
	@Bean
	public PasswordEncoder getPasswordEncoder() {
	    return PasswordEncoderFactories.createDelegatingPasswordEncoder();
		//return NoOpPasswordEncoder.getInstance();
	}
	

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		//auth.inMemoryAuthentication().withUser("Ajooni").password("Walia").roles("USER");
		auth.inMemoryAuthentication().withUser("Ajooni").roles("ADMIN").password("{noop}Walia");
		//passwordEncoder().encode("Walia")
	}
	
	
	/*
	
	@Bean
	@Override
	protected UserDetailsService userDetailsService() {
		List<UserDetails> users = new ArrayList<UserDetails>();
		users.add(User.withDefaultPasswordEncoder().username("Ajooni").password("walia").roles("USER").build());
		
		return new InMemoryUserDetailsManager(users);
	}
	*/
}

