/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
import teamProject.entity.Company;

/**
 *
 * @author tzortziskapellas
 */

public interface CompanyService{
    
    List<Company> getCompanys();

    Company addCompany(Company company);

    void deleteCompany(int id);

    Company getCompanyById(int id) ;

    Company updateCompany(Company company);
    
}
