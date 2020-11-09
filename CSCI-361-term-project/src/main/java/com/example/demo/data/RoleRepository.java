package com.example.demo.data;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.data.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer>{
    public Role findByRoleName(String roleName);

}
