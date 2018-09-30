package croncon.bean;

import javax.persistence.*;


@Entity
@Table(name="user")
public class UserBean {
	@Id
  private int id;
  @Column(name="first_name")
  private String first_name;
  @Column(name="last_name")
  private String last_name;
  @Column(name="email")
  private String email;
  @Column(name="username")
  private String username;
  @Column(name="password")
  private String password;
  @Column(name="user_type")
  private String user_type;
  @Column(name="emp_id")
  private String emp_id;
  @Column(name="status")
  private String status;
  @OneToOne(cascade=CascadeType.ALL)
  @JoinColumn(name="id")
  private ProfileBean profile;
  
public ProfileBean getProfile() {
	return profile;
}
public void setProfile(ProfileBean profile) {
	this.profile = profile;
}
public String getFirst_name() {
	return first_name;
}
public void setFirst_name(String first_name) {
	this.first_name = first_name;
}
public String getLast_name() {
	return last_name;
}
public void setLast_name(String last_name) {
	this.last_name = last_name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}

public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getUser_type() {
	return user_type;
}
public void setUser_type(String user_type) {
	this.user_type = user_type;
}
public String getEmp_id() {
	return emp_id;
}
public void setEmp_id(String emp_id) {
	this.emp_id = emp_id;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}

}
