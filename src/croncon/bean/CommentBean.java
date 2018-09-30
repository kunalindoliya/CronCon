package croncon.bean;

import java.sql.Time;

import javax.persistence.*;

@Entity
@Table(name="comments")
public class CommentBean {
 @Id
 @Column(name="id")
 private int id;
 @Column(name="feed_id")
 private int feed_id;
 @Column(name="name")
 private String name;
 @Column(name="comment")
 private String comment;
 @Column(name="time")
 private Time time;
 @Column(name="day")
private String day;
 @Column(name="image")
 private String image;
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public int getFeed_id() {
	return feed_id;
}
public void setFeed_id(int feed_id) {
	this.feed_id = feed_id;
}
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
public String getComment() {
	return comment;
}
public void setComment(String comment) {
	this.comment = comment;
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
 
}
