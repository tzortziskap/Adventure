/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.serviceImpl;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import teamProject.entity.Equipment;
import teamProject.repository.EquipmentRepo;
import teamProject.service.EquipmentService;

@Transactional
@Service
public class EquipmentServiceImpl implements EquipmentService {
    
@Autowired
    private EquipmentRepo equipmentRepo;

    @Override
    public List<Equipment> getEquipments() {
        return equipmentRepo.findAll();
    }

    @Override
    public void addEquipment(Equipment equipment) {
        equipmentRepo.save(equipment);
    }

    @Override
    public void deleteEquipment(int id) {
        equipmentRepo.deleteById(id);
    }

    @Override
    public Equipment getEquipmentById(int id) {
        return equipmentRepo.findById(id).get();
    }

    @Override
    public Equipment updateEquipment(Equipment equipment) {
        return equipmentRepo.save(equipment);
    }
    
}
