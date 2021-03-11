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
import org.springframework.stereotype.Service;
import teamProject.entity.Company;
import teamProject.entity.Roles;
import teamProject.repository.CompanyRepo;
import teamProject.service.CompanyService;


@Service
@Transactional
public class CompanyServiceImpl implements CompanyService {
    
@Autowired
    private CompanyRepo companyRepo;

    @Override
    public List<Company> getCompanys() {
        return companyRepo.findAll();
    }

    @Override
    public Company addCompany(Company company) {
        return companyRepo.save(company);
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
    public Company updateCompany(Company company) {
        return companyRepo.save(company);
    }
 
   
}
