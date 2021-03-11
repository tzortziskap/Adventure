/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
import teamProject.entity.Roles;

/**
 *
 * @author tzortziskapellas
 */
public interface RolesService{
    
    List<Roles> getRoles();

    void addRoles(Roles roles);

    void deleteRoles(int id);

    Roles getRolesById(int id) ;

    Roles updateRoles(Roles roles);
}
