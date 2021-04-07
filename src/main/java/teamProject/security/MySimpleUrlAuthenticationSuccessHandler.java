/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teamProject.security;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import teamProject.entity.Credentials;
import teamProject.service.CredentialsService;

/**
 *
 * @author tzortziskapellas
 */
@Component()
public class MySimpleUrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private CredentialsService credentialsService;

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
    
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
            HttpServletResponse response, Authentication authentication)
            throws IOException {
        HttpSession session = request.getSession();
        if (session != null) {
            Credentials loggedInUser = credentialsService.findByUsername(authentication.getName());
            loggedInUser.setPassword(null);
            loggedInUser.setPasswordResetToken(null);
            session.setAttribute("loggedInUser", loggedInUser);
            handle(request, response, authentication);
        }
    }
    protected void handle(
        HttpServletRequest request,
        HttpServletResponse response, 
        Authentication authentication
) throws IOException {

    String targetUrl = determineTargetUrl(authentication);

    redirectStrategy.sendRedirect(request, response, targetUrl);
}
protected String determineTargetUrl(final Authentication authentication) {

    Map<String, String> roleTargetUrlMap = new HashMap<>();
    roleTargetUrlMap.put("CUSTOMER", "/");
    roleTargetUrlMap.put("COMPANY", "/company");

    final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
    for (final GrantedAuthority grantedAuthority : authorities) {
        String authorityName = grantedAuthority.getAuthority();
        if(roleTargetUrlMap.containsKey(authorityName)) {
            return roleTargetUrlMap.get(authorityName);
        }
    }

    throw new IllegalStateException();
}
}
