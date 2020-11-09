package com.example.demo.service;
import com.example.demo.data.User;

public interface UserService {
    public void saveUser(User user);

    public boolean isUserAlreadyPresent(User user);

}
