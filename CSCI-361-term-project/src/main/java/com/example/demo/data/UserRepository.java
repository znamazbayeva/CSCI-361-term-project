package com.example.demo.data;
import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.data.User;
import org.springframework.stereotype.Repository;
import com.example.demo.data.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{

}
