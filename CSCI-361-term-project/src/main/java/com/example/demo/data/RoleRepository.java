package com.example.demo.data;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.data.Role;

public interface RoleRepository extends CrudRepository<Role, Integer>{
    public Role findByRoleName(String roleName);

}
