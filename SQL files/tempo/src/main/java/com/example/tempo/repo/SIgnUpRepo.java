package com.example.tempo.repo;
import org.springframework.data.jpa.repository.JpaRepository;
import com.example.tempo.model.SignUpModel;

public interface SIgnUpRepo extends JpaRepository<SignUpModel,Integer> {

}
