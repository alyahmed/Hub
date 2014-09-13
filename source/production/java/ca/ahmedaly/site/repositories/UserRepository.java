package ca.ahmedaly.site.repositories;

import ca.ahmedaly.site.entities.UserPrincipal;

import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<UserPrincipal, Long>
{
    UserPrincipal getByUsername(String username);

    
}
