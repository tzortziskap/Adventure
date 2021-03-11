/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
import teamProject.entity.Credentials;

/**
 *
 * @author tzortziskapellas
 */

public interface CredentialsService{
    
    List<Credentials> getCredentials();

    Credentials addCredentials(Credentials credentials);

    void deleteCredentials(int id);

    Credentials getCredentialsById(int id) ;

    Credentials updateCredentials(Credentials credentials);
    
    Credentials findByUsername(String username);
    
}
