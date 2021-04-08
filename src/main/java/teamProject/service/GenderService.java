/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.service;

import java.util.List;
import teamProject.entity.Equipment;

/**
 *
 * @author tzortziskapellas
 */

public interface EquipmentService{
    
    List<Equipment> getEquipments();

    void addEquipment(Equipment equipment);

    void deleteEquipment(int id);

    Equipment getEquipmentById(int id) ;

    Equipment updateEquipment(Equipment equipment);
}
