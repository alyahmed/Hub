package ca.ahmedaly.site;

import ca.ahmedaly.site.entities.UserPrincipal;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.validation.annotation.Validated;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

@Validated
public interface UserService extends UserDetailsService
{
    @Override
    UserPrincipal loadUserByUsername(String username);

    void saveUser(
            @NotNull(message = "{validate.authenticate.saveUser}") @Valid
                UserPrincipal principal,
            String newPassword
    );
    
    void saveUserAndAuthenticate(
            @NotNull(message = "{validate.authenticate.saveUser}") @Valid
                UserPrincipal principal,
            String newPassword
    );
    
    
}
