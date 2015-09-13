package br.com.estrelacarnes.validation;

import javax.inject.Inject;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import br.com.estrelacarnes.dao.UserDao;
import br.com.estrelacarnes.model.User;



public class LoginAvailableValidator
    implements ConstraintValidator<LoginAvailable, User> {
    
    @Inject
    private UserDao userDao;

    @Override
    public void initialize(LoginAvailable constraintAnnotation) {

    }

    @Override
    public boolean isValid(User user, ConstraintValidatorContext context) {
        return !userDao.containsUserWithLogin(user.getLogin());
    }
}
