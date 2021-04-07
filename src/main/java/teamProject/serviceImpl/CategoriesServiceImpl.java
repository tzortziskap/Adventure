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
import teamProject.entity.Categories;
import teamProject.repository.CategoriesRepo;
import teamProject.service.CategoriesService;
import teamProject.service.CategoriesService;

@Transactional
@Service
public class CategoriesServiceImpl implements CategoriesService {
    
@Autowired
    private CategoriesRepo categoriesRepo;

    @Override
    public List<Categories> getCategoriess() {
        return categoriesRepo.findAll();
    }

    @Override
    public void addCategories(Categories categories) {
        categoriesRepo.save(categories);
    }

    @Override
    public void deleteCategories(int id) {
        categoriesRepo.deleteById(id);
    }

    @Override
    public Categories getCategoriesById(int id) {
        return categoriesRepo.findById(id).get();
    }

    @Override
    public Categories updateCategories(Categories categories) {
        return categoriesRepo.save(categories);
    }

    @Override
    public Categories findBycategoryName(String category) {
        return categoriesRepo.findBycategoryName(category);
    }
    
}
