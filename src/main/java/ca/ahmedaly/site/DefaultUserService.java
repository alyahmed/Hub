package ca.ahmedaly.site;

import ca.ahmedaly.site.entities.UserPrincipal;
import ca.ahmedaly.site.repositories.UserRepository;
import ca.ahmedaly.site.util.SecurityUtil;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import javax.inject.Qualifier;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

@Service
public class DefaultUserService implements UserService {

    private static final Logger log = LogManager.getLogger(DefaultUserService.class);

    private static final SecureRandom RANDOM;
    private static final int HASHING_ROUNDS = 10;

    static {
        try {
            RANDOM = SecureRandom.getInstanceStrong();
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException(e);
        }
    }

    @Inject UserRepository userRepository;

    @Override
    @Transactional
    public UserPrincipal loadUserByUsername(String username) {
        UserPrincipal principal = userRepository.getByUsername(username);
        // make sure the authorities and password are loaded
        principal.getAuthorities().size();
        principal.getPassword();
        return principal;
    }

    @Override
    @Transactional
    public void saveUser(UserPrincipal principal, String newPassword) {
        if (newPassword != null && newPassword.length() > 0) {
            String salt = BCrypt.gensalt(HASHING_ROUNDS, RANDOM);
            principal.setHashedPassword(
                    BCrypt.hashpw(newPassword, salt).getBytes()
            );
        }
        this.userRepository.save(principal);
    }

    @Override
    public void saveUserAndAuthenticate(UserPrincipal principal, String newPassword) {
        if (newPassword != null && newPassword.length() > 0) {
            log.info("Encrypting password for user: " + principal);
            String salt = BCrypt.gensalt(HASHING_ROUNDS, RANDOM);
            principal.setHashedPassword(
                    BCrypt.hashpw(newPassword, salt).getBytes()
            );
        }
        log.info("Saving User: " + principal);
        this.userRepository.save(principal);
        log.info("Saved User: " + principal);

    }

}
