/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package titles.app.security.configuration;


import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        System.out.println("Initializing spring security..");
        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery(
                        "select email,password, enables from user where email=?")
                .authoritiesByUsernameQuery(
                        "select u.email, us.role from mydb.user_role us, mydb.user u where u.id=us.user_id and u.email=?");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

       // need to add my config here to determine which resources accessed by which roles
    }
}
