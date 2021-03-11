/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.serviceImpl;

import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import teamProject.entity.Credentials;
import teamProject.repository.CredentialsRepo;
import teamProject.service.CredentialsService;


@Service
@Transactional
public class CredentialsServiceImpl implements CredentialsService {
    
@Autowired
    private CredentialsRepo credentialRepo;

    @Override
    public List<Credentials> getCredentials() {
        return credentialRepo.findAll();
    }

    @Override
    public Credentials addCredentials(Credentials credential) {
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
}
