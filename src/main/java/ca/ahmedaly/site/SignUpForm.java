package ca.ahmedaly.site;

import ca.ahmedaly.site.validation.Email;
import java.io.Serializable;

import javax.validation.constraints.Size;

//@PasswordsNotEmpty(
//        passwordFieldName = "password",
//        passwordVerificationFieldName = "passwordVerification"
//)
//@PasswordsNotEqual(
//        passwordFieldName = "password",
//        passwordVerificationFieldName = "passwordVerification"
//)
public class SignUpForm implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Size(min = 2, max = 30)
    private String username;

    @Email
    private String email;

    @Size(max = 100)
    private String firstName;

    @Size(max = 100)
    private String lastName;

    private String password;
    private String passwordVerification;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordVerification() {
        return passwordVerification;
    }

    public void setPasswordVerification(String passwordVerification) {
        this.passwordVerification = passwordVerification;
    }

}
