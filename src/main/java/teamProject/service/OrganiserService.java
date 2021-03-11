/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
import teamProject.entity.Organiser;

/**
 *
 * @author tzortziskapellas
 */

public interface OrganiserService{
    
    List<Organiser> getOrganisers();

    Organiser addOrganiser(Organiser organiser);

    void deleteOrganiser(int id);

    Organiser getOrganiserById(int id) ;

    Organiser updateOrganiser(Organiser organiser);
}
