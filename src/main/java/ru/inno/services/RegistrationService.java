package ru.inno.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import ru.inno.ConnectionManager;
import ru.inno.dao.*;

import java.sql.Connection;
import java.sql.SQLException;



public class RegistrationService {


    //private static ConnectionController connectionController = ConnectionController.createController();

    private static final Logger LOGGER = LoggerFactory.getLogger(EngineImpl.class);


    public void addUser(String name, String login, String password){
        System.out.println("service");

//        PersonDAO dao = new PersonImpl(connectionController.getConnection());
        Connection c = ConnectionManager.getConnection();
        PersonDAO dao = new PersonImpl(c);
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        String passwordHash = encoder.encode(password);
        try {
            dao.addPerson(name, login, passwordHash, "ROLE_USER");
        } catch (SQLException e) {
            LOGGER.error("add user sql error ");
        }
        ConnectionManager.closeConnection(c);
    }
}
