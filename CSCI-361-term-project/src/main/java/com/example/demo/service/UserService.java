package com.example.demo.service;
import com.example.demo.data.Guest;

public interface UserService {
    public void saveUser(Guest user);

    public boolean isUserAlreadyPresent(Guest user);

}
