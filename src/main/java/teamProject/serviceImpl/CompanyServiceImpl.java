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
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import teamProject.entity.Company;
import teamProject.entity.Event;
import teamProject.entity.Roles;
import teamProject.exceptions.EmailExistException;
import teamProject.exceptions.UsernameExistException;
import teamProject.repository.CompanyRepo;
import teamProject.service.CompanyService;
import teamProject.service.CredentialsService;
import teamProject.service.RolesService;

@Service
@Transactional
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyRepo companyRepo;
    @Autowired
    private RolesService rolesService;
    @Autowired
    private CredentialsService credentialsService;
    
    @Override
    public List<Company> getCompanys() {
        return companyRepo.findAll();
    }

    @Override
    public Company addCompany(Company company) throws EmailExistException, UsernameExistException{
        company.getCredentialsId().setRolesId(rolesService.getRolesById(2)); 
        credentialsService.addCredentials(company.getCredentialsId());
        if(companyRepo.findByEmail(company.getEmail())!=null){
            throw new EmailExistException("Υπάρχει ήδη λογαριασμός με αύτο το mail.");
        }
        companyRepo.save(company);
        
        return company;
    }


    @Override
    public void deleteCompany(int id) {
        companyRepo.deleteById(id);
    }

    @Override
    public Company getCompanyById(int id) {
        return companyRepo.findById(id).get();
    }

    @Override
    public Company updateCompany(Company company) throws EmailExistException, UsernameExistException {
              Company newCompany = companyRepo.findById(company.getId()).get();
         if(companyRepo.findByEmail(company.getEmail())!=null && !company.getEmail().equals(newCompany.getEmail())){
            throw new EmailExistException("Υπάρχει ήδη λογαριασμός με αύτο το mail.");
        }
        company.getCredentialsId().setId(newCompany.getCredentialsId().getId());
        credentialsService.updateCredentials(company.getCredentialsId());
        return companyRepo.save(company);
    }

    @Override
    public List<Event> getAllEventsByCompanyId(int id) {
        return companyRepo.allEventsByCompany(id);
    }

}
