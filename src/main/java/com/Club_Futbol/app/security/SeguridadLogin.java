package com.Club_Futbol.app.security;

//@Configuration
//@EnableWebSecurity
//public class SeguridadLogin extends WebSecurityConfigurerAdapter {

//	String[] resources = new String[] { "/include/**", "/css/**", "/icons/**", "/img/**", "/js/**", "/layer/**", "/" };

//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
		//http.authorizeRequests().antMatchers(resources).permitAll().antMatchers("/", "/bloqueo").permitAll()
		//		.antMatchers("/admin*").access("hasRole('ADMIN')").antMatchers("/user*")
		//		.access("hasRole('USER') or hasRole('ADMIN')").anyRequest().authenticated().and().formLogin()
		//		.loginPage("/login").permitAll().defaultSuccessUrl("/bloqueo").failureUrl("/login?error=true")
		//		.usernameParameter("username").passwordParameter("password").and().logout().permitAll()
		//		.logoutSuccessUrl("/index");
//	}

//	@Bean
//	public static BCryptPasswordEncoder passwordEncoder() {
//		return new BCryptPasswordEncoder();
//	}

//	@Autowired
//	public void configurerGlobal(AuthenticationManagerBuilder builder) throws Exception {

//		PasswordEncoder encoder = passwordEncoder();
//		UserBuilder users = User.builder().passwordEncoder(encoder::encode);
//		builder.inMemoryAuthentication().withUser(users.username("admin").password("123").roles("ADMIN", "USER"))
//				.withUser(users.username("user").password("123").roles("USER"));
//	}
//}
