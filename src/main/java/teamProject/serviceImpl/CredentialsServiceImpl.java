/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import teamProject.entity.Credentials;
import teamProject.entity.Roles;
import teamProject.repository.CredentialsRepo;
import teamProject.service.CredentialsService;

@Service
@Transactional
public class CredentialsServiceImpl implements CredentialsService {

    @Autowired
    private CredentialsRepo credentialRepo;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public List<Credentials> getCredentials() {
        return credentialRepo.findAll();
    }

    @Override
    public Credentials addCredentials(Credentials credential) {
        String plainPassword = credential.getPassword();
        String hashedPassword = passwordEncoder.encode(plainPassword);
        credential.setPassword(hashedPassword);
        return credentialRepo.save(credential);
    }

    @Override
    public void deleteCredentials(int id) {
        credentialRepo.deleteById(id);
    }

    @Override
    public Credentials getCredentialsById(int id) {
        return credentialRepo.findById(id).get();
    }

    @Override
    public Credentials updateCredentials(Credentials credential) {
        return credentialRepo.save(credential);
    }

    @Override
    public Credentials findByUsername(String username) {
        return credentialRepo.findByUsername(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Credentials user = findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("Invalid username");
        }
        return new User(user.getUsername(), user.getPassword(), convertRolesToGrantedAuthorities(user.getRolesId()));
    }

    private List<GrantedAuthority> convertRolesToGrantedAuthorities(Roles roles) {
        List<GrantedAuthority> authorities = new ArrayList();
        GrantedAuthority authority = new SimpleGrantedAuthority(roles.getRole());
        authorities.add(authority);
        return authorities;
    }
    
    public void updateResetPassword(String token, String username){
        
        Credentials credentials = credentialRepo.findByUsername(username);
        if (credentials!=null) {
            credentials.setPasswordResetToken(token);
        } 
    }
    
    public Credentials get(String resetPasswordToken){
        return credentialRepo.findByPasswordResetToken(resetPasswordToken);
    }
    
    public void updatePassword(Credentials credentials,String newPassword){
        String encodePassword = passwordEncoder.encode(newPassword);
        credentials.setPassword(encodePassword);
        credentials.setPasswordResetToken(null);
        credentialRepo.save(credentials);
    }
}
