/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import teamProject.entity.Credentials;
import teamProject.exceptions.UsernameExistException;

/**
 *
 * @author tzortziskapellas
 */
@Repository
public interface CredentialsRepo extends JpaRepository<Credentials,Integer> {
    
    Credentials findByUsername(String username);
    
    Credentials findByPasswordResetToken(String token);
    
   
}
