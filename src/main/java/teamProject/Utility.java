/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author tzortziskapellas
 */
public class Utility {
    
    public static String getSiteUrl(HttpServletRequest request){
        String siteURL = request.getRequestURL().toString();
        return siteURL.replace(request.getServletPath(), ""); 
    }
}
