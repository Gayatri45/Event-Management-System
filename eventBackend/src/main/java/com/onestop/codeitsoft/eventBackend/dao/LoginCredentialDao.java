package com.onestop.codeitsoft.eventBackend.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.onestop.codeitsoft.eventBackend.entity.LoginCredentials;

@Repository
public interface LoginCredentialDao extends JpaRepository<LoginCredentials, Integer>{

	@Query(nativeQuery = true, value="SELECT * FROM login_credentials WHERE email =:email AND password =:password")
	public LoginCredentials getCredentialDetailsByEmailPassword(@Param("email") String email,@Param("password") String password);

	@Query(nativeQuery = true, value="SELECT * FROM login_credentials WHERE email =:email")
	public LoginCredentials getCredentialDetailsByEmail(@Param("email") String email);
}
