package croncon.bean;


import java.sql.Time;

import javax.persistence.*;

@Entity
@Table(name="feed")
public class FeedBean {
@Id 
@Column(name="id")
private int id;
@Column(name="name")
private String name;
@Column(name="time")
private Time time;
@Column(name="status")
private String status;
@Column(name="day")
private String day;
@Column(name="photo")
private String photo;
@Column(name="image")
private String image;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public Time getTime() {
	return time;
}
public void setTime(Time time) {
	this.time = time;
}
public String getDay() {
	return day;
}
public void setDay(String day) {
	this.day = day;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getPhoto() {
	return photo;
}
public void setPhoto(String photo) {
	this.photo = photo;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}


}
