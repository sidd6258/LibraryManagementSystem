package edu.sjsu.cmpe275.project.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="USER")
public class User {
	@Id
	@Column(name="SJSU_ID")
    private int sjsuId;
	@Column(name="FIRST_NAME")
    private String firstName;
	@Column(name="LAST_NAME")
    private String lastName;
	@Column(name="EMAIL")
    private String email;
	@Column(name="PASSWORD")
    private String password;
	@Column(name="ROLE")
    private String role;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int sjsuId, String firstName, String lastName, String email, String password, String role) {
		super();
		this.sjsuId = sjsuId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.role = role;
	}
	public int getSjsuId() {
		return sjsuId;
	}
	public void setSjsuId(int sjsuId) {
		this.sjsuId = sjsuId;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}


}
