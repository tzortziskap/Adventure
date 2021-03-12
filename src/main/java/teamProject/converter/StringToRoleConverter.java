package teamProject.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import teamProject.entity.Roles;
import teamProject.service.RolesService;


/**
 *
 * @author user
 */
@Component
public class StringToRoleConverter implements Converter<String, Roles>{

    @Autowired
    RolesService service;
    
    @Override
    public Roles convert(String s) {
        int id = Integer.parseInt(s);
        Roles roles = service.getRolesById(id);
        return roles;
    }
    
}
