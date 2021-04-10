/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;
import teamProject.entity.Credentials;
import teamProject.exceptions.UsernameExistException;
import teamProject.exceptions.CredentialsNotFoundException;

/**
 *
 * @author tzortziskapellas
 */

public interface CredentialsService extends UserDetailsService{
    
    List<Credentials> getCredentials();

    Credentials addCredentials(Credentials credentials) throws UsernameExistException;

    void deleteCredentials(int id);

    Credentials getCredentialsById(int id) ;

    Credentials updateCredentials(Credentials credentials)  throws UsernameExistException;
    
    Credentials findByUsername(String username);
    
    String updateResetPasswordToken(String token, String username) throws CredentialsNotFoundException;
    
    Credentials get(String resetPasswordToken);
    
    void updatePassword(Credentials credentials,String newPassword);
}
